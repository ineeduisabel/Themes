//
//  ElementsThemeController.m
//  sportcast
//
//  Created by Tope on 14/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ElementsThemeController.h"

@implementation ElementsThemeController

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

- (void)viewDidLoad
{
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    [self addButtonAtLocation:CGRectMake(10, 120, 298, 57) 
          WithBackgroundImage:@"brown-button" 
                     andTitle:@"Normal Button"];
    
    [self addButtonAtLocation:CGRectMake(10, 190, 298, 57) 
          WithBackgroundImage:@"green-button.png" 
                     andTitle:@"Cancel Button"];
    
    [self addButtonAtLocation:CGRectMake(10, 260, 298, 57) 
          WithBackgroundImage:@"red-button" 
                     andTitle:@"Confirm Button"];
    
    
    [self customizeLabel];
    [self customizeTextField];
    [self addSlider];
    
    UIImage* bgImage = [UIImage imageNamed:@"background.png"];
    UIColor* backgroundColour = [UIColor colorWithPatternImage:bgImage];
    
    [self.view setBackgroundColor:backgroundColour];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)customizeLabel
{
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 40, 200, 30)];
    [textLabel setTextColor:[UIColor whiteColor]];
    [textLabel setShadowColor:[UIColor blackColor]];
    [textLabel setShadowOffset:CGSizeMake(0, -1)];
    [textLabel setBackgroundColor:[UIColor clearColor]];
    [textLabel setFont:[UIFont boldSystemFontOfSize:20]];
    [textLabel setText:@"Label"];
    
    [self.view addSubview:textLabel];
}

-(void)customizeTextField
{
    
    UITextField * textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 80, 268, 30)];
    
    UIImage *textBackground = [UIImage imageNamed:@"text-field.png"];
    [textField setBackground:textBackground];
    [textField setBorderStyle:UITextBorderStyleRoundedRect];
    
    [textField setText:@"Text Input"];
    [textField setDelegate:self];
    
    [self.view addSubview:textField];
}


-(void)addSlider
{
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(10, 330, 298, 10)];
    
    [slider setValue:0.5];
    [self.view addSubview:slider];
}

-(void)addButtonAtLocation:(CGRect)location WithBackgroundImage:(NSString*)imageName andTitle:(NSString*)title
{
    UIButton * button = [[UIButton alloc] initWithFrame:location];
    UIImage * bgImage = [UIImage imageNamed:imageName];
    [button setBackgroundImage:bgImage forState:UIControlStateNormal];
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleShadowColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    
    [button.titleLabel setShadowOffset:CGSizeMake(1.0, -1.0)];
    [button.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    
    [self.view addSubview:button];
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

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

@end
