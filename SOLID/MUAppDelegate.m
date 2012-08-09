//
//  MUAppDelegate.m
//  SOLID
//
//  Created by Kevin Munc on 7/8/12.
//  Copyright (c) 2012 Method Up. All rights reserved.
//

#import "MUAppDelegate.h"

@implementation MUAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;

        // NOTE: Change the one-line statement into the loop below it.
        //       This was done to deal with the the issue of the unit tests failing in Jenkins
        //       if the simulator was last in iPad mode.
        //       The failure was due to the navigationController (somehow) really being the MUMasterViewController.
        //       Another option would be to use PListBuddy to ensure the simulator runs in iPhone mode beforehand.
        // UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
        UINavigationController *navigationController = nil;
        for (UIViewController *vc in splitViewController.viewControllers) {
            if ([vc isKindOfClass:[UINavigationController class]]) {
                navigationController = (UINavigationController *)vc;
                break;
            }
        }
        if (!navigationController) {
            NSLog(@"Unable to locate navigation controller!");
            return NO;
        } // else, we found it, so proceed
        splitViewController.delegate = (id)navigationController.topViewController;
    }
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
