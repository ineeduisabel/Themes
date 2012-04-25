//
//  ViewController.m
//  foody
//
//  Created by Tope on 25/10/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "StepListController.h"
#import "StepListCell.h"
#import "DetailThemeController.h"

@implementation StepListController


@synthesize stepsTableView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    [stepsTableView setDelegate:self];
    [stepsTableView setDataSource:self];
    [stepsTableView setBackgroundColor:[UIColor clearColor]];
    [stepsTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:stepsTableView];
    
    UIColor *color = [UIColor colorWithPatternImage:[UIImage imageNamed:@"leather-background.png"]];
    
    [self.view setBackgroundColor:color];
    
    self.title = @"Dishes";
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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
    
    static NSString *CellIdentifier = @"StepListCell";    
    StepListCell *cell = (StepListCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 94;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}



@end
