/*
 This module is licenced under the BSD license.
 
 Copyright (C) 2011 by raw engineering <nikhil.jain (at) raweng (dot) com, reefaq.mohammed (at) raweng (dot) com>.
 
 All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions
 are met:
 
 * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
 
 * Redistributions in binary form must reproduce the above copyright
 notice, this list of conditions and the following disclaimer in the
 documentation and/or other materials provided with the distribution.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
 TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
//
//  MenuViewController.m
//  StackScrollView
//
//  Created by Reefaq on 2/24/11.
//  Copyright 2011 raw engineering . All rights reserved.
//

#import "MenuViewController.h"
#import "DataViewController.h"
#import "PhotoPadAppDelegate.h"
#import "RootViewController.h"
#import "StackScrollViewController.h"

#import "MenuViewCell.h"
#import "PhotoGroup.h"

@implementation MenuViewController
@synthesize tableView = _tableView;
@synthesize photoGroups, toolbar;

#pragma mark -
#pragma mark View lifecycle

- (id)initWithFrame:(CGRect)frame {
    if (self = [super init]) {
		[self.view setFrame:frame]; 
		
		_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
		[_tableView setDelegate:self];
		[_tableView setDataSource:self];
		[_tableView setBackgroundColor:[UIColor clearColor]];
        
        UIView* footerView =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1)];
		_tableView.tableFooterView = footerView;
        [footerView release];
        
		[self.view addSubview:_tableView];
		
		UIView* verticalLineView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, -5, 1, self.view.frame.size.height)];
		[verticalLineView setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
		[verticalLineView setBackgroundColor:[UIColor whiteColor]];
		[self.view addSubview:verticalLineView];
		[self.view bringSubviewToFront:verticalLineView];
        [verticalLineView release];
		
	}
    return self;
}

- (void)viewDidLoad {
    
    NSArray* names = [NSArray arrayWithObjects:@"Maldives", @"Seychelles", @"Bora Bora", @"Dubai", @"Kuala Lumpur", nil];

    NSMutableArray* groups = [NSMutableArray array];
    
    for (NSString* location in names) {
        
        PhotoGroup *group = [[PhotoGroup alloc] init];
        
        group.name = location;
        group.count = 10;
        
        [groups addObject:group];
        
        [group release];
    }
    
    self.photoGroups = [NSArray arrayWithArray:groups];
    
    self.toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    
    [self setToolBarFrameFromOrientation:self.interfaceOrientation];
    
    [self.view addSubview:toolbar];
    
    
    [super viewDidLoad];
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
	[super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Override to allow orientations other than the default portrait orientation.
    return YES;
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [photoGroups count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    MenuViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil)
    {
        NSArray* views = [[NSBundle mainBundle] loadNibNamed:@"MenuViewCell" owner:nil options:nil];
        
        for (id obj in views) {
            if([obj isKindOfClass:[UITableViewCell class]])
            {
                cell = (MenuViewCell*)obj;
                break;
            }
        }
    }
    
    PhotoGroup* group = [photoGroups objectAtIndex:indexPath.row];
    
    [cell setCellLocation:group.name withImageCount:group.count];

    
    return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DataViewController *dataViewController = [[DataViewController alloc] initWithFrame:CGRectMake(0, 0, 477, self.view.frame.size.height)];
	[[PhotoPadAppDelegate instance].rootViewController.stackScrollViewController addViewInSlider:dataViewController invokeByController:self isStackStartView:TRUE];
	[dataViewController release];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
}


- (void)dealloc {
    [_tableView release];
    [photoGroups release];
    [toolbar release];
    [super dealloc];
}


-(void)setToolBarFrameFromOrientation:(UIInterfaceOrientation)orientation
{
    
    if(UIInterfaceOrientationIsLandscape(orientation))
    {
        [toolbar setFrame:CGRectMake(0, 0, self.view.frame.size.width , 44)];
        //[toolbar setFrame:CGRectMake(0, 748 - 44, self.view.frame.size.width , 44)];
        
    }
    else if(UIInterfaceOrientationIsPortrait(orientation))
    {
        //[toolbar setFrame:CGRectMake(0, 1004 - 44, self.view.frame.size.width , 44)];
        [toolbar setFrame:CGRectMake(0, 0, self.view.frame.size.width , 44)];
        
    }
    else if(UIDeviceOrientationIsValidInterfaceOrientation(orientation))
    {
        //do something
    }
    
}

-(void) willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self setToolBarFrameFromOrientation:toInterfaceOrientation];
}
 



@end

