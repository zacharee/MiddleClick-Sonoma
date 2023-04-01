#import "Controller.h"
#import "TrayMenu.h"

int main(int argc, char* argv[])
{
  NSDictionary *appDefaults = [NSDictionary
                               dictionaryWithObject:[NSNumber numberWithInt:3] forKey:@"fingers"];
  
  [[NSUserDefaults standardUserDefaults] registerDefaults:appDefaults];
  
  NSApplication* app = [NSApplication sharedApplication];
  
  Controller* con = [Controller new];
  [con start];
  
  // add Menu Bar item
  TrayMenu* menu = [[TrayMenu alloc] initWithController:con];
  [app setDelegate:(id<NSApplicationDelegate>)menu];
  
  [app run];
  
  return EXIT_SUCCESS;
}
