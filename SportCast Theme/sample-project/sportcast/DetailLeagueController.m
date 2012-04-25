//
//  DetailLeagueController.m
//  sportcast
//
//  Created by Tope on 14/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailLeagueController.h"
#import "LeagueEntry.h"
#import "LeagueListCell.h"


@implementation DetailLeagueController

@synthesize events, tableView;

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
    UIImage* bgImage = [UIImage imageNamed:@"background.png"];
    UIColor* backgroundColour = [UIColor colorWithPatternImage:bgImage];
    
    [self.view setBackgroundColor:backgroundColour];
    
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    
    LeagueEntry* entry1 = [[LeagueEntry alloc] init];
    entry1.team = @"Everton";
    entry1.goalsFor = @"10";
    entry1.goalsAgainst = @"2";
    entry1.played = @"20";
    entry1.points = @"34";
    
    LeagueEntry* entry2 = [[LeagueEntry alloc] init];
    entry2.team = @"Man Utd";
    entry2.goalsFor = @"30";
    entry2.goalsAgainst = @"12";
    entry2.played = @"20";
    entry2.points = @"34";
    
    
    LeagueEntry* entry3 = [[LeagueEntry alloc] init];
    entry3.team = @"Arsenal";
    entry3.goalsFor = @"10";
    entry3.goalsAgainst = @"2";
    entry3.played = @"20";
    entry3.points = @"33";
    
    LeagueEntry* entry4 = [[LeagueEntry alloc] init];
    entry4.team = @"Liverpool";
    entry4.goalsFor = @"3";
    entry4.goalsAgainst = @"2";
    entry4.played = @"19";
    entry4.points = @"30";
    
    LeagueEntry* entry5 = [[LeagueEntry alloc] init];
    entry5.team = @"Chelsea";
    entry5.goalsFor = @"14";
    entry5.goalsAgainst = @"20";
    entry5.played = @"19";
    entry5.points = @"29";
    
    
    self.events = [NSArray arrayWithObjects:entry1, entry2, entry3, entry4, nil];

    [super viewDidLoad];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return events.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"LeagueListCell";
    
    LeagueListCell *cell = (LeagueListCell*)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    LeagueEntry* entry = [events objectAtIndex:indexPath.row];
    
    cell.teamLabel.text = entry.team;
    cell.playedLabel.text = entry.played;
    cell.goalsForLabel.text = entry.goalsFor;
    cell.goalsAgainstLabel.text = entry.goalsAgainst;
    cell.pointsLabel.text = entry.points;
    
    BOOL isEven = (indexPath.row % 2 == 0);
    [cell changeCellBackground:isEven];
    
    //[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}


@end
