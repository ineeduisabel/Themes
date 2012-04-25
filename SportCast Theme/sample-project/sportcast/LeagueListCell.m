//
//  LeagueListCell.m
//  sportcast
//
//  Created by Tope on 14/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "LeagueListCell.h"

@implementation LeagueListCell

@synthesize teamLabel, goalsForLabel, goalsAgainstLabel, pointsLabel, playedLabel;

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

-(void)changeCellBackground:(BOOL)isEven
{
    if(isEven)
    {
        [self.contentView setBackgroundColor:[UIColor colorWithRed:245.0/255 green:245.0/255 blue:245.0/255 alpha:1.0]];
        

    }
    else
    {
        [self.contentView setBackgroundColor:[UIColor colorWithRed:243.0/255 green:230.0/255 blue:223.0/255 alpha:1.0]];
    }
}

@end
