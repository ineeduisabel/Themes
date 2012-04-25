//
//  StartViewController.h
//  blogplex
//
//  Created by Tope on 20/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StartViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIButton* loadSampleButton;

@property (nonatomic, strong) IBOutlet UIButton* loadRSSButton;

@property (nonatomic, assign) BOOL shouldLoadRSS;

-(void)loadData:(UIButton*)sender;
@end
