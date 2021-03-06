//
//  AppDelegate.m
//  sportcast
//
//  Created by Tope on 09/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self customizeTheme];
    
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
	
    UIViewController *controller1 = [[tabBarController viewControllers] objectAtIndex:0];
    UIViewController *controller2 = [[tabBarController viewControllers] objectAtIndex:1];
    UIViewController *controller3 = [[tabBarController viewControllers] objectAtIndex:2];
    UIViewController *controller4 = [[tabBarController viewControllers] objectAtIndex:3];
    
    [self setTabBarItemForController:controller1 withTitle:@"Games" andImageName:@"calendar.png"];
    [self setTabBarItemForController:controller2 withTitle:@"League" andImageName:@"users.png"];
    [self setTabBarItemForController:controller3 withTitle:@"Elements" andImageName:@"chats.png"];
    [self setTabBarItemForController:controller4 withTitle:@"Empty" andImageName:@"time.png"];
    
    // Override point for customization after application launch.
    return YES;
}

-(void)setTabBarItemForController:(UIViewController*)controller withTitle:(NSString*)title andImageName:(NSString*)imageName
{
    UIImage* image = [UIImage imageNamed:imageName];
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:title image:image tag:0];
    [item setFinishedSelectedImage:image withFinishedUnselectedImage:image];
    
    [controller setTabBarItem:item];
}

- (void)customizeTheme
{
    UIImage *navBarImage = [UIImage imageNamed:@"menu-bar.png"];
    
    [[UINavigationBar appearance] setBackgroundImage:navBarImage 
                                       forBarMetrics:UIBarMetricsDefault];
    
    
    UIImage *barButton = [[UIImage imageNamed:@"menubar-button-bg.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 7, 0, 7)];
    
    [[UIBarButtonItem appearance] setBackgroundImage:barButton forState:UIControlStateNormal 
                                          barMetrics:UIBarMetricsDefault];
    
    UIImage *backButton = [UIImage imageNamed:@"back-btn-background.png"];
    
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButton forState:UIControlStateNormal 
                                                    barMetrics:UIBarMetricsDefault];
    
    UIImage* tabBarBackground = [UIImage imageNamed:@"tabbar.png"];
    [[UITabBar appearance] setBackgroundImage:tabBarBackground];

    UIImage *minImage = [UIImage imageNamed:@"slider-fill.png"];
    UIImage *maxImage = [UIImage imageNamed:@"slider-track.png"];
    UIImage *thumbImage = [UIImage imageNamed:@"slider-handle.png"];
    
    [[UISlider appearance] setMaximumTrackImage:maxImage 
                                       forState:UIControlStateNormal];
    [[UISlider appearance] setMinimumTrackImage:minImage 
                                       forState:UIControlStateNormal];
    [[UISlider appearance] setThumbImage:thumbImage 
                                forState:UIControlStateNormal];
    
    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"tabbar-active.png"]];
    
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
