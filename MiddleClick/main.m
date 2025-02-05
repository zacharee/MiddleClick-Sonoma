#import "MiddleClick-Swift.h"
#import "TrayMenu.h"

int main(int argc, char* argv[])
{
  id keys[] = {
    MiddleClickConfig.fingersNumKey,
    MiddleClickConfig.allowMoreFingersKey,
    MiddleClickConfig.maxDistanceDeltaKey,
    MiddleClickConfig.maxTimeDeltaMsKey,
  };
  id objects[] = {
    [NSNumber numberWithInt:MiddleClickConfig.fingersNumDefault],
    [NSNumber numberWithBool:MiddleClickConfig.allowMoreFingersDefault],
    [NSNumber numberWithFloat:MiddleClickConfig.maxDistanceDeltaDefault],
    [NSNumber numberWithInt:MiddleClickConfig.maxTimeDeltaMsDefault],
  };
  NSUInteger count = sizeof(objects) / sizeof(id);
  NSDictionary *appDefaults = [NSDictionary
                               dictionaryWithObjects:objects
                               forKeys:keys
                               count:count];
  
  [[NSUserDefaults standardUserDefaults] registerDefaults:appDefaults];
  
  NSApplication* app = [NSApplication sharedApplication];
  
  Controller* con = [Controller new];
  [con start];
  
  // add Menu Bar item
  TrayMenu* menu = [[TrayMenu alloc] initWithController:con];
  [app setDelegate:(id<NSApplicationDelegate>)menu];
  
  [app run];
  
  // Suppress memory leak warnings in "Product" > "Analyze". It sounds pointless releasing objects right before the app closes and releases absolutely everything — but I'm OK with it as long as no warnings occur.
  [con release];
  [menu release];
  
  return EXIT_SUCCESS;
}
