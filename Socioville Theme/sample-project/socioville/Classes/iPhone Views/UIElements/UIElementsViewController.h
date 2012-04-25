//
//  UIElementsViewController.h
//  socioville
//
//  Created by Valentin Filip on 4/3/12.
//  Copyright (c) 2012 Universitatea Babeș-Bolyai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIElementsViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)sliderValueChanged:(id)sender;

@end
