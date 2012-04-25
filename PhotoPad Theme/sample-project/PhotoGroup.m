//
//  PhotoGroup.m
//  StackScrollView
//
//  Created by Tope on 28/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PhotoGroup.h"

@implementation PhotoGroup

@synthesize name, count;


-(void)dealloc
{
    [name release];
    [super dealloc];
}


@end
