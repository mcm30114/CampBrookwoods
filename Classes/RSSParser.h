//
//  rssParser.h
//  CampBrookwoods
//
//  Created by Administrator on 12/21/10.
//  Copyright 2010 Christian Camps and Conferences.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RSSParser : NSObject <NSXMLParserDelegate>
{
	NSMutableArray *titles;
	NSMutableArray *articles;
	
	NSString *currentElement;
}

-(void)parseRSSFeedWithTitleArray:(NSMutableArray *)title andArticlesArray:(NSMutableArray *)article;

@end
