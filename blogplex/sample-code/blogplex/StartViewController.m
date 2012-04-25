//
//  StartViewController.m
//  blogplex
//
//  Created by Tope on 20/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StartViewController.h"
#import "ThemeListController.h"
#import "AppDelegate.h"

@implementation StartViewController


@synthesize loadRSSButton, loadSampleButton, shouldLoadRSS;

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
    [loadRSSButton addTarget:self action:@selector(loadData:) forControlEvents:UIControlEventTouchUpInside];
    
    [loadSampleButton addTarget:self action:@selector(loadData:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    UIImage* img = [[[AppDelegate instance] colorSwitcher] processImageWithName:@"red-background.png"];
    
    UIColor * bgColor = [UIColor colorWithPatternImage:img];
    [self.view setBackgroundColor:bgColor];
    
    [super viewDidLoad];
}

-(void)loadData:(UIButton*)sender
{
    shouldLoadRSS = (sender == loadRSSButton);
 
    [self performSegueWithIdentifier:@"load" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ThemeListController* listController = segue.destinationViewController;
    
    listController.shouldLoadRSS = shouldLoadRSS;
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
