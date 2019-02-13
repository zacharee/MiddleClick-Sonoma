//
//  Controller.h
//  MiddleClick
//
//  Created by Alex Galonsky on 11/9/09.
//  Extended by Pascal Hartmann on 13.02.2019
//

#import <Cocoa/Cocoa.h>


@interface Controller : NSObject {

}

- (void) start;
- (void)setMode:(BOOL)click;
- (BOOL)getClickMode;

@end
