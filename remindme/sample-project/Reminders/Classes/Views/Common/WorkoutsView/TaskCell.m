//
//  ListCell.m
//  socioville
//
//  Created by Tope on 17/04/2012.
//  Copyright (c) 2012 Universitatea Babeș-Bolyai. All rights reserved.
//

#import "TaskCell.h"
#import "AppDelegate.h"
#import "SSCheckBoxView.h"

@interface TaskCell ()

- (void)initialize;

@end



@implementation TaskCell

@synthesize checkbox;
@synthesize titleLabel;
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
    checkbox = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(7, 7, 40, 40) style:kSSCheckBoxViewStyleBox checked:NO];
    [self addSubview:checkbox];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    self.titleLabel.textColor = [UIColor colorWithRed:0.49f green:0.49f blue:0.49f alpha:1.00f];
    self.timeLabel.textColor = [UIColor colorWithRed:0.31f green:0.31f blue:0.31f alpha:1.00f];
}

@end
