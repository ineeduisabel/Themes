//
//  MasterViewController.m
//  mapper
//
//  Created by Tope on 09/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "MasterViewController.h"
#import "MasterCell.h"
#import "DataLoader.h"
#import "AppDelegate.h"

@implementation MasterViewController

@synthesize masterTableView, toolbar, toolbarBottom, articles, shouldLoadRSS, delegate, gradientView;

@synthesize feedParser, parsedItems;

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
    
    if(!shouldLoadRSS)
    {
        [self loadFromFeed];
    }
    else
    {
        self.articles = [DataLoader loadSampleData];
    }
    
    UIImage* toolbarBgBottom = [UIImage imageNamed:@"ipad-tabbar-left.png"];
    [toolbarBottom setBackgroundImage:toolbarBgBottom forToolbarPosition:UIToolbarPositionBottom barMetrics:UIBarMetricsDefault];
    
    UIImage *navBarImage = [[[AppDelegate instance] colorSwitcher] processImageWithName:@"ipad-menubar-left.png"];
    
    [self.navigationController.navigationBar setBackgroundImage:navBarImage 
                                       forBarMetrics:UIBarMetricsDefault];
    
    masterTableView.delegate = self;
    masterTableView.dataSource = self;
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:20.0];
    label.shadowColor = [UIColor blackColor];
    label.textAlignment = UITextAlignmentCenter;
    label.textColor = [UIColor whiteColor]; 
    self.navigationItem.titleView = label;
    
    label.text = @"Articles";
    [label sizeToFit];
    
    [self.navigationItem setTitleView:label];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = gradientView.bounds;
    
    UIColor* lightColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    UIColor* darkColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    
    gradient.colors = [NSArray arrayWithObjects:(id)darkColor.CGColor, (id)lightColor.CGColor, nil];
    [gradientView.layer insertSublayer:gradient atIndex:0];

   
    UIColor* bgColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    [self.view setBackgroundColor:bgColor];
    
    [super viewDidLoad];
}


-(void)loadFromFeed
{
    NSURL *feedURL = [NSURL URLWithString:@"http://www.bgr.com/feed/"];
	feedParser = [[MWFeedParser alloc] initWithFeedURL:feedURL];
	feedParser.delegate = self;
	feedParser.feedParseType = ParseTypeFull; // Parse feed info and all items
	feedParser.connectionType = ConnectionTypeAsynchronously;
	[feedParser parse];
    
    self.parsedItems = [[NSMutableArray alloc] init];
    self.title = @"Loading feed...";
    
}

- (void)updateTableWithParsedItems {
    
    articles = [DataLoader loadDataFromFeedItems:parsedItems];
    
	self.masterTableView.userInteractionEnabled = YES;

	[self.masterTableView reloadData];
    self.title = @"Articles";
}

- (void)feedParserDidStart:(MWFeedParser *)parser {
	NSLog(@"Started Parsing: %@", parser.url);
}

- (void)feedParser:(MWFeedParser *)parser didParseFeedInfo:(MWFeedInfo *)info {
	NSLog(@"Parsed Feed Info: “%@”", info.title);
}

- (void)feedParser:(MWFeedParser *)parser didParseFeedItem:(MWFeedItem *)item {
	NSLog(@"Parsed Feed Item: “%@”", item.title);
	if (item) [parsedItems addObject:item];	
}

- (void)feedParserDidFinish:(MWFeedParser *)parser {
	NSLog(@"Finished Parsing%@", (parser.stopped ? @" (Stopped)" : @""));
    [self updateTableWithParsedItems];
}

- (void)feedParser:(MWFeedParser *)parser didFailWithError:(NSError *)error {
	NSLog(@"Finished Parsing With Error: %@", error);
    if (parsedItems.count == 0) {
        self.title = @"Failed"; // Show failed message in title
    } else {
        // Failed but some items parsed, so show and inform of error
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Parsing Incomplete"
                                                        message:@"There was an error during the parsing of this feed. Not all of the feed items could parsed."
                                                       delegate:nil
                                              cancelButtonTitle:@"Dismiss"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
    [self updateTableWithParsedItems];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

#pragma mark - Table view data source


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"MasterCell"; 
    
    MasterCell *cell = (MasterCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    NSArray* categories = [self getCategories];
    
    NSArray* articlesforSection = [self getArticlesForSection:indexPath.section];
    
    if(indexPath.row == articlesforSection.count - 1 && indexPath.section == categories.count - 1)
    {
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.frame = CGRectMake(0, 81, 320, 5);
        
        UIColor* lightColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
        UIColor* darkColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        
        gradient.colors = [NSArray arrayWithObjects:(id)darkColor.CGColor, (id)lightColor.CGColor, nil];
        [cell.layer insertSublayer:gradient atIndex:0];
    }
    
    
    Model* model = [articlesforSection objectAtIndex:indexPath.row];

    [cell.titleLabel setText:model.title];
    [cell.excerptLabel setText:model.excerpt];
    [cell.dateLabel setText:model.getDay];
    [cell.dayLabel setText:model.getDayString];
    
    UIImage* img = [[[AppDelegate instance] colorSwitcher] processImageWithName:@"list-item.png"];
    [cell.bgImageView setImage:img];
    
    return cell;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 81;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self getCategories].count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self getArticlesForSection:section].count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* headerView = [[[NSBundle mainBundle] loadNibNamed:@"ListHeaderView" owner:nil options:nil] objectAtIndex:0];
    
    UILabel* titleLabel = (UILabel*)[headerView viewWithTag:1];
    
    NSArray* categories = [self getCategories];
    
    [titleLabel setText:[categories objectAtIndex:section]];
    
    return headerView;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray* articlesForSection = [self getArticlesForSection:indexPath.section];
    
    Model* model = [articlesForSection objectAtIndex:indexPath.row];
    
    [delegate loadDataIntoView:model];
    
}

-(NSArray*)getArticlesForSection:(NSInteger)section
{
    NSArray* keys = [articles allKeys];
    
    NSString* currentKey = [keys objectAtIndex:section];
    
    return [articles objectForKey:currentKey];
}

-(NSArray*)getCategories
{
    return [articles allKeys];
}

@end
