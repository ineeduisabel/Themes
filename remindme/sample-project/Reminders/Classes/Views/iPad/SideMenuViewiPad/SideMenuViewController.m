//
//  SideMenuViewController.m
//  Reminders
//
//  Created by Valentin Filip on 9/10/12.
//  Copyright (c) 2012 AppDesignVault. All rights reserved.
//

#import "SideMenuViewController.h"
#import "MasteriPadViewController.h"
#import "StackScrollViewController.h"
#import "TaskiPadViewController.h"
#import "AppDelegate.h"

@interface SideMenuViewController () {
    TaskiPadViewController *childVC;
}

@property (nonatomic, strong) TaskiPadViewController *childVC;

@end

@implementation SideMenuViewController

@synthesize tableView = _tableView;
@synthesize currentlySelectedIndex;
@synthesize childVC;

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSIndexPath *firstRow = [NSIndexPath indexPathForRow:0 inSection:0];
    [_tableView selectRowAtIndexPath:firstRow animated:NO scrollPosition:UITableViewScrollPositionTop];
    [self tableView:_tableView didSelectRowAtIndexPath:firstRow];
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
	[super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
		[cell setSelectedBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sidemenu-item-selected"]]];
        
        UIImageView *menuIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 8, tableView.bounds.size.width, 30)];
        menuIcon.tag = 1;
        menuIcon.contentMode = UIViewContentModeCenter;
        [cell addSubview:menuIcon];
        
        UILabel *lblMenu = [[UILabel alloc] initWithFrame:CGRectMake(0, 42, tableView.bounds.size.width, 16)];
        lblMenu.tag = 2;
        lblMenu.textAlignment = UITextAlignmentCenter;
        lblMenu.backgroundColor = [UIColor clearColor];
        lblMenu.textColor = [UIColor colorWithRed:0.68f green:0.68f blue:0.68f alpha:1.00f];
        lblMenu.font = [UIFont systemFontOfSize:12];
        [cell addSubview:lblMenu];
    }
    
    NSString *imageName, *title;
    switch (indexPath.row) {
        case 0:
            imageName = @"sidemenu-item-check";
            title = @"Completed";
            break;
        case 1:
            imageName = @"sidemenu-item-list";
            title = @"Overdue";
            break;
        case 2:
            imageName = @"sidemenu-item-calendar";
            title = @"Today";
            break;
        case 3:
            imageName = @"sidemenu-item-clock";
            title = @"Pending";
            break;
        default:
            break;
    }
    
    UIImageView *menuIcon = (UIImageView *)[cell viewWithTag:1];
    menuIcon.image = [UIImage imageNamed:imageName];
    
    UILabel *lblMenu = (UILabel *)[cell viewWithTag:2];
    lblMenu.text = title;
    
    return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 62;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
        TaskiPadViewController *taskiPadVC = [self.storyboard instantiateViewControllerWithIdentifier:@"TaskiPadVC"];
        taskiPadVC.view.frame = CGRectMake(0, 0, 275, self.view.frame.size.height);
        [((MasteriPadViewController *)[AppDelegate sharedDelegate].mainVC).stackScrollViewController addViewInSlider:taskiPadVC invokeByController:self isStackStartView:YES];
        childVC = taskiPadVC;
    
}

@end
