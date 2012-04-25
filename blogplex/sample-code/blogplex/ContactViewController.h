//
//  ContactViewController.h
//  blogplex
//
//  Created by Tope on 17/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactViewController : UIViewController <UITextViewDelegate>

-(UIBarButtonItem*)createBackBarButtonWithImage:(NSString*)imageName;

-(void)back;

- (IBAction)textFieldDone:(id)sender;

@property (nonatomic, weak) IBOutlet UIImageView* logoImage;


@property (nonatomic, weak) IBOutlet UITextField* nameTextField;

@property (nonatomic, weak) IBOutlet UITextField* emailTextField;

@property (nonatomic, weak) IBOutlet UITextView* messageTextView;

@end
