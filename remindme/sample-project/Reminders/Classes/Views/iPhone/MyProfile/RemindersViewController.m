//
//  ProfileViewController.m
//  Reminders
//
//  Created by Valentin Filip on 8/8/12.
//  Copyright (c) 2012 AppDesignVault. All rights reserved.
//

#import "RemindersViewController.h"
#import "ADVTheme.h"
#import "ReminderCell.h"

@interface RemindersViewController ()

@end

@implementation RemindersViewController

@synthesize groups, subGroups, groupIcons, selectedGroupIcons;

#pragma mark - View lifecycle


- (id) init
{
    if (self = [super initWithNibName:@"SDNestedTableView" bundle:nil])
    {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	    
    [ADVThemeManager customizeTableView:self.tableView];
    
    self.groups = @[@{@"title": @"Completed"
                   , @"value": @12}
                  , @{@"title": @"Overdue"
                     , @"value": @8}
                  , @{@"title": @"Today"
                     , @"value": @41}
                  , @{@"title": @"Pending"
                     , @"value": @10}];
    
    self.subGroups = @[@[@{@"title": @"Home"
                        , @"value": @12}
                       , @{@"title": @"Work"
                          , @"value": @8}
                       , @{@"title": @"Finance"
                          , @"value": @41}]
                      , @[@{@"title": @"Finance"
                            , @"value": @41}]
                      , @[@{@"title": @"Home"
                          , @"value": @12}
                         , @{@"title": @"Work"
                            , @"value": @8}]
                      , @[@{@"title": @"Home"
                          , @"value": @12}
                         , @{@"title": @"Finance"
                            , @"value": @41}]];
    self.groupIcons = @[@"icon-check", @"icon-list", @"icon-calendar", @"icon-clock"];
    self.selectedGroupIcons = @[@"icon-check-selected", @"icon-list-selected", @"icon-calendar-selected", @"icon-clock-selected"];
        
    UIImageView *imgTableFooter = [[UIImageView alloc] initWithImage:[[ADVThemeManager sharedTheme] tableFooterBackground]];
    [self.tableView setTableFooterView:imgTableFooter];
    [self.tableView reloadData];    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidUnload {
    self.groups = nil;
    self.subGroups = nil;
    self.groupIcons = nil;
    self.selectedGroupIcons = nil;
    [super viewDidUnload];
}


#pragma mark - Nested Tables methods

- (NSInteger)mainTable:(UITableView *)mainTable numberOfItemsInSection:(NSInteger)section
{
    return [groups count];
}

- (NSInteger)mainTable:(UITableView *)mainTable numberOfSubItemsforItem:(SDGroupCell *)item atIndexPath:(NSIndexPath *)indexPath
{
    return [subGroups[indexPath.row] count];
}

- (SDGroupCell *)mainTable:(UITableView *)mainTable setItem:(SDGroupCell *)item forRowAtIndexPath:(NSIndexPath *)indexPath
{
    item.itemText.text = groups[indexPath.row][@"title"];
    item.valueLabel.text = [NSString stringWithFormat:@"%@", groups[indexPath.row][@"value"]];
    
    NSString* unselectedIconName = groupIcons[indexPath.row];
    item.unSelectedIconImage = [UIImage imageNamed:unselectedIconName];
    
    NSString* selectedIconName = selectedGroupIcons[indexPath.row];
    item.selectedIconImage = [UIImage imageNamed:selectedIconName];
    
    return item;
}

/*
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 UITableViewCell* cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
 
 [cell.layer setShadowColor:[[UIColor grayColor] CGColor]];
 [cell.layer setShadowOffset:CGSizeMake(0, 2)];
 [cell.layer setShadowOpacity:0.5];
 if(indexPath.row == groups.count - 1){
 
 }
 return cell;
 }
 
 */

- (SDSubCell *)item:(SDGroupCell *)item setSubItem:(SDSubCell *)subItem forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath *pathGroupCell = [self.tableView indexPathForCell:item];
    NSArray *data = subGroups[pathGroupCell.row];
    subItem.itemText.text = data[indexPath.row][@"title"];
    subItem.valueLabel.text = [NSString stringWithFormat:@"%@", data[indexPath.row][@"value"]];
    return subItem;
}

- (void) mainTable:(UITableView *)mainTable itemDidChange:(SDGroupCell *)item
{
    SelectableCellState state = item.selectableCellState;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:item];
    switch (state) {
        case Checked:
            NSLog(@"Changed Item at indexPath:%@ to state \"Checked\"", indexPath);
            break;
        case Unchecked:
            NSLog(@"Changed Item at indexPath:%@ to state \"Unchecked\"", indexPath);
            break;
        case Halfchecked:
            NSLog(@"Changed Item at indexPath:%@ to state \"Halfchecked\"", indexPath);
            break;
        default:
            break;
    }
}

- (void) mainItem:(SDGroupCell *)item subItemDidChange: (SDSelectableCell *)subItem forTap:(BOOL)tapped
{
    SelectableCellState state = subItem.selectableCellState;
    NSIndexPath *indexPath = [item.subTable indexPathForCell:subItem];
    switch (state) {
        case Checked:
            NSLog(@"Changed Sub Item at indexPath:%@ to state \"Checked\"", indexPath);
            break;
        case Unchecked:
            NSLog(@"Changed Sub Item at indexPath:%@ to state \"Unchecked\"", indexPath);
            break;
        default:
            break;
    }
}

- (void)expandingItem:(SDGroupCell *)item withIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Expanded Item at indexPath: %@", indexPath);
}

- (void)collapsingItem:(SDGroupCell *)item withIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Collapsed Item at indexPath: %@", indexPath);
}

@end
