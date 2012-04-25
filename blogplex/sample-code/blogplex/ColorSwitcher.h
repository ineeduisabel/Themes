//
//  ColourSwitcher.h
//  blogplex
//
//  Created by Tope on 21/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ColorSwitcher : NSObject

-(id)initWithScheme:(NSString*)scheme;

@property (nonatomic, retain) UIColor* tintColorForButton;

@property (nonatomic, assign) float hue;

@property (nonatomic, assign) float saturation;

@property (nonatomic, retain) NSMutableDictionary* processedImages;

-(UIImage*)processImageWithName:(NSString*)imageName;



@end
