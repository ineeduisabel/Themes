//
//  ListCell.h
//  socioville
//
//  Created by Tope on 17/04/2012.
//  Copyright (c) 2012 Universitatea Babeș-Bolyai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSCheckBoxView.h"

@interface TaskCell : UITableViewCell {
    SSCheckBoxView *checkbox;
}

@property (nonatomic, strong) SSCheckBoxView *checkbox;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;


@end
