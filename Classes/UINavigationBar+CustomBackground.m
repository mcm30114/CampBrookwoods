//
//  UINavigationBar+CustomBackground.m
//  CampBrookwoods
//
//  Created by Administrator on 12/21/10.
//  Copyright 2010 Christian Camps and Conferences.Inc. All rights reserved.
//

#import "UINavigationBar+CustomBackground.h"


@implementation UINavigationBar (CustomBackground)

- (void)drawRect:(CGRect)rect
{
	UIImage *image = [UIImage imageNamed: @"NavBar-Background.png"];
	[image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
	
	UILabel *topLabel = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)] autorelease];
	topLabel.text = self.topItem.title;
	topLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
	topLabel.backgroundColor = [UIColor clearColor];
	topLabel.textAlignment = UITextAlignmentCenter;
	topLabel.textColor = [UIColor blackColor];
	self.topItem.titleView = topLabel;
}

@end
