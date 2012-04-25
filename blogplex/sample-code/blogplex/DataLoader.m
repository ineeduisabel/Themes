//
//  DataLoader.m
//  blogplex
//
//  Created by Tope on 27/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DataLoader.h"
#import "Model.h"
#import "MWFeedItem.h"

@implementation DataLoader


+(NSDictionary*)loadSampleData
{
    NSString* content = [self addCSSTo:@"Apple has finally revealed its next iPhone — the iPhone 4S. The company is, as would be expected, calling it “the most amazing iPhone yet.” But what makes it better than the iPhone 4?<br><br>Apple fanboys and girls the world round might be disappointed that the new device does not live up to the mystique of the mythical iPhone 5, but the iPhone 4S is a dramatic leap forward in technological innovation and sophistication that will surprise mobile users — even current iPhone 4 owners."];
    
    Model* model1 = [[Model alloc] initWithTitle:@"iPad 3 to have hi-def screen" andExcerpt:@"On Friday, Bloomberg reported that the iPad 3 will have a retina screen with more pixels that its predecesor" andDate:[self getDateFromString:@"Mon, 20 Feb 2012 18:54:26 +00:00"] andTags:nil andImage:[UIImage imageNamed:@"white-iPhone-ipad.png"] andContent:content];


    Model* model2 = [[Model alloc] initWithTitle:@"Apple Is World's Top PC Vendor, If You Consider iPad to Be a PC" andExcerpt:@"A Deutsche Bank Analyst has circulate a paper saying the Apple is now the World's Top PC Vendor" andDate:[self getDateFromString:@"Tue, 21 Feb 2012 18:54:26 +00:00"] andTags:nil andImage:[UIImage imageNamed:@"white-iPhone-ipad.png"] andContent:content];

    Model* model3 = [[Model alloc] initWithTitle:@"This Swiss Army Knife that Comes With a 1 TB USB Flash Drive" andExcerpt:@"Victorinox has unveiled a Swiss Army knife with a USB flash drive that holds 1TB. The company has had a USB knife in its line of products for a while, but the Victorinox SSD " andDate:[self getDateFromString:@"Wed, 22 Feb 2012 18:54:26 +00:00"] andTags:nil andImage:[UIImage imageNamed:@"white-iPhone-ipad.png"] andContent:content];
       

    NSArray* gadgets = [NSArray arrayWithObjects:model1, nil];
    
    NSArray* tech = [NSArray arrayWithObjects:model2, model3, nil];
    

    NSDictionary* categories = [NSDictionary dictionaryWithObjectsAndKeys:gadgets, @"Gadgets", tech, @"Technology", nil];
    
    return categories;
}

+(NSDictionary*)loadDataFromFeedItems:(NSArray*)feedItems
{
    NSMutableArray* array = [NSMutableArray array];
    for (MWFeedItem* item in feedItems) {
        
        UIImage* image = [self getFirstImageFromContent:item.content];
        
        Model* m = [[Model alloc] initWithTitle:item.title andExcerpt:item.summary andDate:item.date andTags:nil andImage:image andContent:[self addCSSTo:item.summary]];
        
        [array addObject:m];
    }
    
    NSDictionary* categories = [NSDictionary dictionaryWithObjectsAndKeys:array, @"Articles", nil];
    
    return categories;
    
}

+(NSString*)addCSSTo:(NSString*)content
{
    NSString* webContent = [NSString stringWithFormat:@"<html> \n"
                            "<head> \n"
                            "<style type=\"text/css\"> \n"
                            "body {text-shadow: 0px 1px 0px #fff; color:#4a4a4a; font-family: \"%@\"; font-size: %@;}\n"
                            "</style> \n"
                            "</head> \n"
                            "<body>%@</body> \n"
                            "</html>", @"helvetica", [NSNumber numberWithInt:16], content
                            ];
    return webContent;
}

+(NSDate*)getDateFromString:(NSString*)dateString
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"EEE, dd MMMM yyyy HH:mm:ss"];
    [df setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en"]];
    
    return [df dateFromString:[dateString substringToIndex:26]];
}

+(UIImage *)getFirstImageFromContent: (NSString *) html 
{
    
    NSString *imageUrl = [[NSString alloc]initWithFormat:@""];
    NSScanner * pageScanner = [NSScanner scannerWithString:html];
    
    [pageScanner setCaseSensitive:NO];
    [pageScanner setCharactersToBeSkipped:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    [pageScanner scanUpToString:@"<img " intoString:nil];
    [pageScanner scanString:@"<img " intoString:nil];
    [pageScanner scanUpToString:@"src=\"" intoString:nil];
    [pageScanner scanString:@"src=\"" intoString:nil];
    
    [pageScanner scanUpToString:@"\"" intoString:&imageUrl];
    
    if(imageUrl.length > 0)
    {
        NSData* imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
        
        UIImage* image = [UIImage imageWithData:imageData];
        
        return image;
    }
    
    return nil;
}

@end
