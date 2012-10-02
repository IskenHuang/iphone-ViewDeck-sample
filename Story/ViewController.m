//
//  ViewController.m
//  Story
//
//  Created by Isken Huang on 10/2/12.
//  Copyright (c) 2012 Isken Huang. All rights reserved.
//

#import "ViewController.h"
#import "StoryTableView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UITabBarItem *item = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:0];
    self.tabBarItem = item;
    
    StoryTableView *storyTableView = [[StoryTableView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:storyTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
