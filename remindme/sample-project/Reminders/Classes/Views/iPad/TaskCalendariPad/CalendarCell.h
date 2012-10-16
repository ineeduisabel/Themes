//
//  CalendarCell.h
//  Reminders
//
//  Created by Valentin Filip on 9/11/12.
//  Copyright (c) 2012 AppDesignVault. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSCheckBoxView.h"


@interface CalendarCell : UITableViewCell {
    SSCheckBoxView *checkbox;
}

@property (nonatomic, strong) SSCheckBoxView *checkbox;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITextView *textDescription;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

@end
