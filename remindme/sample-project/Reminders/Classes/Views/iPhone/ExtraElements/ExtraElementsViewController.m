//
//  ExtraElementsViewController.m
//  Reminders
//
//  Created by Valentin Filip on 8/7/12.
//  Copyright (c) 2012 AppDesignVault. All rights reserved.
//

#import "ExtraElementsViewController.h"
#import "ADVTheme.h"
#import "TaskCell.h"
#import "ADVRoundProgressView.h"

@interface ExtraElementsViewController ()

@end




@implementation ExtraElementsViewController

@synthesize viewElem;
@synthesize roundProgressSmall;
@synthesize roundProgressMedium;
@synthesize roundProgressLarge;
@synthesize tableView;

@synthesize searchDisplayController;
@synthesize allItems;
@synthesize searchResults;
@synthesize sliderRoundProgressLarge;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [ADVThemeManager customizeView:self.viewElem];
    self.tableView.scrollEnabled = YES;
    self.searchDisplayController.searchBar.showsScopeBar = YES;
    self.searchDisplayController.searchBar.scopeButtonTitles = @[ @"Label", @"Label", @"Label", @"Label" ];
    
    self.allItems = @[@"Code Geass",
                     @"Asura Cryin'",
                     @"Voltes V",
                     @"Mazinger Z",
                     @"Daimos"];
    [self.tableView reloadData];
    self.tableView.hidden = YES;
    
    
    UIColor *tintColor = [UIColor colorWithRed:0.03f green:0.64f blue:0.83f alpha:1.00f];
    [[ADVRoundProgressView appearance] setTintColor:tintColor];
    
    self.roundProgressSmall.progress = 0.3;
    self.roundProgressSmall.image = [UIImage imageNamed:@"progress-circle-small"];
    self.roundProgressSmall.fontSize = 20.0f;
    
    self.roundProgressMedium.progress = 0.5;
    self.roundProgressMedium.image = [UIImage imageNamed:@"progress-circle-medium"];
    self.roundProgressMedium.fontSize = 40.0f;
    
    self.roundProgressLarge.progress = 0.7;
    
    self.sliderRoundProgressLarge.value = self.roundProgressLarge.progress;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidUnload {
    [self setTableView:nil];
    [self setRoundProgressLarge:nil];
    [self setRoundProgressMedium:nil];
    [self setRoundProgressSmall:nil];
    [self setViewElem:nil];
    [self setSliderRoundProgressLarge:nil];
    [super viewDidUnload];
}

#pragma mark - Actions

- (IBAction)changeProgress:(id)sender {
    self.roundProgressLarge.progress = ((UISlider *)sender).value;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
    NSInteger rows = 0;
    
    if ([aTableView isEqual:self.searchDisplayController.searchResultsTableView]) {
        rows = [self.searchResults count];
    } else {
        rows = [self.allItems count];
    }
    
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!aTableView.tableFooterView) {
        UIImageView *imgTableFooter = [[UIImageView alloc] initWithImage:[[ADVThemeManager sharedTheme] tableFooterBackground]];
        [aTableView setTableFooterView:imgTableFooter];
        
        [ADVThemeManager customizeTableView:aTableView];
    }
    aTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    TaskCell *cell = (TaskCell *)[self.tableView dequeueReusableCellWithIdentifier:@"TaskCell"];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"list-item-checkable.png"]];
    cell.accessoryType = UITableViewCellAccessoryNone;
        
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 47.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Filtering logic

- (void)filterContentForSearchText:(NSString*)searchText 
                             scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate 
                                    predicateWithFormat:@"SELF contains[cd] %@",
                                    searchText];
    
    self.searchResults = [self.allItems filteredArrayUsingPredicate:resultPredicate];
}

#pragma mark - UISearchDisplayController delegate methods

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller 
shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString 
                               scope:[self.searchDisplayController.searchBar scopeButtonTitles][[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller 
shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    [self filterContentForSearchText:[self.searchDisplayController.searchBar text] 
                               scope:[self.searchDisplayController.searchBar scopeButtonTitles][searchOption]];
    
    return YES;
}

#pragma mark - UISearchBar delegate

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    self.tableView.hidden = YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    self.tableView.hidden = YES;
}


@end
