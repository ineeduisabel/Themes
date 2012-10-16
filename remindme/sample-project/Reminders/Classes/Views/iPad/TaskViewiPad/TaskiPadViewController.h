//
//  TaskiPadViewController.h
//  Reminders
//
//  Created by Valentin Filip on 9/10/12.
//  Copyright (c) 2012 AppDesignVault. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskiPadViewController : UIViewController {
    NSArray *items;
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *items;

@end
