//
//  SDNestedTableViewController.m
//  SDNestedTablesExample
//
//  Created by Daniele De Matteis on 21/05/2012.
//  Copyright (c) 2012 Daniele De Matteis. All rights reserved.
//

#import "SDNestedTableViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface SDNestedTableViewController ()

@end

@implementation SDNestedTableViewController

@synthesize mainItemsAmt, subItemsAmt, groupCell;
@synthesize delegate;

- (id) init
{
    if (self = [self initWithNibName:@"SDNestedTableView" bundle:nil])
    {
    }
    return self;
}

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]))
    {
        self.delegate = self;
    }
    
    return self;
}

#pragma mark - To be implemented in sublclasses

- (NSInteger)mainTable:(UITableView *)mainTable numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"\n Oops! You didn't specify the amount of Items in the Main tableview \n Please implement \"%@\" in your SDNestedTables subclass.", NSStringFromSelector(_cmd));
    return 0;
}

- (NSInteger)mainTable:(UITableView *)mainTable numberOfSubItemsforItem:(SDGroupCell *)item atIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"\n Oops! You didn't specify the amount of Sub Items for this Main Item \n Please implement \"%@\" in your SDNestedTables subclass.", NSStringFromSelector(_cmd));
    return 0; 
}

- (SDGroupCell *)mainTable:(UITableView *)mainTable setItem:(SDGroupCell *)item forRowAtIndexPath:(NSIndexPath *)indexPath 
{
    if (indexPath.row == 0)
    {
        NSLog(@"\n Oops! Item cells in the Main tableview are not configured \n Please implement \"%@\" in your SDNestedTables subclass.", NSStringFromSelector(_cmd));
    }
    return item;
}

- (SDSubCell *)item:(SDGroupCell *)item setSubItem:(SDSubCell *)subItem forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        NSLog(@"\n Oops! Sub Items for this Item are not configured \n Please implement \"%@\" in your SDNestedTables subclass.", NSStringFromSelector(_cmd));
    }
    return subItem;
}

- (void)expandingItem:(SDGroupCell *)item withIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)collapsingItem:(SDGroupCell *)item withIndexPath:(NSIndexPath *)indexPath 
{

}
    
// Optional method to implement. Will be called when creating a new main cell to return the nib name you want to use

- (NSString *) nibNameForMainCell
{
    return @"SDGroupCell";
}

#pragma mark - Delegate methods

- (void) mainTable:(UITableView *)mainTable itemDidChange:(SDGroupCell *)item
{
    NSLog(@"\n Oops! You didn't specify a behavior for this Item \n Please implement \"%@\" in your SDNestedTables subclass.", NSStringFromSelector(_cmd));
}

- (void) item:(SDGroupCell *)item subItemDidChange:(SDSelectableCell *)subItem
{
    NSLog(@"\n Oops! You didn't specify a behavior for this Sub Item \n Please implement \"%@\" in your SDNestedTables subclass.", NSStringFromSelector(_cmd));
}

- (void) mainItemDidChange: (SDGroupCell *)item forTap:(BOOL)tapped
{
    if(delegate != nil && [delegate respondsToSelector:@selector(mainTable:itemDidChange:)] )
    {
        [delegate performSelector:@selector(mainTable:itemDidChange:) withObject:self.tableView withObject:item];
    }
}

- (void) mainItem:(SDGroupCell *)item subItemDidChange: (SDSelectableCell *)subItem forTap:(BOOL)tapped
{
    if(delegate != nil && [delegate respondsToSelector:@selector(item:subItemDidChange:)] )
    {
        [delegate performSelector:@selector(item:subItemDidChange:) withObject:item withObject:subItem];
    }
}

