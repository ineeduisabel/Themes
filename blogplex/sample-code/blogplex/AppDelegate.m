//
//  AppDelegate.m
//  blogplex
//
//  Created by Tope on 17/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "MasterViewController.h"
#import "DetailThemeiPadController.h"


@implementation AppDelegate

@synthesize window = _window;

@synthesize colorSwitcher;


+ (AppDelegate *) instance 
{
	return (AppDelegate *) [[UIApplication sharedApplication] delegate];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.colorSwitcher = [[ColorSwitcher alloc] initWithScheme:@"red"];
    //self.colorSwitcher = [[ColorSwitcher alloc] initWithScheme:@"brown"];
    //self.colorSwitcher = [[ColorSwitcher alloc] initWithScheme:@"blue"];
    //self.colorSwitcher = [[ColorSwitcher alloc] initWithScheme:@"green"];
    
    [self customizeGlobalTheme];
    
    UIUserInterfaceIdiom idiom = [[UIDevice currentDevice] userInterfaceIdiom];
    
    if (idiom == UIUserInterfaceIdiomPad) 
    {
        [self iPadInit];
    }
    else
    {
        [self iPhoneInit];
    }

    return YES;
}

- (void)customizeGlobalTheme
{
    UIImage *navBarImage = [colorSwitcher processImageWithName:@"menubar.png"];
    
    [[UINavigationBar appearance] setBackgroundImage:navBarImage 
                                       forBarMetrics:UIBarMetricsDefault];
    
    UIImage* tabBarBackground = [UIImage imageNamed:@"tabbar.png"];
    [[UITabBar appearance] setBackgroundImage:tabBarBackground];
    
       
}

-(void)iPhoneInit
{
    UIImage *navBarImage = [colorSwitcher processImageWithName:@"menubar.png"];
    
    [[UIToolbar appearance] setBackgroundImage:navBarImage forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];  
}

-(void)iPadInit
{
    UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController; 
    
    splitViewController.delegate = [splitViewController.viewControllers lastObject];
    
    
    id<MasterViewControllerDelegate> delegate = [splitViewController.viewControllers lastObject];
    UINavigationController* nav = [splitViewController.viewControllers objectAtIndex:0];
    
    MasterViewController* master = [nav.viewControllers objectAtIndex:0];
    
    master.delegate = delegate;
    
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
