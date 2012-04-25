//
//  StepListController.h
//  foody
//
//  Created by Tope on 29/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StepListController : UIViewController <UITableViewDataSource, UITableViewDelegate>


@property (nonatomic, retain) IBOutlet UITableView* stepsTableView;

@end
