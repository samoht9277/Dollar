//
//  main.m
//  Dollar
//
//  Created by Tomi on 28/11/2021.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}


