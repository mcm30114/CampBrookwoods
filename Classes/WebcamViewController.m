//
//  WebcamViewController.m
//  CampBrookwoods
//
//  Created by Administrator on 12/20/10.
//  Copyright 2010 Christian Camps and Conferences.Inc. All rights reserved.
//

#import "WebcamViewController.h"


@implementation WebcamViewController

@synthesize webcamView, navBar, aiv, url, name;

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
	[self.aiv startAnimating];
	self.navBar.topItem.title = name;
    self.navBar.topItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(returnToMainMenu)] autorelease];
	[self updateCamera];
}

-(void)updateCamera
{
	self.aiv.hidesWhenStopped = YES;
    
    NSURLRequest *webcamRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSURLConnection *webcamConnection = [[[NSURLConnection alloc] initWithRequest:webcamRequest delegate:self] autorelease];
    imageData = [[[NSMutableData alloc] init] autorelease];
    [imageData retain];
    
    [webcamConnection start];
    [self.aiv startAnimating];
}

-(IBAction) returnToMainMenu
{
	[self dismissModalViewControllerAnimated:YES];
}

#pragma mark NSURLConnection Asynchronous Methods

- (void) connection:(NSURLConnection *)connection didSendBodyData:(NSInteger)bytesWritten totalBytesWritten:(NSInteger)totalBytesWritten totalBytesExpectedToWrite:(NSInteger)totalBytesExpectedToWrite
{
    NSLog(@"%d", bytesWritten);
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [imageData appendData:data];
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    UIImage *webcamImage = [UIImage imageWithData:imageData];
    webcamView.image = webcamImage;
    [self.aiv stopAnimating];
    [imageData release];
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [self.aiv stopAnimating];
    [imageData release];
    UIAlertView *uav = [[[UIAlertView alloc] initWithTitle:@"Connection Error" message:@"Could not connect to the webcam. Please try again later." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];
    [uav show];
    [self returnToMainMenu];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	self.webcamView = nil;
	self.navBar = nil;
	self.aiv = nil;
}

- (void)dealloc {
    [super dealloc];
}


@end
