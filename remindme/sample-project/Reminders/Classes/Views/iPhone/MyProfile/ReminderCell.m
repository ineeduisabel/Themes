//
//  ProfileCell.m
//  Reminders
//
//  Created by Valentin Filip on 8/13/12.
//  Copyright (c) 2012 AppDesignVault. All rights reserved.
//

#import "ReminderCell.h"

@interface ReminderCell ()

@end


@implementation ReminderCell

@synthesize titleLabel;
@synthesize imgNotification;
@synthesize lblNotificationValue;


- (id)awakeAfterUsingCoder:(NSCoder *)aDecoder
{
//    self = [super awakeAfterUsingCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    NSString *imgName = @"notification";
    if (selected) {
        imgName = [imgName stringByAppendingString:@"-selected"];
    }
    self.imgNotification.image = [UIImage imageNamed:imgName];
}

@end
