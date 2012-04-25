//
//  PhotoGroup.h
//  StackScrollView
//
//  Created by Tope on 28/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoGroup : NSObject
{
    NSString* name;
    int count;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int count;
@end
