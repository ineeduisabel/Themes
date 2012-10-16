//
//  MasteriPadViewController.h
//  Reminders
//
//  Created by Valentin Filip on 9/10/12.
//  Copyright (c) 2012 AppDesignVault. All rights reserved.
//

#import <UIKit/UIKit.h>


@class SideMenuViewController;
@class StackScrollViewController;

@class UIViewExt;

@interface MasteriPadViewController : UIViewController {
    UIViewExt* rootView;
	UIView* leftMenuView;
	UIView* rightSlideView;
	
	SideMenuViewController* menuViewController;
	StackScrollViewController* stackScrollViewController;
    
}

@property (nonatomic, strong) SideMenuViewController* menuViewController;
@property (nonatomic, strong) StackScrollViewController* stackScrollViewController;

@end
