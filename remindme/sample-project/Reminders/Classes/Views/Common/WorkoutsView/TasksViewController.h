//
//  FirstViewController.h
//  Reminders
//
//  Created by Valentin Filip on 7/9/12.
//  Copyright (c) 2012 AppDesignVault. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface TasksViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate> {
    NSArray *items;
}

@property (strong, nonatomic) NSArray *items;
@property (strong, nonatomic) DetailViewController *detailViewController;

@end
