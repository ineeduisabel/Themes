//
//  MasterViewController.m
//  socioville
//
//  Created by Valentin Filip on 4/2/12.
//  Copyright (c) 2012 Universitatea Babeș-Bolyai. All rights reserved.
//

#import "MasterViewController.h"
#import "ZUUIRevealController.h"
#import "DetailViewController.h"

@interface MasterViewController ()

@property (retain, nonatomic) UIPanGestureRecognizer *navigationBarPanGestureRecognizer;

@end

@implementation MasterViewController

@synthesize detailViewController = _detailViewController;
@synthesize navigationBarPanGestureRecognizer;

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];

    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)viewDidUnload
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	self.title = NSLocalizedString(@"Cards View", @"Cards View");
	
    UINavigationController *nav = self.navigationController;
    UIViewController *controller = nav.parentViewController; // MainViewController : ZUUIRevealController
    if ([controller respondsToSelector:@selector(revealGesture:)] && [controller respondsToSelector:@selector(revealToggle:)])
	{
		// Check if a UIPanGestureRecognizer already sits atop our NavigationBar.
		if (![[self.navigationController.navigationBar gestureRecognizers] containsObject:self.navigationBarPanGestureRecognizer])
		{
			// If not, allocate one and add it.
			UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:controller action:@selector(revealGesture:)];
			self.navigationBarPanGestureRecognizer = panGestureRecognizer;
			
			[self.navigationController.navigationBar addGestureRecognizer:self.navigationBarPanGestureRecognizer];
		}
		
		// Check if we have a revealButton already.
		if (![self.navigationItem leftBarButtonItem]) {
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuControllerSelectedOption:) name:@"MenuSelectedOption" object:nil];
			// If not, allocate one and add it.
			UIImage *imageMenu = [UIImage imageNamed:@"button-menu.png"];
            UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [menuButton setImage:imageMenu forState:UIControlStateNormal];
            menuButton.frame = CGRectMake(0.0, 0.0, imageMenu.size.width, imageMenu.size.height);
            [menuButton addTarget:controller action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
            
            self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
		}
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return (interfaceOrientation == UIInterfaceOrientationPortrait);
    }
}

#pragma mark - Actions

- (void)menuControllerSelectedOption:(NSDictionary *)args {
    NSLog(@"selected option: %@", args);
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 215;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CardCell"];
    //NSDate *object = [_objects objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.detailViewController.detailItem = @"detail";
    } else {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        [[segue destinationViewController] setDetailItem:@"detail"];
    }
}

@end
