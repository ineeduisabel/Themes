//
//  CustomTabBarViewController.m
//
//  Created by Valentin Filip on 04/03/2012.
//
// Copyright (c) 2012 Valentin Filip
// 


#import "CustomTabBarViewController.h"

@implementation CustomTabBarViewController

@synthesize allowLandscape;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.clipsToBounds = NO;
    [self addCenterButtonWithOptions:@{@"buttonImage": @"buttonAdd.png"}];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if(self.allowLandscape || UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return (interfaceOrientation == UIInterfaceOrientationPortrait);
    }
}

@end
