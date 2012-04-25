//
//  DetailThemeiPadController.m
//  mapper
//
//  Created by Tope on 12/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailThemeiPadController.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>

@implementation DetailThemeiPadController
{
    UIPopoverController *masterPopoverController;
}

@synthesize toolbar, toolbarBottom;

@synthesize titleLabel, articleImageView, articleWebView, dateLabel, scrollView, shadowView, sideGradientView;

@synthesize tagContainer;

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
    UIImage* toolBarBg = [[[AppDelegate instance] colorSwitcher] processImageWithName:@"ipad-menubar-right.png"];
    
    [toolbar setBackgroundImage:toolBarBg forToolbarPosition:UIToolbarPositionTop barMetrics:UIBarMetricsDefault];
    
    
    UIImage* bottomToolBarBg = [UIImage imageNamed:@"ipad-tabbar-right.png"];
    
    [toolbarBottom setBackgroundImage:bottomToolBarBg forToolbarPosition:UIToolbarPositionBottom barMetrics:UIBarMetricsDefault];
    
    UIColor* bgColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ipad-background.png"]];
    [self.view setBackgroundColor:bgColor];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = sideGradientView.bounds;
    
    UIColor* lightColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    UIColor* darkColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    
    gradient.colors = [NSArray arrayWithObjects:(id)darkColor.CGColor, (id)lightColor.CGColor, nil];
    gradient.startPoint = CGPointMake(0.0, 0.5);
    gradient.endPoint = CGPointMake(1.0, 0.5);

    [sideGradientView.layer insertSublayer:gradient atIndex:0];

    
    //Add tags/
    //Only useful if you can get tags from RSS feeds. 
    UIView* tag1 = [self createTagViewWithName:@"Apple"];
    UIView* tag2 = [self createTagViewWithName:@"iOS"];
    
    tag1.frame = CGRectMake(40, 3, tag1.frame.size.width, tag1.frame.size.height);
    [tagContainer addSubview:tag1];
    
    //Add tags at an offset from the last tag
    tag2.frame = CGRectMake(40 + tag1.frame.size.width + 10 , 3, tag2.frame.size.width, tag2.frame.size.height);
    [tagContainer addSubview:tag2];
      
    [super viewDidLoad];
}


-(void)loadDataIntoView:(Model*)model
{
    [titleLabel setText:model.title];
    [articleImageView setImage:model.image];
    [articleWebView loadHTMLString:model.content baseURL:nil];
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"EEE, dd MMMM yyyy"];
    [dateLabel setText:[format stringFromDate:model.date]];
    
    articleWebView.delegate = self;
    
    shadowView.layer.shadowColor = [UIColor blackColor].CGColor; 
    shadowView.layer.shadowOffset = CGSizeMake(0, 0);
    shadowView.layer.shadowOpacity = 0.4;
    shadowView.layer.shadowRadius = 4; 
    shadowView.layer.masksToBounds = NO;
    
    [articleImageView setClipsToBounds:YES];
}


- (void)webViewDidFinishLoad:(UIWebView *)webview {
    
    CGRect frame = self.articleWebView.frame;
    CGSize fittingSize = [self.articleWebView sizeThatFits:CGSizeZero];
    frame.size = fittingSize;
    self.articleWebView.frame = frame;
    
    CGFloat totalHeight = self.articleWebView.frame.origin.y + self.articleWebView.frame.size.height + 30;
    
    
    [scrollView setContentSize:CGSizeMake(320, totalHeight)];
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
	return YES;
}


- (void)splitViewController: (UISplitViewController *)splitViewController 
     willHideViewController:(UIViewController *)viewController 
          withBarButtonItem:(UIBarButtonItem *)barButtonItem
       forPopoverController: (UIPopoverController *)popoverController
{
    barButtonItem.title = @"Master";
    barButtonItem.tintColor = [[[AppDelegate instance] colorSwitcher] tintColorForButton];
    NSMutableArray *items = [[self.toolbar items] mutableCopy]; 
    [items insertObject:barButtonItem atIndex:0];
    [self.toolbar setItems:items animated:YES]; 

}


- (void)splitViewController:(UISplitViewController *)splitController 
     willShowViewController:(UIViewController *)viewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    NSMutableArray *items = [[self.toolbar items] mutableCopy]; 
    [items removeObject:barButtonItem];
    [self.toolbar setItems:items animated:YES]; 
    masterPopoverController = nil;
}


-(UIView*)createTagViewWithName:(NSString*)tag
{
    CGSize textSize = [tag sizeWithFont:[UIFont systemFontOfSize:15.0]];
    
    UIView* tagView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, textSize.width + 10, textSize.height + 5)];
    [tagView setBackgroundColor:[UIColor clearColor]];
    
    CAGradientLayer *sublayer = [CAGradientLayer layer];
    
    UIColor* lightColor = [UIColor colorWithRed:191.0/255 green:208.0/255 blue:242.0/255 alpha:1.0];
    UIColor* darkColor = [UIColor colorWithRed:218.0/255 green:228.0/255 blue:247.0/255 alpha:1.0];
    
    sublayer.colors = [NSArray arrayWithObjects:(id)darkColor.CGColor, (id)lightColor.CGColor, nil];
    sublayer.borderColor = [UIColor colorWithRed:119.0/255 green:131.0/255 blue:215.0/255 alpha:1.0].CGColor;
    sublayer.borderWidth = 1.0;
    sublayer.cornerRadius = 12;
    
    sublayer.frame = tagView.frame;
    [tagView.layer addSublayer:sublayer];
    
    
    UILabel* tagLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 2.5, textSize.width, textSize.height)];
    [tagLabel setBackgroundColor:[UIColor clearColor]];
    [tagLabel setFont:[UIFont systemFontOfSize:15.0]];
    [tagLabel setText:tag];
    [tagLabel setTextColor:[UIColor blackColor]];
    
    [tagView addSubview:tagLabel];
    
    return tagView;
}

@end
