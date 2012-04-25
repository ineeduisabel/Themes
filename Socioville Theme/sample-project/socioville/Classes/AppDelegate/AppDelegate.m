//
//  AppDelegate.m
//  socioville
//
//  Created by Valentin Filip on 4/2/12.
//  Copyright (c) 2012 Universitatea Babeș-Bolyai. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
        UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
        splitViewController.delegate = (id)navigationController.topViewController;
    }
    
    [self customizeGlobalTheme];
    
    UIUserInterfaceIdiom idiom = [[UIDevice currentDevice] userInterfaceIdiom];
    
    if (idiom == UIUserInterfaceIdiomPad) 
    {
        [self customizeiPadTheme];
    }
    
    return YES;
}

- (void)customizeGlobalTheme {
    UIImage *navBarImage = [UIImage imageNamed:@"menubar.png"];
    
    [[UINavigationBar appearance] setBackgroundImage:navBarImage 
                                       forBarMetrics:UIBarMetricsDefault];
    
    
    UIImage *barButton = [[UIImage imageNamed:@"menubar-button.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
    
    [[UIBarButtonItem appearance] setBackgroundImage:barButton forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    UIImage *backButton = [[UIImage imageNamed:@"back.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0,15,0,8)];
    
    
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButton forState:UIControlStateNormal 
                                                    barMetrics:UIBarMetricsDefault];
    
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"tabbar.png"]];
    
    UIImage *minImage = [UIImage imageNamed:@"slider-fill"];
    UIImage *maxImage = [UIImage imageNamed:@"slider-track.png"];
    UIImage *thumbImage = [UIImage imageNamed:@"slider-handle.png"];
    
    [[UISlider appearance] setMaximumTrackImage:maxImage forState:UIControlStateNormal];
    [[UISlider appearance] setMinimumTrackImage:minImage forState:UIControlStateNormal];
    [[UISlider appearance] setThumbImage:thumbImage forState:UIControlStateNormal];
    [[UISlider appearance] setThumbImage:thumbImage forState:UIControlStateHighlighted];
    
    
    [[UISearchBar appearance] setBackgroundImage:[UIImage imageNamed:@"menu-search.png"]];
    [[UISearchBar appearance] setSearchFieldBackgroundImage:[UIImage imageNamed:@"menu-search-field.png"] forState:UIControlStateNormal];
    
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor whiteColor], 
      UITextAttributeTextColor, 
      [UIColor lightGrayColor], 
      UITextAttributeTextShadowColor, 
      [NSValue valueWithUIOffset:UIOffsetMake(0, 1)], 
      UITextAttributeTextShadowOffset, 
      [UIFont fontWithName:@"Lobster 1.4" size:22],
      UITextAttributeFont,
      nil]];
}



- (void)customizeiPadTheme {   
    UIImage *navBarImage = [UIImage imageNamed:@"menu-bar-right.png"];
    
    [[UINavigationBar appearance] setBackgroundImage:[navBarImage stretchableImageWithLeftCapWidth:10 topCapHeight:10]
                                       forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0], 
      UITextAttributeTextColor, 
      [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8], 
      UITextAttributeTextShadowColor, 
      [NSValue valueWithUIOffset:UIOffsetMake(0, -1)], 
      UITextAttributeTextShadowOffset, 
      nil]];
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
