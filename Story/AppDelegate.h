//
//  AppDelegate.h
//  Story
//
//  Created by Isken Huang on 10/2/12.
//  Copyright (c) 2012 Isken Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIViewController *centerController;
@property (strong, nonatomic) UIViewController *leftController;

@end
