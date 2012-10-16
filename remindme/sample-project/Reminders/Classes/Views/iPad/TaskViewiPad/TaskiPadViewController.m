//
//  TaskiPadViewController.m
//  Reminders
//
//  Created by Valentin Filip on 9/10/12.
//  Copyright (c) 2012 AppDesignVault. All rights reserved.
//

#import "TaskiPadViewController.h"
#import "ReminderCell.h"
#import "ADVTheme.h"

#import "AppDelegate.h"
#import "TaskCalendariPadViewController.h"
#import "MasteriPadViewController.h"
#import "StackScrollViewController.h"

@interface TaskiPadViewController ()

@end

@implementation TaskiPadViewController
@synthesize tableView;
@synthesize items;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ADVThemeManager customizeTableView:self.tableView];
    self.tableView.scrollEnabled = YES;
    
    self.items = @[@{@"title": @"Home"
              , @"value": @12}
             , @{@"title": @"Work"
                , @"value": @8}
             , @{@"title": @"France trip"
                , @"value": @41}
             , @{@"title": @"Pending"
                , @"value": @10}
             , @{@"title": @"Personal"
                , @"value": @12}
             , @{@"title": @"Surfing"
                , @"value": @8}
             , @{@"title": @"Car"
                , @"value": @41}];
    
    UIImageView *imgTableFooter = [[UIImageView alloc] initWithImage:[[ADVThemeManager sharedTheme] tableFooterBackground]];
    [self.tableView setTableFooterView:imgTableFooter];
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self performSelector:@selector(selectTask) withObject:nil afterDelay:0.01];
}

- (void)viewDidUnload {
    [self setTableView:nil];
    self.items = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Accessors

- (void)setItems:(NSArray *)newItems {
    if ([items isEqualToArray:newItems]) {
        return;
    }
    items = newItems;
    [self.tableView reloadData];
}

#pragma mark - Actions

- (void)selectTask {
    if (!self.items.count) {
        return;
    }
    NSIndexPath *firstRow = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView selectRowAtIndexPath:firstRow animated:NO scrollPosition:UITableViewScrollPositionTop];
    [self tableView:self.tableView didSelectRowAtIndexPath:firstRow];    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.items count];;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    aTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    ReminderCell *cell = (ReminderCell *)[aTableView dequeueReusableCellWithIdentifier:@"ReminderCell"];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"list-item.png"]];
    cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"list-item-selected.png"]];
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    NSDictionary *item = (self.items)[indexPath.row];
    
    cell.titleLabel.text = [item valueForKey:@"title"];
    cell.lblNotificationValue.text = [NSString stringWithFormat:@"%@", [item valueForKey:@"value"]];
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 47.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TaskCalendariPadViewController *calendarVC = [self.storyboard instantiateViewControllerWithIdentifier:@"TaskCalendarVC"];
    calendarVC.view.frame = CGRectMake(0, 0, 679, self.view.frame.size.height);
    [((MasteriPadViewController *)[AppDelegate sharedDelegate].mainVC).stackScrollViewController addViewInSlider:calendarVC invokeByController:self isStackStartView:FALSE];
}

@end
