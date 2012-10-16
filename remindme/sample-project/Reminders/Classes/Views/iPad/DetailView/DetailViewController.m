//
//  DetailViewController.m
//  test
//
//  Created by Valentin Filip on 8/16/12.
//  Copyright (c) 2012 AppDesignVault. All rights reserved.
//

#import "DetailViewController.h"
#import "ADVTheme.h"

@interface DetailViewController ()

@property (strong, nonatomic) UIPopoverController *masterPopoverController;

- (void)configureView;

@end





@implementation DetailViewController

@synthesize lblWorkTitle1;
@synthesize lblWorkTitle2;
@synthesize lblWorkDesc;
@synthesize lblStep1Desc;
@synthesize lblStep2Desc;
@synthesize lblStep3Desc;
@synthesize detailItem = _detailItem;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
    
    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView {
    if (self.detailItem) {
        NSArray *chunks = [[self.detailItem valueForKey:@"title"] componentsSeparatedByString: @" "];
        lblWorkTitle1.text = chunks[0];
        lblWorkTitle2.text = chunks[1];
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
    [ADVThemeManager customizeView:self.view];
    
    [self willRotateToInterfaceOrientation:[[UIDevice currentDevice] orientation] duration:0];
    
    lblWorkDesc.font = lblStep1Desc.font = lblStep2Desc.font = lblStep3Desc.font
    = [UIFont fontWithName:@"HelveticaNeueCE-Regular" size:13.0f];
}

- (void)viewDidUnload {
    [self setLblWorkTitle1:nil];
    [self setLblWorkTitle2:nil];
    [self setLblWorkDesc:nil];
    [self setLblStep1Desc:nil];
    [self setLblStep2Desc:nil];
    [self setLblStep3Desc:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    UIImage *navBkg = [[ADVThemeManager sharedTheme] navigationBackgroundForIPadAndOrientation:toInterfaceOrientation];
    [self.navigationController.navigationBar setBackgroundImage:navBkg forBarMetrics:UIBarMetricsDefault];
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Workouts", @"Workouts");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
