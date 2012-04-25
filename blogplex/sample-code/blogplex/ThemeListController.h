//
//  ViewController.h
//  blogplex
//
//  Created by Tope on 08/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWFeedParser.h"

@interface ThemeListController : UIViewController<UITableViewDelegate, UITableViewDataSource, MWFeedParserDelegate>


@property (nonatomic, strong) IBOutlet UITableView* tableListView;

@property (nonatomic, retain) NSDictionary* articles;

@property (nonatomic, retain) MWFeedParser *feedParser;

@property (nonatomic, retain) NSMutableArray *parsedItems;

@property (nonatomic, assign) BOOL shouldLoadRSS;

-(NSArray*)getArticlesForSection:(NSInteger)section;

-(NSArray*)getCategories;

- (void)updateTableWithParsedItems;

-(void)loadFromFeed;

-(UIBarButtonItem*)createBackBarButtonWithImage:(NSString*)imageName;

-(UIBarButtonItem*)createToolBarButtonWithImage:(NSString*)imageName;

-(void)back ;

-(void)openContactForm ;

@end
