//
//  AppDelegate.m
//  rivals
//
//  Created by Stephen on 9/27/16.
//  Copyright © 2016 sdbrown2. All rights reserved.
//

#import "AppDelegate.h"
#import "FRDStravaClientImports.h"
#import "AuthenticationViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

NSString * const kAppSecret     = @"b015a60f6dde93d0be4646f422762ec024a97bb0";
int kAppClientId                = 13793;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[FRDStravaClient sharedInstance] initializeWithClientId:kAppClientId clientSecret:kAppSecret];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    [[FRDStravaClient sharedInstance] parseStravaAuthCallback:url
                                                  withSuccess:^(NSString *stateInfo, NSString *code) {
                                                      NSLog(@"Code success");
                                                      //get the view, finish token exchange
                                                      AuthenticationViewController *vc = (AuthenticationViewController *)self.window.rootViewController;
                                                      [vc exchangeTokenForCode:code];
                                                  }
                                                      failure:^(NSString *stateInfo, NSString *error) {
                                                          //show an alert
                                                          NSLog(@"Code fail");
                                                      }];
    
    return YES;
}


@end
