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
	[self performSelector:@selector(updateCamera) withObject:nil afterDelay:0.1];
	webcamView.delegate = self;
}

-(void)updateCamera
{
	self.aiv.hidesWhenStopped = YES;
	[webcamView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:0 timeoutInterval:8]];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
	[self.aiv stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
	UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Connection Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];
	[alert show];
	[self.webcamView loadRequest:[NSURLRequest requestWithURL:[[NSBundle mainBundle] URLForResource:@"noWebcamForYou" withExtension:@"png"]]];
}

-(IBAction) returnToMainMenu
{
	self.webcamView.delegate = nil;
	[self.webcamView stopLoading];
	[self dismissModalViewControllerAnimated:YES];
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
