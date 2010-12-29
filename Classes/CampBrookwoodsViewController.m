//
//  CampBrookwoodsViewController.m
//  CampBrookwoods
//
//  Created by Administrator on 12/20/10.
//  Copyright 2010 Christian Camps and Conferences.Inc. All rights reserved.
//

#import "CampBrookwoodsViewController.h"
#import "WebcamViewController.h"
#import "CountdownViewController.h"
#import "Icon.h"
#import "AlertSignupViewController.h"

@implementation CampBrookwoodsViewController

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/
 

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
	
	//create lawn webcam icon
	lawnWebcamIcon = [[[Icon alloc] initWithNibName:@"Icon" bundle:nil icon:[UIImage imageNamed:@"webcam.png"] name:@"Front Lawn Web Cam"] autorelease];
	[lawnWebcamIcon retain];
	lawnWebcamIcon.delegate = self;
	
	//create boathouse webcam icon
	waterWebcamIcon = [[[Icon alloc] initWithNibName:@"Icon" bundle:nil icon:[UIImage imageNamed:@"webcam.png"] name:@"Boat House Web Cam"] autorelease];
	[waterWebcamIcon retain];
	waterWebcamIcon.delegate = self;
	
	//create rss icon
	newsIcon = [[[Icon alloc] initWithNibName:@"Icon" bundle:nil icon:[UIImage imageNamed:@"news.png"] name:@"News"] autorelease];
	[newsIcon retain];
	newsIcon.delegate = self;
	
	//create rss icon
	alertSignup = [[[Icon alloc] initWithNibName:@"Icon" bundle:nil icon:[UIImage imageNamed:@"email.png"] name:@"Sign Up\nFor Alerts"] autorelease];
	[alertSignup retain];
	alertSignup.delegate = self;
	
	//add icons to view
	[self.view addSubview:lawnWebcamIcon.view];
	[self.view addSubview:waterWebcamIcon.view];
	[self.view addSubview:newsIcon.view];
	[self.view addSubview:alertSignup.view];
	
	lawnWebcamIcon.view.frame = CGRectMake(68, 70, lawnWebcamIcon.view.frame.size.width, lawnWebcamIcon.view.frame.size.height);
	waterWebcamIcon.view.frame = CGRectMake(68, 170, lawnWebcamIcon.view.frame.size.width, lawnWebcamIcon.view.frame.size.height);
	newsIcon.view.frame = CGRectMake(188, 70, newsIcon.view.frame.size.width, newsIcon.view.frame.size.height);
	alertSignup.view.frame = CGRectMake(188, 170, alertSignup.view.frame.size.width, newsIcon.view.frame.size.height);
	
	//add countdown to view
	cvc = [[[CountdownViewController alloc] initWithNibName:@"CountdownViewController" bundle:nil] autorelease];
	[self.view addSubview:cvc.view];
	cvc.view.frame = CGRectMake(0, 460 - cvc.view.frame.size.height, cvc.view.frame.size.width, cvc.view.frame.size.height);
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

-(void)iconWasTapped:(Icon *)icon
{
	id presentedViewController = nil;
	if(icon == lawnWebcamIcon)
	{
		presentedViewController = [[[WebcamViewController alloc] initWithNibName:@"WebcamViewController" bundle:nil] autorelease];
		((WebcamViewController *)presentedViewController).url = @"http://74.220.231.108:1031/axis-cgi/jpg/image.cgi?resolution=320x240&dummy=1268780229976";
		((WebcamViewController *)presentedViewController).name = @"Front Lawn Camera";
	}
	if(icon == waterWebcamIcon)
	{
		presentedViewController = [[[WebcamViewController alloc] initWithNibName:@"WebcamViewController" bundle:nil] autorelease];
		((WebcamViewController *)presentedViewController).url = @"http://74.220.231.108:1030/axis-cgi/jpg/image.cgi?resolution=320x240&dummy=1268780229976";
		((WebcamViewController *)presentedViewController).name = @"Boat House Camera";
	}
	if(icon == newsIcon)
	{
		presentedViewController	= [[[UINavigationController alloc] initWithRootViewController:[[[NewsViewController alloc] initWithNibName:@"NewsViewController" bundle:nil] autorelease]] autorelease];
	}
	if(icon == alertSignup)
	{
		//create alert sign-up view controller here
		presentedViewController = [[[AlertSignupViewController alloc] initWithNibName:@"AlertSignupViewController" bundle:nil] autorelease];
	}
	
	[self presentModalViewController:presentedViewController animated:YES];
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[lawnWebcamIcon release];
	[waterWebcamIcon release];
	[newsIcon release];
    [super dealloc];
}

@end
