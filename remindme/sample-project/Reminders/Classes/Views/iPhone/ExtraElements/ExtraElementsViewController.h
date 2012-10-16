//
//  ExtraElementsViewController.h
//  Reminders
//
//  Created by Valentin Filip on 8/7/12.
//  Copyright (c) 2012 AppDesignVault. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ADVRoundProgressView;

@interface ExtraElementsViewController : UIViewController <UITableViewDataSource
                                                         , UITableViewDelegate
                                                         , UISearchBarDelegate>
{
    UISearchDisplayController *searchDisplayController;
    NSArray *allItems;
    NSArray *searchResults;
}

@property (strong, nonatomic) IBOutlet UIView *viewElem;
@property (strong, nonatomic) IBOutlet ADVRoundProgressView *roundProgressSmall;
@property (strong, nonatomic) IBOutlet ADVRoundProgressView *roundProgressMedium;
@property (strong, nonatomic) IBOutlet ADVRoundProgressView *roundProgressLarge;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UISearchDisplayController *searchDisplayController;
@property (strong, nonatomic) NSArray *allItems;
@property (strong, nonatomic) NSArray *searchResults;
@property (strong, nonatomic) IBOutlet UISlider *sliderRoundProgressLarge;

- (IBAction)changeProgress:(id)sender;
@end