#pragma mark - Class lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    subItemsAmt = [[NSMutableDictionary alloc] initWithDictionary:nil];
	expandedIndexes = [[NSMutableDictionary alloc] init];
	selectableCellsState = [[NSMutableDictionary alloc] init];
	selectableSubCellsState = [[NSMutableDictionary alloc] init];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - TableView delegation

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    mainItemsAmt = [self mainTable:tableView numberOfItemsInSection:section];
    return mainItemsAmt;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SDGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GroupCell"];
    
    if (cell == nil)
    {
        [[NSBundle mainBundle] loadNibNamed:[self nibNameForMainCell] owner:self options:nil];
        cell = groupCell;
        self.groupCell = nil;
    }
    
    [cell setParentTable: self];
    [cell setCellIndexPath:indexPath];
    
    cell = [self mainTable:tableView setItem:cell forRowAtIndexPath:indexPath];
    
    NSNumber *amt = @([self mainTable:tableView numberOfSubItemsforItem:cell atIndexPath:indexPath]);
    subItemsAmt[indexPath] = amt;
    
    [cell setSubCellsAmt: [subItemsAmt[indexPath] intValue]];
    
    NSMutableDictionary *subCellsState = selectableSubCellsState[indexPath];
    int selectedSubCellsAmt = 0;
    for (NSString *key in subCellsState)
    {
        SelectableCellState cellState = [subCellsState[key] intValue];
        if (cellState == Checked) {
            selectedSubCellsAmt++;
        }
    }
    [cell setSelectedSubCellsAmt: selectedSubCellsAmt];
    [cell setSelectableSubCellsState: selectableSubCellsState[indexPath]];
    
    SelectableCellState cellState = [selectableCellsState[indexPath] intValue];
    switch (cellState)
    {
        case Checked:       [cell check];       break;
        case Unchecked:     [cell uncheck];     break;
        case Halfchecked:   [cell halfCheck];   break;
        default:                                break;
    }
    
    BOOL isExpanded = [expandedIndexes[indexPath] boolValue];
    cell.isExpanded = isExpanded;
    if(cell.isExpanded)
    {
        [cell rotateExpandBtnToExpanded];
    }
    else
    {
        [cell rotateExpandBtnToCollapsed];
    }
    
    [cell.subTable reloadData];
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int amt = [subItemsAmt[indexPath] intValue];
    BOOL isExpanded = [expandedIndexes[indexPath] boolValue];
    if(isExpanded)
    {
        return [SDGroupCell getHeight] + [SDGroupCell getsubCellHeight]*amt + 1;
    }
    return [SDGroupCell getHeight];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self toggleSubCellWithIndexPath:indexPath];
    
    SDGroupCell *cell = (SDGroupCell *)[tableView cellForRowAtIndexPath:indexPath];
//    [cell tapTransition];
    SelectableCellState cellState = [cell toggleCheck];
    NSNumber *cellStateNumber = [NSNumber numberWithInt:cellState];
    selectableCellsState[indexPath] = cellStateNumber;
    [cell subCellsToggleCheck];
    [self mainItemDidChange:cell forTap:YES];
//    if (cell.selectableCellState == Unchecked) {
//        cell.selectableCellState = Checked;
//        [cell.selectedImageView setAlpha:1.0];
//    } else {
//        cell.selectableCellState = Unchecked;
//        [cell.selectedImageView setAlpha:0.0];
//    }
}

#pragma mark - Nested Tables events

- (void) groupCell:(SDGroupCell *)cell didSelectSubCell:(SDSelectableCell *)subCell withIndexPath:(NSIndexPath *)indexPath andWithTap:(BOOL)tapped
{
    NSIndexPath *groupCellIndexPath = [self.tableView indexPathForCell:cell];
    NSNumber *cellStateNumber = [NSNumber numberWithInt:cell.selectableCellState];
    if(groupCellIndexPath != nil && cellStateNumber != nil)
    {
        selectableCellsState[groupCellIndexPath] = cellStateNumber;
        
        //NSIndexPath *subCellIndexPath = [cell.subTable indexPathForCell:subCell];
        NSNumber *subCellStateNumber = [NSNumber numberWithInt:subCell.selectableCellState];
        if (!selectableSubCellsState[groupCellIndexPath])
        {
            NSMutableDictionary *subCellState = [[NSMutableDictionary alloc] initWithObjectsAndKeys: subCellStateNumber, indexPath, nil];
            selectableSubCellsState[groupCellIndexPath] = subCellState;
        }
        else
        {
            selectableSubCellsState[groupCellIndexPath][indexPath] = subCellStateNumber;
        }
        
        [cell setSelectableSubCellsState: selectableSubCellsState[groupCellIndexPath]];
        
        [self mainItem:cell subItemDidChange:subCell forTap:tapped];
    }
}

- (void) collapsableButtonTapped: (UIControl *) button withEvent: (UIEvent *) event
{
    UITableView *tableView = self.tableView;
    NSIndexPath * indexPath = [tableView indexPathForRowAtPoint: [[[event touchesForView: button] anyObject] locationInView: tableView]];
    if ( indexPath == nil )
        return;
    
    [self toggleSubCellWithIndexPath:indexPath];
}

- (void)toggleSubCellWithIndexPath:(NSIndexPath *)indexPath {
    UITableView *tableView = self.tableView;
    
    if ([expandedIndexes[indexPath] boolValue]) {
        [self collapsingItem:(SDGroupCell *)[tableView cellForRowAtIndexPath:indexPath] withIndexPath:indexPath];
    } else {
        [self expandingItem:(SDGroupCell *)[tableView cellForRowAtIndexPath:indexPath] withIndexPath:indexPath];
    }
    
    // reset cell expanded state in array
	BOOL isExpanded = ![expandedIndexes[indexPath] boolValue];
	NSNumber *expandedIndex = @(isExpanded);
	expandedIndexes[indexPath] = expandedIndex;
    
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}

@end
