//
//  MasteriPadViewController.m
//  Reminders
//
//  Created by Valentin Filip on 9/10/12.
//  Copyright (c) 2012 AppDesignVault. All rights reserved.
//

#import "MasteriPadViewController.h"
#import "ADVTheme.h"
#import "SideMenuViewController.h"
#import "StackScrollViewController.h"


@interface UIViewExt : UIView {} 
@end


@implementation UIViewExt
- (UIView *) hitTest: (CGPoint) pt withEvent: (UIEvent *) event 
{   
	
	UIView* viewToReturn=nil;
	CGPoint pointToReturn;
	
	UIView* uiRightView = (UIView*)[self subviews][1];
	
	if ([uiRightView subviews][0]) {
		
		UIView* uiStackScrollView = [uiRightView subviews][0];	
		
		if ([uiStackScrollView subviews][1]) {	 
			
			UIView* uiSlideView = [uiStackScrollView subviews][1];	
			
			for (UIView* subView in [uiSlideView subviews]) {
				CGPoint point  = [subView convertPoint:pt fromView:self];
				if ([subView pointInside:point withEvent:event]) {
					viewToReturn = subView;
					pointToReturn = point;
				}
				
			}
		}
		
	}
	
	if(viewToReturn != nil) {
		return [viewToReturn hitTest:pointToReturn withEvent:event];		
	}
	
	return [super hitTest:pt withEvent:event];	
	
}

@end

@interface MasteriPadViewController ()

@end

@implementation MasteriPadViewController

@synthesize menuViewController, stackScrollViewController;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Reminders";
	rootView = [[UIViewExt alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
	rootView.autoresizingMask = UIViewAutoresizingFlexibleWidth + UIViewAutoresizingFlexibleHeight;
	[rootView setBackgroundColor:[UIColor clearColor]];
	
	leftMenuView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 70, CGRectGetHeight(self.view.bounds) - self.navigationController.navigationBar.bounds.size.height)];
	leftMenuView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    menuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuViewController"];
    menuViewController.view.frame = CGRectMake(0, 0, leftMenuView.frame.size.width, leftMenuView.frame.size.height);
	[menuViewController.view setBackgroundColor:[UIColor clearColor]];
	[menuViewController viewWillAppear:FALSE];
	[menuViewController viewDidAppear:FALSE];
    
    [menuViewController.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"sidemenuBackground"]]];
    menuViewController.tableView.backgroundColor = [UIColor clearColor];
    
	[leftMenuView addSubview:menuViewController.view];
	
	rightSlideView = [[UIView alloc] initWithFrame:CGRectMake(leftMenuView.frame.size.width, 0, rootView.frame.size.width - leftMenuView.frame.size.width, rootView.frame.size.height)];
	rightSlideView.autoresizingMask = UIViewAutoresizingFlexibleWidth + UIViewAutoresizingFlexibleHeight;
	stackScrollViewController = [[StackScrollViewController alloc] init];	
	[stackScrollViewController.view setFrame:CGRectMake(0, 0, rightSlideView.frame.size.width, rightSlideView.frame.size.height)];
	[stackScrollViewController.view setAutoresizingMask:UIViewAutoresizingFlexibleWidth + UIViewAutoresizingFlexibleHeight];
	[stackScrollViewController viewWillAppear:FALSE];
	[stackScrollViewController viewDidAppear:FALSE];
	[rightSlideView addSubview:stackScrollViewController.view];
	
	[rootView addSubview:leftMenuView];
	[rootView addSubview:rightSlideView];
	[self.view setBackgroundColor:[UIColor colorWithPatternImage: [UIImage imageNamed:@"backgroundImage_repeat.png"]]];
	[self.view addSubview:rootView];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:NO];
    [menuViewController viewDidAppear:NO];
    [stackScrollViewController viewDidAppear:NO];
    
    leftMenuView.frame = CGRectMake(0, 0, 70, CGRectGetHeight(self.view.bounds));
    menuViewController.view.frame = CGRectMake(0, 0, leftMenuView.frame.size.width, leftMenuView.frame.size.height);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {    
	[menuViewController didRotateFromInterfaceOrientation:fromInterfaceOrientation];
	[stackScrollViewController didRotateFromInterfaceOrientation:fromInterfaceOrientation];
}

-(void) willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    leftMenuView.frame = CGRectMake(0, 0, 70, CGRectGetHeight(self.view.bounds));
    menuViewController.view.frame = CGRectMake(0, 0, leftMenuView.frame.size.width, leftMenuView.frame.size.height);
    
	[menuViewController willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
	[stackScrollViewController willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
}

@end
