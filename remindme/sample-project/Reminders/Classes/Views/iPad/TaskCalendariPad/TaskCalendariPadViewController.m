//
//  TaskCalendariPadViewController.m
//  Reminders
//
//  Created by Valentin Filip on 9/10/12.
//  Copyright (c) 2012 AppDesignVault. All rights reserved.
//

#import "TaskCalendariPadViewController.h"

#import "CalendarCell.h"
#import "ADVTheme.h"

@interface TaskCalendariPadViewController () {
    NSArray *items;
}

@property (nonatomic, strong) NSArray *items;

@end

@implementation TaskCalendariPadViewController

@synthesize tableView;
@synthesize items;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    [ADVThemeManager customizeView:self.view];
    self.tableView.tableHeaderView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"list-header-bg"]];
    
    self.items = @[@{@"title": @"Get the groceries"
                   , @"time": @"09:00 AM to 10:00 AM"}
                  , @{@"title": @"Conference call with Simon"
                     , @"description": @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"
                     , @"time": @"10:00 AM to 11:00 AM"
                     , @"done": @YES}
                  , @{@"title": @"Call Brad Pitt"
                     , @"description": @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                     , @"image": @"user-icon"
                     , @"time": @"11:00 AM to 12:00 AM"}];
    
//    UIImage *imgBkgView = [UIImage imageNamed:@"list-header-bg"];
//    UIImageView *bkgView = [[UIImageView alloc] initWithImage:[imgBkgView resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)]];
//    [self.tableView setTableHeaderView:bkgView];
}

- (void)viewDidUnload {
    [self setTableView:nil];
    [self setItems:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CalendarCell";
    CalendarCell *cell = [aTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    UIImage *imgBkgView = [UIImage imageNamed:@"list-item-calendar"];
    UIImageView *bkgView = [[UIImageView alloc] initWithImage:[imgBkgView resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5)]];
    cell.backgroundView = bkgView;
    
    NSDictionary *item = (self.items)[indexPath.row];
    
    NSNumber *done = item[@"done"];
    if ([done boolValue]) {
        cell.checkbox.checked = YES;
    }
    
    NSString *imgName = item[@"image"];
    CGFloat imgWidth = 0;
    CGFloat imgHeight = 0;
    if (imgName) {
        imgWidth = 162;
        imgHeight = 117;
    }
    
    NSString *description = [item valueForKey:@"description"];
    CGSize constraint = CGSizeMake(self.tableView.contentSize.width - imgWidth - 40, 2000);
    CGSize textSize = [description sizeWithFont:[UIFont fontWithName:@"Helvetica Neue" size:13.0] constrainedToSize:constraint];
    
    CGFloat textHeight = textSize.height > 0 ? textSize.height + 10 : 0;
    CGFloat calcHeight = imgHeight > textHeight ? imgHeight + 10 : textHeight;
    
    
    cell.titleLabel.text = item[@"title"];
    cell.textDescription.text = description;
    CGRect descFrame = cell.textDescription.frame;
    descFrame.origin.x = imgWidth > 0 ? 182 : 20;
    descFrame.size.height = textHeight;
    descFrame.size.width = self.tableView.contentSize.width - imgWidth - 40;
    cell.textDescription.frame = descFrame;
    
    if (imgName) {
        cell.imageView.hidden = NO;
        cell.imageView.image = [UIImage imageNamed:imgName];
    }
    
    cell.timeLabel.text = item[@"time"];
    CGRect timeFrame = cell.timeLabel.frame;
    timeFrame.origin.y = 50 + calcHeight + 8;
    cell.timeLabel.frame = timeFrame;
    
    return cell;
}


#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *item = (self.items)[indexPath.row];
    NSString *imgName = item[@"image"];
    CGFloat imgWidth = 0;
    CGFloat imgHeight = 0;
    if (imgName) {
        imgWidth = 162;
        imgHeight = 117;
    }
    
    NSString *description = [item valueForKey:@"description"];
    CGSize constraint = CGSizeMake(self.tableView.contentSize.width - imgWidth - 40, 2000);
    CGSize textSize = [description sizeWithFont:[UIFont fontWithName:@"Helvetica Neue" size:13.0] constrainedToSize:constraint];
    CGFloat textHeight = textSize.height > 0 ? textSize.height + 10 : 0;
    CGFloat calcHeight = imgHeight > textHeight ? imgHeight + 10 : textHeight;
    
    return calcHeight > 0 ? calcHeight + 90 : 90;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
