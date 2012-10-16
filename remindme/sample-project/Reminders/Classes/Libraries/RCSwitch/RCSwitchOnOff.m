/*
 Copyright (c) 2010 Robert Chin
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

#import "RCSwitchOnOff.h"

#import "ADVTheme.h"


@implementation RCSwitchOnOff

- (void)initCommon
{
	[super initCommon];
    onIcon = [[ADVThemeManager sharedTheme] switchOnIcon];
	
    offIcon = [[ADVThemeManager sharedTheme] switchOffIcon];
	
}


- (void)drawUnderlayersInRect:(CGRect)aRect withOffset:(float)offset inTrackWidth:(float)trackWidth
{
	{
		CGRect iconRect = [self bounds];
        iconRect.size = CGSizeMake(18, 17);
		iconRect.origin.x += 15.0 + (offset - trackWidth);
        iconRect.origin.y = iconRect.origin.y + 10;
		[onIcon drawInRect:iconRect];
	}
	
	{
		CGRect iconRect = [self bounds];
        iconRect.size = CGSizeMake(15, 15);
        iconRect.origin.y = iconRect.origin.y + 11;
		iconRect.origin.x += (offset + trackWidth) + 37;
		[offIcon drawInRect:iconRect];
	}	
}

@end
