//
//  Controller.m
//  MiddleClick
//
//  Created by Alex Galonsky on 11/9/09.
//  Extended by Pascal Hartmann on 13.02.2019
//

#import "Controller.h"
#import <Cocoa/Cocoa.h>
#include <math.h>
#include <unistd.h>
#include <CoreFoundation/CoreFoundation.h>
#import <Foundation/Foundation.h> 
#import "WakeObserver.h"
#include "TrayMenu.h"

/***************************************************************************
 *
 * Multitouch API
 *
 ***************************************************************************/

typedef struct { float x,y; } mtPoint;
typedef struct { mtPoint pos,vel; } mtReadout;

typedef struct {
    int frame;
    double timestamp;
    int identifier, state, foo3, foo4;
    mtReadout normalized;
    float size;
    int zero1;
    float angle, majorAxis, minorAxis; // ellipsoid
    mtReadout mm;
    int zero2[2];
    float unk2;
} Finger;

typedef void *MTDeviceRef;
typedef int (*MTContactCallbackFunction)(int,Finger*,int,double,int);

MTDeviceRef MTDeviceCreateDefault(void);
CFMutableArrayRef MTDeviceCreateList(void); 
void MTRegisterContactFrameCallback(MTDeviceRef, MTContactCallbackFunction);
void MTDeviceStart(MTDeviceRef, int); // thanks comex
void MTDeviceStop(MTDeviceRef);

NSDate *touchStartTime;
float middleclickX, middleclickY;
float middleclickX2, middleclickY2;
MTDeviceRef dev;

BOOL needToClick;
BOOL threeDown;
BOOL maybeMiddleClick;
BOOL wasThreeDown;

@implementation Controller

- (void) start {
	threeDown = NO;
    wasThreeDown = NO;
    
    needToClick = [[NSUserDefaults standardUserDefaults] boolForKey:@"need_to_click"];
    
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];	
    [NSApplication sharedApplication];
	
	
	//Get list of all multi touch devices
	NSMutableArray* deviceList = (NSMutableArray*)MTDeviceCreateList(); //grab our device list
	
	
	//Iterate and register callbacks for multitouch devices.
	for(int i = 0; i<[deviceList count]; i++) //iterate available devices
	{
        MTRegisterContactFrameCallback((MTDeviceRef)[deviceList objectAtIndex:i], touchCallback); //assign callback for device
        MTDeviceStart((MTDeviceRef)[deviceList objectAtIndex:i],0); //start sending events
	}
	
	//register a callback to know when osx come back from sleep
	WakeObserver *wo = [[WakeObserver alloc] init];
	[[[NSWorkspace sharedWorkspace] notificationCenter] addObserver: wo selector: @selector(receiveWakeNote:) name: NSWorkspaceDidWakeNotification object: NULL];
    
    //we only want to see left mouse down and left mouse up, because we onky wnat to change that one
	CGEventMask eventMask = (CGEventMaskBit(kCGEventLeftMouseDown)  | CGEventMaskBit(kCGEventLeftMouseUp));
    
    //create eventTap which listens for core grpahic events with the filter sepcified above (so left mouse down and up again)
    CFMachPortRef eventTap = CGEventTapCreate(kCGHIDEventTap, kCGHeadInsertEventTap, kCGEventTapOptionDefault, eventMask, mouseCallback, NULL);
    
    if (!eventTap) {
        NSLog(@"Couldn't create event tap!");
        exit(1);
    }
    
    // Add to the current run loop.
    CFRunLoopSourceRef runLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, eventTap, 0);
    CFRunLoopAddSource(CFRunLoopGetCurrent(), runLoopSource,kCFRunLoopCommonModes);
    
    // Enable the event tap.
    CGEventTapEnable(eventTap, true);
    
    // Set it all running.
   
    TrayMenu *menu = [[TrayMenu alloc] initWithController:self];
    [NSApp setDelegate:menu];
    [NSApp run];
    CFRunLoopRun();
    
    //release pool before exit
	[pool release];
}

- (BOOL)getClickMode {
    return needToClick;
}

