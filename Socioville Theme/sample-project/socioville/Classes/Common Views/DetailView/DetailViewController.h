//
//  DetailViewController.h
//  socioville
//
//  Created by Valentin Filip on 4/2/12.
//  Copyright (c) 2012 Universitatea Babeș-Bolyai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

- (IBAction)playMovie:(id)sender;
@end
