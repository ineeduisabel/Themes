//
//  DetailThemeiPadController.h
//  mapper
//
//  Created by Tope on 12/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MasterViewController.h"


@interface DetailThemeiPadController : UIViewController<UIPopoverControllerDelegate, MasterViewControllerDelegate, UIWebViewDelegate>

@property (nonatomic, strong) IBOutlet UILabel* titleLabel;

@property (nonatomic, strong) IBOutlet UILabel* dateLabel;

@property (nonatomic, strong) IBOutlet UIWebView* articleWebView;

@property (nonatomic, strong) IBOutlet UIScrollView* scrollView;

@property (nonatomic, strong) IBOutlet UIImageView* articleImageView;

@property (nonatomic, strong) IBOutlet UIView* shadowView;

@property (nonatomic, strong) IBOutlet UIToolbar *toolbar;

@property (nonatomic, strong) IBOutlet UIToolbar *toolbarBottom;

@property (nonatomic, strong) IBOutlet UIView* sideGradientView;

@property (nonatomic, strong) IBOutlet UIView *tagContainer;

-(UIView*)createTagViewWithName:(NSString*)tag;

-(void)loadDataIntoView:(Model*)model;
@end
