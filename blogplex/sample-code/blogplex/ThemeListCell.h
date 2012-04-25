//
//  ThemeListCell.h
//  blogplex
//
//  Created by Tope on 25/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemeListCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel* titleLabel;

@property (nonatomic, strong) IBOutlet UILabel* excerptLabel;

@property (nonatomic, strong) IBOutlet UILabel* dayLabel;

@property (nonatomic, strong) IBOutlet UILabel* dateLabel;

@property (nonatomic, strong) IBOutlet UIImageView* bgImageView;
@end
