//
//  ElementsThemeController.h
//  sportcast
//
//  Created by Tope on 14/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ElementsThemeController : UIViewController <UITextFieldDelegate>


-(void)customizeLabel;
-(void)customizeTextField;
-(void)addSlider;
-(void)addButtonAtLocation:(CGRect)location WithBackgroundImage:(NSString*)imageName andTitle:(NSString*)title;
@end
