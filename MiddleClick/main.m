#import "Controller.h"
#import "TrayMenu.h"

int main(int argc, char* argv[])
{
  NSApplication* app = [NSApplication sharedApplication];
  
  Controller* con = [[Controller alloc] init];
  [con start];
  
  // add Menu Bar item
  TrayMenu* menu = [[TrayMenu alloc] initWithController:con];
  [app setDelegate:menu];
  
  [app run];
  
  return EXIT_SUCCESS;
}
