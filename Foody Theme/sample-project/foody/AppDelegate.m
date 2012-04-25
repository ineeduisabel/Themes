//
//  AppDelegate.m
//  foody
//
//  Created by Tope on 28/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self customizeTheme];

    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
	
    UINavigationController *navigationController = [[tabBarController viewControllers] objectAtIndex:0];
	
    
    UIImage* icon1 = [UIImage imageNamed:@"icon1.png"];
    UITabBarItem *updatesItem = [[UITabBarItem alloc] initWithTitle:@"Label 1" image:icon1 tag:0];
    [updatesItem setFinishedSelectedImage:icon1 withFinishedUnselectedImage:icon1];
    
    [navigationController setTabBarItem:updatesItem];

    
    UIImage* icon2 = [UIImage imageNamed:@"icon2.png"];
    UITabBarItem *item2 = [[UITabBarItem alloc] initWithTitle:@"Label 2" image:icon2 tag:1] ;
    [item2 setFinishedSelectedImage:icon2 withFinishedUnselectedImage:icon2];
    
    UIViewController* controller2 = [[tabBarController viewControllers] objectAtIndex:1];
    [controller2 setTabBarItem:item2];
    
    
    UIViewController *controller3 = [[tabBarController viewControllers] objectAtIndex:2];
    
    UIImage* icon3 = [UIImage imageNamed:@"icon3.png"];
    
    UITabBarItem *item3 = [[UITabBarItem alloc] initWithTitle:@"Label 3" image:icon3 tag:2] ;
    [item3 setFinishedSelectedImage:icon3 withFinishedUnselectedImage:icon3];
    [controller3 setTabBarItem:item3];
    
    UIViewController *controller4 = [[tabBarController viewControllers] objectAtIndex:3];
    
    UITabBarItem *item4 = [[UITabBarItem alloc] initWithTitle:@"Label 4" image:icon3 tag:3];
    [item4 setFinishedSelectedImage:icon3 withFinishedUnselectedImage:icon3];
    [controller4 setTabBarItem:item4];

    return YES;
}
	
- (void)customizeTheme
{
    UIImage *navBarImage = [UIImage imageNamed:@"navbar.png"];
    
    [[UINavigationBar appearance] setBackgroundImage:navBarImage 
                                       forBarMetrics:UIBarMetricsDefault];
    
    
    UIImage *barButton = [[UIImage imageNamed:@"navbar-icon.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(0, 4, 0, 4)];
    
    [[UIBarButtonItem appearance] setBackgroundImage:barButton forState:UIControlStateNormal 
                                          barMetrics:UIBarMetricsDefault];
    
    UIImage *backButton = [[UIImage imageNamed:@"back-button.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 4)];
    
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButton forState:UIControlStateNormal 
                                                    barMetrics:UIBarMetricsDefault];
    
    UIImage* tabBarBackground = [UIImage imageNamed:@"tabbar.png"];
    [[UITabBar appearance] setBackgroundImage:tabBarBackground];
    
    
    UIImage *minImage = [UIImage imageNamed:@"slider-track-fill.png"];
    UIImage *maxImage = [UIImage imageNamed:@"slider-track.png"];
    UIImage *thumbImage = [UIImage imageNamed:@"slider-cap.png"];
    
    [[UISlider appearance] setMaximumTrackImage:maxImage 
                                       forState:UIControlStateNormal];
    [[UISlider appearance] setMinimumTrackImage:minImage 
                                       forState:UIControlStateNormal];
    [[UISlider appearance] setThumbImage:thumbImage 
                                forState:UIControlStateNormal];
    
    
    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"tabbar-item.png"]];
    
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
