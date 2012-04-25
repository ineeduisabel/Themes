//
//  LeagueListCell.h
//  sportcast
//
//  Created by Tope on 14/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeagueListCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel* teamLabel;
@property (nonatomic, strong) IBOutlet UILabel* goalsForLabel;
@property (nonatomic, strong) IBOutlet UILabel* goalsAgainstLabel;
@property (nonatomic, strong) IBOutlet UILabel* playedLabel;
@property (nonatomic, strong) IBOutlet UILabel* pointsLabel;

-(void)changeCellBackground:(BOOL)isEven;
@end
