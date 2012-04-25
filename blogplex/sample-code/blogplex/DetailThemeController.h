//
//  DetailThemeController.h
//  blogplex
//
//  Created by Tope on 27/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Model.h"

@interface DetailThemeController : UIViewController<UIWebViewDelegate>

@property (nonatomic, strong) IBOutlet UILabel* titleLabel;

@property (nonatomic, strong) IBOutlet UILabel* dateLabel;

@property (nonatomic, strong) IBOutlet UIWebView* articleWebView;

@property (nonatomic, strong) IBOutlet UIScrollView* scrollView;

@property (nonatomic, strong) IBOutlet UIImageView* articleImageView;

@property (nonatomic, strong) IBOutlet UIView* shadowView;

@property (nonatomic, strong) IBOutlet UIView *tagContainer;

@property (nonatomic, retain) Model* model;


-(UIBarButtonItem*)createBackBarButtonWithImage:(NSString*)imageName;

-(void)back;


-(UIView*)createTagViewWithName:(NSString*)tag;
@end
