//
//  CalendarCell.m
//  Reminders
//
//  Created by Valentin Filip on 9/11/12.
//  Copyright (c) 2012 AppDesignVault. All rights reserved.
//

#import "CalendarCell.h"

@interface CalendarCell ()

- (void)initialize;

@end




@implementation CalendarCell

@synthesize checkbox;
@synthesize titleLabel;
@synthesize imageView;
@synthesize textDescription;
@synthesize timeLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    checkbox = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(self.bounds.size.width - 40, 7, 40, 40) style:kSSCheckBoxViewStyleBox checked:NO];
    [self addSubview:checkbox];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
