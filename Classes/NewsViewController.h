//
//  NewsViewController.h
//  CampBrookwoods
//
//  Created by Administrator on 12/20/10.
//  Copyright 2010 Christian Camps and Conferences.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSSParser.h"

@interface NewsViewController : UITableViewController <RSSParserDelegate>
{
	NSMutableArray *titles;
	NSMutableArray *articles;
}

-(void)returnHome;

- (void) RSSParserDidComplete;

@end
