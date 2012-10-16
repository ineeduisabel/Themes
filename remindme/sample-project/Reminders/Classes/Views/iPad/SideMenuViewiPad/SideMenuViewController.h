//
//  SideMenuViewController.h
//  Reminders
//
//  Created by Valentin Filip on 9/10/12.
//  Copyright (c) 2012 AppDesignVault. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SideMenuViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	UITableView *_tableView;
    NSIndexPath *currentlySelectedIndex;
}

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSIndexPath *currentlySelectedIndex;

@end
