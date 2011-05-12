//
//  rssParser.m
//  CampBrookwoods
//
//  Created by Administrator on 12/21/10.
//  Copyright 2010 Christian Camps and Conferences.Inc. All rights reserved.
//

#define XML_URL	@"http://christiancamps.net/themes/cc10/feed.rss?sec_id=4"

#import "RSSParser.h"

@implementation RSSParser

@synthesize delegate;

-(void)parseRSSFeedWithTitleArray:(NSMutableArray **)title andArticlesArray:(NSMutableArray **)article
{
    inItem = NO;
	titles = *title;
	articles = *article;
	
    // pull data from internet
    NSURLConnection *rssConnection = [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:XML_URL]] delegate:self];
    [rssConnection start];
}

#pragma mark NSURLConnection Delegate Methods

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if(!connectionData)
    {
        connectionData = [[[NSMutableData alloc] init] autorelease];
        [connectionData retain];
    }
    [connectionData appendData:data];
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Connection failed with error: %@", [error localizedDescription]);
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"%@", [NSString stringWithCString:[connectionData bytes] encoding:NSUTF8StringEncoding]);
	// Initialize NSXMLParser
	NSXMLParser *rssParser = [[[NSXMLParser alloc] initWithData:connectionData] autorelease];
	
	[rssParser setDelegate:self];
	[rssParser setShouldResolveExternalEntities:YES];
	[rssParser parse];
    
    [connectionData release];
}

#pragma mark NSXMLParser Delegate Methods

-(void)parserDidStartDocument:(NSXMLParser *)parser
{
	currentElement = @"";
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
	currentElement = elementName;
    if([elementName isEqualToString:@"item"])
        inItem = YES;
    else if([elementName isEqualToString:@"/item"])
        inItem = NO;
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	currentElement = @"";
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	if([string isEqualToString:@"\n"])
		return;
	
    if(inItem)
    {
        if([currentElement isEqualToString:@"title"])
        {
            [titles addObject:string];
            return;
        }
        else if([currentElement isEqualToString:@"link"])
        {
            [articles addObject:string];
            return;
        }
    }
	else
		return;
}

-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
	NSLog(@"%@\n\nCurrent Element: %@", parseError, currentElement);
}

- (void) parserDidEndDocument:(NSXMLParser *)parser
{
    NSLog(@"Success!\nTitles:%@\nDesc:%@", titles, articles);
    [self.delegate RSSParserDidComplete];
}

- (void) dealloc
{
    self.delegate = nil;
    
    [super dealloc];
}

@end
