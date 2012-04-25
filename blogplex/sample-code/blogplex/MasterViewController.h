//
//  MasterViewController.h
//  mapper
//
//  Created by Tope on 09/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import "MWFeedParser.h"

@protocol MasterViewControllerDelegate;

@interface MasterViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, MWFeedParserDelegate>

@property (nonatomic, strong) IBOutlet UITableView* masterTableView;

@property (nonatomic, strong) IBOutlet UIToolbar* toolbar;

@property (nonatomic, strong) IBOutlet UIToolbar* toolbarBottom;

@property (nonatomic, strong) IBOutlet UIView* gradientView;

@property (nonatomic, retain) MWFeedParser *feedParser;

@property (nonatomic, retain) NSMutableArray *parsedItems;

@property (nonatomic, strong) NSDictionary* articles;

@property (nonatomic, assign) BOOL shouldLoadRSS;

@property (nonatomic, assign) id<MasterViewControllerDelegate> delegate;

-(NSArray*)getArticlesForSection:(NSInteger)section;

-(NSArray*)getCategories;

- (void)updateTableWithParsedItems;

-(void)loadFromFeed;
@end


@protocol MasterViewControllerDelegate <NSObject>

-(void)loadDataIntoView:(Model*)model;

@end