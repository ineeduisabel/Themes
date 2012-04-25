//
//  DetailListCell.h
//  sportcast
//
//  Created by Tope on 12/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailListCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *eventLabel;

@property (nonatomic, strong) IBOutlet UILabel *teamEvent1;
@property (nonatomic, strong) IBOutlet UILabel *teamEvent2;

@end
