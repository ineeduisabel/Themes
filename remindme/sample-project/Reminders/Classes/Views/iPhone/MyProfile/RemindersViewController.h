//
//  ProfileViewController.h
//  Reminders
//
//  Created by Valentin Filip on 8/8/12.
//  Copyright (c) 2012 AppDesignVault. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDNestedTableViewController.h"

@interface RemindersViewController : SDNestedTableViewController {
    NSArray *items;
}

@property (nonatomic, strong) NSArray* groups;
@property (nonatomic, strong) NSArray* groupIcons;
@property (nonatomic, strong) NSArray* selectedGroupIcons;
@property (nonatomic, strong) NSArray* subGroups;

@end
