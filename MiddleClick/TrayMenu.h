#import "Controller.h"
#import <Foundation/Foundation.h>

@interface TrayMenu : NSObject <NSFileManagerDelegate> {
@private
  NSStatusItem* _statusItem;
  Controller* myController;
  NSMenuItem* accessibilityPermissionStatusItem;
  NSMenuItem* accessibilityPermissionActionItem;
  NSMenuItem* tapItem;
  NSMenuItem* clickItem;
}
- (id)initWithController:(Controller*)ctrl;
- (void)setChecks;
- (void)setClick:(id)sender;
- (void)setTap:(id)sender;
@end
