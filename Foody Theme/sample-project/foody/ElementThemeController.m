//
//  ElementThemeController.m
//  PodRadio
//
//  Created by Tope on 06/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ElementThemeController.h"

@implementation ElementThemeController

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

- (void)viewDidLoad
{
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    [self addButtonAtLocation:CGRectMake(10, 120, 295, 48) 
          WithBackgroundImage:@"button" 
                     andTitle:@"Standard Button"];
    
    [self addButtonAtLocation:CGRectMake(10, 190, 295, 48) 
          WithBackgroundImage:@"button-pressed" 
                     andTitle:@"Button Pressed"];
    
    
    [self customizeLabel];
    [self customizeTextField];
    [self addSlider];
    
    UIColor *color = [UIColor colorWithPatternImage:[UIImage imageNamed:@"leather-background.png"]];
    [self.view setBackgroundColor:color];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)customizeLabel
{
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 40, 200, 30)];
    [textLabel setTextColor:[UIColor colorWithRed:163.0/255 green:117.0/255 blue:89.0/255 alpha:1.0]];
    [textLabel setBackgroundColor:[UIColor clearColor]];
    [textLabel setFont:[UIFont boldSystemFontOfSize:20]];
    [textLabel setText:@"Label"];
    
    [self.view addSubview:textLabel];
}

-(void)customizeTextField
{
    
    UITextField * textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 80, 295, 27)];
    
    UIImage *textBackground = [UIImage imageNamed:@"input-text.png"];
    [textField setBackground:textBackground];
    [textField setBorderStyle:UITextBorderStyleNone];
    
    [textField setTextColor:[UIColor blackColor]];
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    textField.leftView = paddingView;
    textField.leftViewMode = UITextFieldViewModeAlways;
    
    [textField setText:@"Text Input"];
    
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

@end
