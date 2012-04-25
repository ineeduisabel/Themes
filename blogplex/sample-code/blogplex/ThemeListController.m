//
//  ViewController.m
//  blogplex
//
//  Created by Tope on 08/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ThemeListController.h"
#import "ThemeListCell.h"
#import "DataLoader.h"
#import "Model.h"
#import "DetailThemeController.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>


@implementation ThemeListController

@synthesize tableListView, articles, feedParser, parsedItems, shouldLoadRSS;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (void)viewDidLoad
{
    [self.navigationController setNavigationBarHidden:NO];
    
    if(shouldLoadRSS)
    {
        [self loadFromFeed];
    }
    else
    {
        self.articles = [DataLoader loadSampleData];
    }
    
    [tableListView setDelegate:self];
    [tableListView setDataSource:self];
    
    [tableListView setBackgroundColor:[UIColor clearColor]];
    [tableListView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [tableListView setFrame:CGRectMake(0, 0, 320, 480)];
    
    
    UIColor* bgColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    [self.view setBackgroundColor:bgColor];
    
    UIBarButtonItem* backButton = [self createBackBarButtonWithImage:@"back.png"];
    UIBarButtonItem* contactButton = [self createToolBarButtonWithImage:@"add.png"];
    
    [self.navigationItem setLeftBarButtonItem:backButton];
    [self.navigationItem setRightBarButtonItem:contactButton];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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

-(UIBarButtonItem*)createToolBarButtonWithImage:(NSString*)imageName
{
    UIImage* buttonImage = [UIImage imageNamed:imageName];
    
    UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 24, 24)];
    [button setImage:buttonImage forState:UIControlStateNormal];
    [button addTarget:self action:@selector(openContactForm) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return barButton;
}


-(void)back 
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)openContactForm 
{
    [self performSegueWithIdentifier:@"contact" sender:self];
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
    
	self.tableListView.userInteractionEnabled = YES;
	//self.tableView.alpha = 1;
	[self.tableListView reloadData];
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
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"ThemeListCell";

    ThemeListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    NSArray* categories = [self getCategories];
  
    NSArray* articlesforSection = [self getArticlesForSection:indexPath.section];
    
    //Add shadow for last row
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


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self performSegueWithIdentifier:@"detail" sender:self];
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"detail"])
    {
        DetailThemeController* detail = segue.destinationViewController;
    
        NSIndexPath *indexPath = [tableListView indexPathForSelectedRow];
    
        NSArray* articlesForSection = [self getArticlesForSection:indexPath.section];
    
        Model* model = [articlesForSection objectAtIndex:indexPath.row];
    
        [detail setModel:model];
    }
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
