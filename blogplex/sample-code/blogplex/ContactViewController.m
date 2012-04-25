//
//  ContactViewController.m
//  blogplex
//
//  Created by Tope on 17/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#define kOFFSET_FOR_KEYBOARD 120

#import "ContactViewController.h"
#import "AppDelegate.h"

@implementation ContactViewController

@synthesize logoImage, nameTextField, emailTextField, messageTextView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    UIImage* newImage = [[[AppDelegate instance] colorSwitcher] processImageWithName:@"red-background.png"];
                           
    UIColor * bgColor = [UIColor colorWithPatternImage:newImage];
    [self.view setBackgroundColor:bgColor];
    
    UIBarButtonItem* backButton = [self createBackBarButtonWithImage:@"back.png"];
    
    [self.navigationItem setLeftBarButtonItem:backButton];
    
    [nameTextField setReturnKeyType:UIReturnKeyDone];
    [nameTextField addTarget:self action:@selector(textFieldDone:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [emailTextField setReturnKeyType:UIReturnKeyDone];
    [emailTextField addTarget:self action:@selector(textFieldDone:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [messageTextView setReturnKeyType:UIReturnKeyDone];
    [messageTextView setDelegate:self];
    
    [super viewDidLoad];
}


- (BOOL) textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if([text isEqualToString:@"\n"]){
        [textView resignFirstResponder];
        return NO;
    }else{
        return YES;
    }
}


- (IBAction)textFieldDone:(id)sender {
    [sender resignFirstResponder];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(UIBarButtonItem*)createBackBarButtonWithImage:(NSString*)imageName
{
    UIImage* buttonImage = [UIImage imageNamed:imageName];
    
    UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 24, 24)];
    [button setImage:buttonImage forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return barButton;
}

-(void)back {
    
    [self.navigationController popViewControllerAnimated:YES];
}




@end
