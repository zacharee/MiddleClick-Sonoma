//
//  MiddleClick
//  main.m
//
//  Created by Clem on 21.06.09.
//

#import "Controller.h"
#import "TrayMenu.h"

int main(int argc, char* argv[])
{
    NSApplication* app = [NSApplication sharedApplication];

    Controller* con = [[Controller alloc] init];
    [con start];

    // add traymenu
    TrayMenu* menu = [[TrayMenu alloc] initWithController:con];
    [app setDelegate:menu];

    [app run];

    return EXIT_SUCCESS;
}
