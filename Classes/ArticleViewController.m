//
//  ArticleViewController.m
//  CampBrookwoods
//
//  Created by Administrator on 12/21/10.
//  Copyright 2010 Christian Camps and Conferences.Inc. All rights reserved.
//

#import "ArticleViewController.h"


@implementation ArticleViewController

@synthesize textArea;
@synthesize article, articleTitle;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *url = [article stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSURLConnection *articleConnection = [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]] delegate:self];
    [articleConnection start];
    
	self.navigationItem.title = articleTitle;
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

#pragma mark NSURLConnection Delegate Methods

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if(!articleData)
    {
        articleData = [[[NSMutableData alloc] init] autorelease];
        [articleData retain];
    }
    
    [articleData appendData:data];
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Connection Failed with error: %@", [error localizedDescription]);
    [articleData release];
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    self.textArea.text = [NSString stringWithCString:[articleData bytes] encoding:NSUTF8StringEncoding];
}

#pragma mark Memory Management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	self.textArea = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
