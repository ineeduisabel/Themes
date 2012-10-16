//
//  DetailViewController.h
//  test
//
//  Created by Valentin Filip on 8/16/12.
//  Copyright (c) 2012 AppDesignVault. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *lblWorkTitle1;
@property (strong, nonatomic) IBOutlet UILabel *lblWorkTitle2;
@property (strong, nonatomic) IBOutlet UITextView *lblWorkDesc;
@property (strong, nonatomic) IBOutlet UITextView *lblStep1Desc;
@property (strong, nonatomic) IBOutlet UITextView *lblStep2Desc;
@property (strong, nonatomic) IBOutlet UITextView *lblStep3Desc;

@end
