//
//  Model.h
//  blogplex
//
//  Created by Tope on 27/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



@interface Model : NSObject

@property (nonatomic, copy) NSString* title;

@property (nonatomic, copy) NSString* excerpt;

@property (nonatomic, retain) NSDate* date;

@property (nonatomic, retain) NSArray* tags;

@property (nonatomic, retain) UIImage* image;

@property (nonatomic, copy) NSString* content;

-(id)initWithTitle:(NSString*)theTitle 
       andExcerpt:(NSString*)theExcerpt 
        andDate:(NSDate*)theDate 
       andTags:(NSArray*)theTags 
          andImage:(UIImage*)theImage
        andContent:(NSString*)theContent;


-(NSString*)getDay;

-(NSString*)getDayString;

-(NSString *)padStringWithZero:(NSString *)str;
@end