- (void)setMode:(BOOL)click {
    [[NSUserDefaults standardUserDefaults] setBool:click forKey:@"need_to_click"];
    needToClick = click;
}

//listening to mouse clicks to replace them with middle clicks if there are 3 fingers down at the time of clicking
//this is done by replacing the left click down with a other click down and setting the button number to middle click when
//3 fingers are down when clicking, and by replacing left click up with other click up and setting three button number to middle click
//when 3 fingers were down when the last click went down.
CGEventRef mouseCallback(CGEventTapProxy proxy, CGEventType type, CGEventRef event, void *refcon) {
    if(needToClick){
        if (threeDown && type == kCGEventLeftMouseDown) {
            wasThreeDown = YES;
            CGEventSetType(event, kCGEventOtherMouseDown);
            CGEventSetIntegerValueField(event, kCGMouseEventButtonNumber, kCGMouseButtonCenter);
            threeDown=NO;
        }
        
        if (wasThreeDown && type == kCGEventLeftMouseUp) {
            wasThreeDown = NO;
            CGEventSetType(event, kCGEventOtherMouseUp);
            CGEventSetIntegerValueField(event, kCGMouseEventButtonNumber, kCGMouseButtonCenter);
        }
        
        
    }
    return event;
}

//mulittouch callback, see what is touched. If 3 are on the mouse set threedowns, else unset threedowns.
int touchCallback(int device, Finger *data, int nFingers, double timestamp, int frame) {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];	
    
    if(needToClick) {
        if(nFingers == 3){
            if(!threeDown){
                threeDown = YES;
            }
        }
        
        if(nFingers == 0){
            if(threeDown){
                threeDown = NO;
            }
        }
    }
    else {
        if (nFingers==0) {
            touchStartTime = NULL;
            if(middleclickX+middleclickY) {
                float delta = ABS(middleclickX-middleclickX2)+ABS(middleclickY-middleclickY2);
                if (delta < 0.4f) {
                    // Emulate a middle click
                    
                    // get the current pointer location
                    CGEventRef ourEvent = CGEventCreate(NULL);
                    CGPoint ourLoc = CGEventGetLocation(ourEvent);
                    
                    CGEventPost (kCGHIDEventTap, CGEventCreateMouseEvent (NULL,kCGEventOtherMouseDown,ourLoc,kCGMouseButtonCenter));
                    CGEventPost (kCGHIDEventTap, CGEventCreateMouseEvent (NULL,kCGEventOtherMouseUp,ourLoc,kCGMouseButtonCenter));
                    
                }
            }
        } else if (nFingers>0 && touchStartTime == NULL) {
            NSDate *now = [[NSDate alloc] init];
            touchStartTime = [now retain];
            [now release];
            
            maybeMiddleClick = YES;
            middleclickX = 0.0f;
            middleclickY = 0.0f;
        } else {
            if (maybeMiddleClick==YES){
                NSTimeInterval elapsedTime = -[touchStartTime timeIntervalSinceNow];
                if (elapsedTime > 0.5f)
                    maybeMiddleClick = NO;
            }
        }
        
        if (nFingers>3) {
            maybeMiddleClick = NO;
            middleclickX = 0.0f;
            middleclickY = 0.0f;
        }
        
        if (nFingers==3) {
            Finger *f1 = &data[0];
            Finger *f2 = &data[1];
            Finger *f3 = &data[2];
            
            if (maybeMiddleClick==YES) {
                middleclickX = (f1->normalized.pos.x+f2->normalized.pos.x+f3->normalized.pos.x);
                middleclickY = (f1->normalized.pos.y+f2->normalized.pos.y+f3->normalized.pos.y);
                middleclickX2 = middleclickX;
                middleclickY2 = middleclickY;
                maybeMiddleClick=NO;
            } else {
                middleclickX2 = (f1->normalized.pos.x+f2->normalized.pos.x+f3->normalized.pos.x);
                middleclickY2 = (f1->normalized.pos.y+f2->normalized.pos.y+f3->normalized.pos.y);
            }
        }
    }
    
    [pool release];
    return 0;
}

@end
