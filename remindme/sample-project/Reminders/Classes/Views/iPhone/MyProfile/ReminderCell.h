//
//  ProfileCell.h
//  Reminders
//
//  Created by Valentin Filip on 8/13/12.
//  Copyright (c) 2012 AppDesignVault. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADVProgressBar.h"

@interface ReminderCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imgNotification;
@property (strong, nonatomic) IBOutlet UILabel *lblNotificationValue;

@end
