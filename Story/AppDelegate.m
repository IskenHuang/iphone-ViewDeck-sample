//
//  AppDelegate.m
//  Story
//
//  Created by Isken Huang on 10/2/12.
//  Copyright (c) 2012 Isken Huang. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "IIViewDeckController.h"
#import "LeftSlideViewController.h"
#import "ConnectViewController.h"
#import "DiscoverViewController.h"

@implementation AppDelegate

@synthesize centerController = _viewController;
@synthesize leftController = _leftController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.leftController = [[LeftSlideViewController alloc] initWithNibName:@"LeftSlideViewController" bundle:nil];
    
    ViewController *centerController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    ConnectViewController *connctViewController = [[ConnectViewController alloc] initWithNibName:@"ConnectViewController" bundle:nil];
    DiscoverViewController *discoverViewController = [[DiscoverViewController alloc] initWithNibName:@"DiscoverViewController" bundle:nil];
    NSArray *tabArray = [NSArray arrayWithObjects:centerController, connctViewController, discoverViewController, nil];
    
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    [tabbarController setDelegate:self];
    [tabbarController setViewControllers:tabArray];
    
    UINavigationController *naviController = [[UINavigationController alloc] initWithRootViewController:tabbarController];
    IIViewDeckController* deckController =  [[IIViewDeckController alloc] initWithCenterViewController:naviController
                                                                                    leftViewController:self.leftController];
    deckController.leftLedge = 100;
    self.window.rootViewController = deckController;
    [self.window makeKeyAndVisible];
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
