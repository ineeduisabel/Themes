//
//  AppDelegate.h
//  blogplex
//
//  Created by Tope on 17/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorSwitcher.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, retain) ColorSwitcher * colorSwitcher;

-(void)customizeGlobalTheme;

-(void)iPhoneInit;

-(void)iPadInit;

+ (AppDelegate *) instance;
@end
