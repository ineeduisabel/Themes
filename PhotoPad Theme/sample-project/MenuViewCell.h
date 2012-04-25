//
//  MenuViewCell.h
//  StackScrollView
//
//  Created by Tope on 28/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UIImageView *biImageView;
@property (retain, nonatomic) IBOutlet UILabel *label;
@property (retain, nonatomic) IBOutlet UILabel *imageCount;
@property (retain, nonatomic) IBOutlet UIImageView *bgCount;

-(void)setCellLocation:(NSString*)location withImageCount:(int)count;
@end
