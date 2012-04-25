//
//  MenuViewCell.m
//  StackScrollView
//
//  Created by Tope on 28/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MenuViewCell.h"

@implementation MenuViewCell
@synthesize biImageView;
@synthesize label;
@synthesize imageCount;
@synthesize bgCount;

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
    
    if(selected)
    {
        UIImage* bgSelected = [UIImage imageNamed:@"menu-small-selected.png"];
        UIImage* countSelected = [UIImage imageNamed:@"count-selected.png"];
        
        [biImageView setImage:bgSelected];
        [bgCount setImage:countSelected];
        
        [label setTextColor:[UIColor whiteColor]];
        [imageCount setTextColor:[UIColor grayColor]];
        
    }
    else
    {
        UIImage* bg = [UIImage imageNamed:@"menu-small.png"];
        UIImage* countbg = [UIImage imageNamed:@"count.png"];
        
        [biImageView setImage:bg];
        [bgCount setImage:countbg];
        
        [label setTextColor:[UIColor blackColor]];
        [imageCount setTextColor:[UIColor whiteColor]];
        

    }
    
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCellLocation:(NSString*)location withImageCount:(int)count
{
    [label setText:location];
    [imageCount setText:[NSString stringWithFormat:@"%d", count]];
    
}

- (void)dealloc {
    [biImageView release];
    [label release];
    [imageCount release];
    [bgCount release];
    [super dealloc];
}
@end
