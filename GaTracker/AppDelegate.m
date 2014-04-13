//
//  AppDelegate.m
//  GaTracker
//
//  Created by Rockstar. on 3/3/14.
//
//

#import "AppDelegate.h"
#import "LocalyticsSession.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self _loadSharedInstance];
    [[LocalyticsSession shared] resume];
    [[LocalyticsSession shared] upload];
    return YES;
}

- (void)_loadSharedInstance
{
    [GATrackingService sharedInstance];
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    [[LocalyticsSession shared] close];
    [[LocalyticsSession shared] upload];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [[LocalyticsSession shared] close];
    [[LocalyticsSession shared] upload];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [[LocalyticsSession shared] resume];
    [[LocalyticsSession shared] upload];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [[LocalyticsSession shared] close];
    [[LocalyticsSession shared] upload];
}

@end
