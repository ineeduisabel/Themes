//
//  DetailViewController.m
//  socioville
//
//  Created by Valentin Filip on 4/2/12.
//  Copyright (c) 2012 Universitatea Babeș-Bolyai. All rights reserved.
//

#import "DetailViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import "CustomTabBarViewController.h"

@interface DetailViewController ()

@property (strong, nonatomic) MPMoviePlayerController *movieController;
@property (strong, nonatomic) UIPopoverController *masterPopoverController;

- (void)configureView;
- (void)showMovieForURL:(NSURL *)movieURL;

@end

@implementation DetailViewController

@synthesize detailItem = _detailItem;
@synthesize tableView = _tableView;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;
@synthesize masterPopoverController = _masterPopoverController;
@synthesize movieController;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background-right.png"]];
    } else {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    }
}

- (void)viewDidUnload
{
    [self setTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.detailDescriptionLabel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    
    UIViewController *mainController = self.navigationController.parentViewController;
    CustomTabBarViewController *tabbar = (CustomTabBarViewController *)mainController.navigationController.parentViewController;
    if(tabbar.allowLandscape || UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return (interfaceOrientation == UIInterfaceOrientationPortrait);
    }
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Cards", @"Cards");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return 77;
    } else {
        return 60;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentCell"];
    
    return cell;
}


- (IBAction)playMovie:(id)sender {
    NSURL* movieURL =  [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"punkduck" ofType:@"mp4"]];
    [self showMovieForURL:movieURL];   
}

- (void)willEnterFullscreen:(NSNotification*)notification {
    NSLog(@"willEnterFullscreen");
}

- (void)enteredFullscreen:(NSNotification*)notification {
    NSLog(@"enteredFullscreen");
}

- (void)willExitFullscreen:(NSNotification*)notification {
    NSLog(@"willExitFullscreen");
    
    UIViewController *mainController = self.navigationController.parentViewController;
    CustomTabBarViewController *tabbar = (CustomTabBarViewController *)mainController.navigationController.parentViewController;
    tabbar.allowLandscape = NO;
    
}

- (void)exitedFullscreen:(NSNotification*)notification {
    NSLog(@"exitedFullscreen");
    
    UIViewController *c = [[UIViewController alloc]init];
    [self presentModalViewController:c animated:NO];
    [self dismissModalViewControllerAnimated:NO];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.movieController.view removeFromSuperview];
    self.movieController = nil;
}

- (void)playbackFinished:(NSNotification*)notification {
    NSNumber* reason = [[notification userInfo] objectForKey:MPMoviePlayerPlaybackDidFinishReasonUserInfoKey];
    switch ([reason intValue]) {
        case MPMovieFinishReasonPlaybackEnded:
            NSLog(@"playbackFinished. Reason: Playback Ended");         
            break;
        case MPMovieFinishReasonPlaybackError:
            NSLog(@"playbackFinished. Reason: Playback Error");
            break;
        case MPMovieFinishReasonUserExited:
            NSLog(@"playbackFinished. Reason: User Exited");
            break;
        default:
            break;
    }
    [self.movieController setFullscreen:NO animated:YES];
}

- (void)showMovieForURL:(NSURL *)movieURL {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willEnterFullscreen:) name:MPMoviePlayerWillEnterFullscreenNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willExitFullscreen:) name:MPMoviePlayerWillExitFullscreenNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enteredFullscreen:) name:MPMoviePlayerDidEnterFullscreenNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(exitedFullscreen:) name:MPMoviePlayerDidExitFullscreenNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    UIViewController *mainController = self.navigationController.parentViewController;
    CustomTabBarViewController *tabbar = (CustomTabBarViewController *)mainController.navigationController.parentViewController;
    tabbar.allowLandscape = YES;
    self.movieController = [[MPMoviePlayerController alloc] initWithContentURL:movieURL];
    [self.movieController prepareToPlay];
    self.movieController.view.frame = self.view.frame;
    [self.view addSubview:movieController.view];
    [self.movieController setFullscreen:YES animated:YES];
    [self.movieController play];
}

@end
