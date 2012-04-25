//
//  ThemeListCell.m
//  sportcast
//
//  Created by Tope on 09/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ThemeListCell.h"

@implementation ThemeListCell

@synthesize teamLabel1, teamImage1, teamScore1;
@synthesize teamLabel2, teamImage2, teamScore2;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
