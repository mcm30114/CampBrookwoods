//
//  rssParser.h
//  CampBrookwoods
//
//  Created by Administrator on 12/21/10.
//  Copyright 2010 Christian Camps and Conferences.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RSSParserDelegate

- (void) RSSParserDidComplete;

@end

@interface RSSParser : NSObject <NSXMLParserDelegate>
{
	NSMutableArray *titles;
	NSMutableArray *articles;
    BOOL inItem;
	
	NSString *currentElement;
    NSMutableData *connectionData;
    
    id <RSSParserDelegate> delegate;
}

-(void)parseRSSFeedWithTitleArray:(NSMutableArray **)title andArticlesArray:(NSMutableArray **)article;

@property (nonatomic, assign) id <RSSParserDelegate> delegate;

@end
