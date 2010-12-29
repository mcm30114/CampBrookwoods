//
//  rssParser.m
//  CampBrookwoods
//
//  Created by Administrator on 12/21/10.
//  Copyright 2010 Christian Camps and Conferences.Inc. All rights reserved.
//

//#define XML_URL	@"http://localhost/sampleRSS.xml"

#import "RSSParser.h"

@implementation RSSParser

-(void)parseRSSFeedWithTitleArray:(NSMutableArray *)title andArticlesArray:(NSMutableArray *)article
{
	titles = title;
	articles = article;
	
	// Initialize NSXMLParser
	NSXMLParser *rssParser = [[[NSXMLParser alloc] initWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"sampleRSS" withExtension:@"xml"]] autorelease];
	
	[rssParser setDelegate:self];
	[rssParser setShouldResolveExternalEntities:YES];
	[rssParser parse];
}

-(void)parserDidStartDocument:(NSXMLParser *)parser
{
	currentElement = @"";
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
	currentElement = elementName;
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	currentElement = @"";
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	if([string isEqualToString:@"\n"])
		return;
	
	if([currentElement isEqualToString:@"title"])
	{
		[titles addObject:string];
		return;
	}
	else if([currentElement isEqualToString:@"description"])
	{
		[articles addObject:string];
		return;
	}
	else
		return;
}

-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
	NSLog(@"%@\n\nCurrent Element: ", parseError, currentElement);
}

@end
