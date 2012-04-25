//
//  DataLoader.h
//  blogplex
//
//  Created by Tope on 27/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataLoader : NSObject

+(NSDictionary*)loadSampleData;

+(NSDictionary*)loadDataFromFeedItems:(NSArray*)feedItems;

+(NSString*)addCSSTo:(NSString*)content;

+(NSDate*)getDateFromString:(NSString*)dateString;

+(UIImage *)getFirstImageFromContent: (NSString *) html;
@end
