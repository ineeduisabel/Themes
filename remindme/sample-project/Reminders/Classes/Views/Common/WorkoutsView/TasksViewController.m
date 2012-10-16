//
//  FirstViewController.m
//  
//
//  Created by Valentin Filip on 7/9/12.
//  Copyright (c) 2012 AppDesignVault. All rights reserved.
//

#import "TasksViewController.h"
#import "DetailViewController.h"
#import "TaskCell.h"
#import "ADVTheme.h"

@interface TasksViewController ()

@end

@implementation TasksViewController

@synthesize items;

- (void)viewDidLoad {
    [super viewDidLoad];
        
    [ADVThemeManager customizeTableView:self.tableView];
    self.tableView.scrollEnabled = YES;
    
    self.items = @[@{@"title": @"Take dog out"
                   , @"done": @YES
                   , @"time": @"12:00"}
                  , @{@"title": @"Sign new partnership contract"
                     , @"done": @NO
                     , @"time": @"23:00"}
                  , @{@"title": @"Buy present for Brain"
                     , @"done": @YES
                     , @"time": @"23:00"}
                  , @{@"title": @"Meet Joe at 13:00"
                     , @"done": @YES
                     , @"time": @"Tomorrow"}
                  , @{@"title": @"Pay electricity bill"
                     , @"done": @NO
                     , @"time": @"18 August 2012"}
                  , @{@"title": @"Buy a new surf board"
                     , @"done": @NO
                     , @"time": @"21 August 2012"}];
    
    UIImageView *imgTableFooter = [[UIImageView alloc] initWithImage:[[ADVThemeManager sharedTheme] tableFooterBackground]];
    [self.tableView setTableFooterView:imgTableFooter];
    [self.tableView reloadData];
    
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
    }
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    TaskCell *cell = (TaskCell *)[self.tableView dequeueReusableCellWithIdentifier:@"TaskCell"];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"list-item-checkable.png"]];
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    NSDictionary *item = (self.items)[indexPath.row];
    
    cell.titleLabel.text = [item valueForKey:@"title"];
    cell.timeLabel.text = [item valueForKey:@"time"];
    cell.checkbox.checked = [[item valueForKey:@"done"] boolValue];
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 47.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        NSDictionary *object = items[indexPath.row];
        self.detailViewController.detailItem = object;
    } else {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

@end
