//
//  StoryTableView.h
//  Story
//
//  Created by Isken Huang on 10/2/12.
//  Copyright (c) 2012 Isken Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoryTableView : UIView<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *dataArray;

@end
