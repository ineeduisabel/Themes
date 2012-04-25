//
//  AppDelegate.m
//  SocialBoo
//
//  Created by Tope on 24/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "FriendsViewController.h"
#import "ElementsViewController.h"


@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [self customizeNavigation];
    
    UITabBarController* tabController = [[UITabBarController alloc] init];
    
    FriendsViewController * socialBooController = [[FriendsViewController alloc] init];
    
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:socialBooController];
    
    UITabBarItem *updatesItem = [[UITabBarItem alloc] initWithTitle:@"Updates" image:[UIImage imageNamed:@"chats.png"] tag:1];
    [navController setTabBarItem:updatesItem];
    
    
    ElementsViewController *elements = [[ElementsViewController alloc] initWithNibName:@"ElementsViewController" bundle:nil];
    
    UITabBarItem *elementsItem = [[UITabBarItem alloc] initWithTitle:@"Buttons" image:[UIImage imageNamed:@"settings.png"] tag:1];
    [elements setTabBarItem:elementsItem];
    [elementsItem setBadgeValue:@"25"];
    
    UIViewController *controller3 = [[UIViewController alloc] init];
    
    UITabBarItem *item3 = [[UITabBarItem alloc] initWithTitle:@"Other" image:[UIImage imageNamed:@"friends.png"] tag:1] ;
    [controller3 setTabBarItem:item3];
    
    UIViewController *controller4 = [[UIViewController alloc] init];
    
    UITabBarItem *item4 = [[UITabBarItem alloc] initWithTitle:@"Other" image:[UIImage imageNamed:@"send-email.png"] tag:1];
    [controller4 setTabBarItem:item4];
    
    
    tabController.viewControllers = [NSArray arrayWithObjects:navController, elements, controller3, controller4, nil];
    

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = tabController;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)customizeNavigation
{
    UIImage *navBarImage = [UIImage imageNamed:@"nav-bar.png"];
    
    [[UINavigationBar appearance] setBackgroundImage:navBarImage 
                                       forBarMetrics:UIBarMetricsDefault];
    
    UIImage *barButton = [UIImage imageNamed:@"nav-bar-btn.png"];
                          
    [[UIBarButtonItem appearance] setBackgroundImage:barButton forState:UIControlStateNormal 
                                          barMetrics:UIBarMetricsDefault];
    
    UIImage *backButton = [UIImage imageNamed:@"back-btn-big.png"];
    
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButton forState:UIControlStateNormal 
                                                    barMetrics:UIBarMetricsDefault];
    
    UIImage* tabBarBackground = [UIImage imageNamed:@"tab-bar.png"];
    [[UITabBar appearance] setBackgroundImage:tabBarBackground];
    
    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"menu-bar-item-bg.png"]];
    
    UIImage *minImage = [UIImage imageNamed:@"slider-fill.png"];
    UIImage *maxImage = [UIImage imageNamed:@"slider-bg.png"];
    UIImage *thumbImage = [UIImage imageNamed:@"slider-cap.png"];
    
    [[UISlider appearance] setMaximumTrackImage:maxImage 
                                       forState:UIControlStateNormal];
    [[UISlider appearance] setMinimumTrackImage:minImage 
                                       forState:UIControlStateNormal];
    [[UISlider appearance] setThumbImage:thumbImage 
                                forState:UIControlStateNormal];
    
    
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
