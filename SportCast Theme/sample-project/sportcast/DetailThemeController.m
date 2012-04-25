//
//  DetailThemeController.m
//  sportcast
//
//  Created by Tope on 14/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailThemeController.h"
#import "GameEvent.h"
#import "DetailListCell.h"

@implementation DetailThemeController

@synthesize tableView, events;

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
 
    GameEvent* event1 = [[GameEvent alloc] init];
    event1.eventName = @"Yellow Cards";
    event1.teamValue1 = @"0";
    event1.teamValue2 = @"0";
    
    GameEvent* event2 = [[GameEvent alloc] init];
    event2.eventName = @"Red Cards";
    event2.teamValue1 = @"0";
    event2.teamValue2 = @"1";
    
    GameEvent* event3 = [[GameEvent alloc] init];
    event3.eventName = @"Shots";
    event3.teamValue1 = @"12";
    event3.teamValue2 = @"10";
    
    GameEvent* event4 = [[GameEvent alloc] init];
    event4.eventName = @"Shots on Goal";
    event4.teamValue1 = @"4";
    event4.teamValue2 = @"2";
    
    
    self.events = [NSArray arrayWithObjects:event1, event2, event3, event4, nil];

   
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
    static NSString *CellIdentifier = @"DetailListCell";
    
    DetailListCell *cell = (DetailListCell*)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    

    GameEvent* event = [events objectAtIndex:indexPath.row];
    
    cell.eventLabel.text = event.eventName;
    cell.teamEvent1.text = event.teamValue1;
    cell.teamEvent2.text = event.teamValue2;
    
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

@end
