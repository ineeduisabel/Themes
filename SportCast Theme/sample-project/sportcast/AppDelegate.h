//
//  AppDelegate.h
//  sportcast
//
//  Created by Tope on 09/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


- (void)customizeTheme;

-(void)setTabBarItemForController:(UIViewController*)controller withTitle:(NSString*)title andImageName:(NSString*)imageName;

@end
