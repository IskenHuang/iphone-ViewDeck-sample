//
//  StoryTableView.m
//  Story
//
//  Created by Isken Huang on 10/2/12.
//  Copyright (c) 2012 Isken Huang. All rights reserved.
//

#import "StoryTableView.h"
#import "StoryObject.h"

#define CELL_SPLIT 120
#define CELL_HEIGHT 100

@implementation StoryTableView

@synthesize dataArray;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

        self.dataArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 100 ; i++) {
            int temp = i % 4;
            StoryObject *obj = [StoryObject new];
            if (temp == 1) {
                [obj setImage:[UIImage imageNamed:@"p1.png"]];
            }else if(temp == 2){
                [obj setText:@"苹果最近更新了一些应用商店条款"];
                [obj setImage:[UIImage imageNamed:@"p2.png"]];
            }else if(temp == 3){
                [obj setText:@"开发者文档里出现了个新组件叫SKStoreProductView Controller"];
                [obj setImage:[UIImage imageNamed:@"p3.png"]];
            }else{
                [obj setText:@"这似乎也意味着APP STORE并没有完全禁止这种应用推荐类的应用"];
            }
            [self.dataArray addObject:obj];
        }
        
        UITableView *myTableView = [[UITableView alloc] initWithFrame:frame];
        [myTableView setDelegate:self];
        [myTableView setDataSource:self];
        [self addSubview:myTableView];
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.dataArray.count;
}

-(float) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CELL_HEIGHT;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    CGRect textViewFrame, imageFrame;
    
    if ([[self.dataArray objectAtIndex:indexPath.row] image] == nil) {
        imageFrame = CGRectMake(0, 0, 0, 0);
        textViewFrame = CGRectMake(0, 0, self.frame.size.width, CELL_HEIGHT);
    }else if([[self.dataArray objectAtIndex:indexPath.row] text] == nil) {
        imageFrame = CGRectMake(0, 0, self.frame.size.width, CELL_HEIGHT);;
        textViewFrame = CGRectMake(0, 0, self.frame.size.width, CELL_HEIGHT);
    }else{
        int random = arc4random() % 2;	
        if (random == 0) {
            imageFrame = CGRectMake(CELL_SPLIT, 0, cell.frame.size.width - CELL_SPLIT, CELL_HEIGHT);
            textViewFrame = CGRectMake(0, 0, CELL_SPLIT, CELL_HEIGHT);
        }else{
            imageFrame = CGRectMake(0, 0, self.frame.size.width - CELL_SPLIT, CELL_HEIGHT);
            textViewFrame = CGRectMake(self.frame.size.width - CELL_SPLIT, 0, CELL_SPLIT, CELL_HEIGHT);
        }
    }
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:textViewFrame];
    [textLabel setTextAlignment:NSTextAlignmentCenter];
    [textLabel setTextColor:[UIColor whiteColor]];
    [textLabel setFont:[UIFont systemFontOfSize:18]];
    NSString *tempString = [[self.dataArray objectAtIndex:indexPath.row] text];
    [textLabel setText:tempString];
    if (textLabel.text.length > 10) {
        textLabel.lineBreakMode = UILineBreakModeWordWrap;
        textLabel.numberOfLines = 2;
    }
    [textLabel setBackgroundColor:[UIColor colorWithRed:(0/255.0) green:(200/255.0) blue:(90/255.0) alpha:1.0]];
    [textLabel setUserInteractionEnabled:NO];
    [cell addSubview:textLabel];
    
    UIImageView *myImageView = [[UIImageView alloc] initWithFrame:imageFrame];
    [myImageView setBackgroundColor:[UIColor whiteColor]];
    [myImageView setContentMode:UIViewContentModeScaleToFill];
    [myImageView setImage:[[self.dataArray objectAtIndex:indexPath.row] image]];
    [cell addSubview:myImageView];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath = %@ || %@ || %@", indexPath, [[self.dataArray objectAtIndex:indexPath.row] text], [[self.dataArray objectAtIndex:indexPath.row] image]);
}

@end
