//
//  MenuViewController.m
//  socioville
//
//  Created by Valentin Filip on 09.04.2012.
//  Copyright (c) 2012 Universitatea Babeș-Bolyai. All rights reserved.
//

#import "MenuViewController.h"
#import "UISearchBar+TextColor.h"
#import "MainViewController.h"
#import "DataSource.h"
#import "MenuItem.h"

@interface MenuViewController ()

@property (nonatomic, strong) DataSource    *dataSource;
@property (nonatomic, strong) NSIndexPath   *currentSelection;

@end

@implementation MenuViewController 

@synthesize searchBar;
@synthesize tableView;
@synthesize currentSelection;
@synthesize dataSource;

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dataSource = [DataSource dataSource];
    [self.tableView reloadData];
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    [self.searchBar setTextColor:[UIColor whiteColor]];
    [self.searchBar field].leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
}

- (void)viewDidUnload
{
    [self setSearchBar:nil];
    [self setTableView:nil];
    [super viewDidUnload];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return self.dataSource.items.count;
            break;
        default:
            return 2;
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 0;
            break;
            
        default:
            return 23;
            break;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menu-header.png"]];
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if (indexPath.section == 0) {
        cell = [aTableView dequeueReusableCellWithIdentifier:@"MenuUserCell"];
        cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menu-cell.png"]];
        cell.textLabel.text = @"Virgil Pana";
        cell.imageView.image = [UIImage imageNamed:@"user_1.png"];
    } else {
        cell = [aTableView dequeueReusableCellWithIdentifier:@"MenuCell"];
        cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menu-cell.png"]];
        MenuItem *item = [self.dataSource.items objectAtIndex:indexPath.row];
        
        UIImageView *imgRow = (UIImageView *)[cell viewWithTag:1];
        imgRow.image = item.image;
        UILabel *lblText = (UILabel *)[cell viewWithTag:2];
        lblText.text = item.name;
        
        UIView *countView = nil;
        if (item.eventCount > 0) {
            NSString *countString = [NSString stringWithFormat:@"%@", item.eventCount];
            CGSize sizeCount = [countString sizeWithFont:[UIFont systemFontOfSize:14.0f]];
            
            UIImage *bkgImg = [UIImage imageNamed:@"sidemenu-count.png"];
            countView = [[UIImageView alloc] initWithImage:[bkgImg stretchableImageWithLeftCapWidth:10 topCapHeight:2]];
            countView.frame = CGRectIntegral(CGRectMake(0, 0, sizeCount.width + 2*10, bkgImg.size.height));
            
            UILabel *lblCount = [[UILabel alloc] initWithFrame:CGRectIntegral(CGRectMake(10, (bkgImg.size.height-sizeCount.height)/2, sizeCount.width, sizeCount.height))];
            lblCount.text = countString;
            lblCount.backgroundColor = [UIColor clearColor];
            lblCount.textColor = [UIColor whiteColor];
            lblCount.textAlignment = UITextAlignmentCenter;
            lblCount.font = [UIFont systemFontOfSize:14.0f];
            lblCount.shadowColor = [UIColor darkGrayColor];
            lblCount.shadowOffset = CGSizeMake(0, 1);
            [countView addSubview:lblCount];
        }
        cell.accessoryView = countView;
         
    }
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return;
    }
    [self.searchBar resignFirstResponder];
    UITableViewCell *cell = [aTableView cellForRowAtIndexPath:currentSelection];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menu-cell.png"]];
    currentSelection = indexPath;
    cell = [aTableView cellForRowAtIndexPath:indexPath];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menu-cell-selected.png"]];
    
    
    MainViewController *mainController = (MainViewController *)self.parentViewController;
    [mainController revealToggle:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"MenuSelectedOption" object:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                                             indexPath, @"indexPath"
                                                                                             , @"the object", @"object"
                                                                                             , nil]];
}

@end
