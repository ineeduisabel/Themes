//
//  ViewController.h
//  PodRadio
//
//  Created by Tope on 08/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemeListController : UIViewController<UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, strong) IBOutlet UITableView* tableListView;

@end
