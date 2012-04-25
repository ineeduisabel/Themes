//
//  Model.m
//  blogplex
//
//  Created by Tope on 27/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Model.h"

@implementation Model

@synthesize title, date, excerpt, image, tags, content;


-(id)initWithTitle:(NSString*)theTitle 
        andExcerpt:(NSString*)theExcerpt 
           andDate:(NSDate*)theDate 
           andTags:(NSArray*)theTags 
          andImage:(UIImage*)theImage        
        andContent:(NSString*)theContent;
{
    self = [super init];
    
    if(self)
    {
        self.title = theTitle;
        self.excerpt = theExcerpt;
        self.image = theImage;
        self.tags = theTags;
        self.content = theContent;
        
        self.date = theDate;
    }
    
    return self;
}


-(NSString*)getDay
{
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *components = [cal components:(NSDayCalendarUnit) fromDate:self.date];

    [components setCalendar:cal];
    
    int day = [components day];
    
    NSString *dayString = [NSString stringWithFormat:@"%d", day];
    
    return [self padStringWithZero:dayString];
}


-(NSString*)getDayString
{
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *components = [cal components:(NSWeekdayCalendarUnit) fromDate:self.date];
    [components setCalendar:cal];
    
    int day = [components weekday];
  
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    
    NSString *dayName = [[df shortStandaloneWeekdaySymbols] objectAtIndex:(day-1)];
    
    dayName = [dayName uppercaseString];
   
    return dayName;
}

-(NSString *)padStringWithZero:(NSString *)str
{
    if([str length] == 1)
    {
        str = [NSString stringWithFormat:@"0%@", str];
    }
    
    return str;
}



@end
