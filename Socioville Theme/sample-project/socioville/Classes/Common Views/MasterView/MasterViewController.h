//
//  MasterViewController.h
//  socioville
//
//  Created by Valentin Filip on 4/2/12.
//  Copyright (c) 2012 Universitatea Babeș-Bolyai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
