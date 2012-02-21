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

@interface CampBrookwoodsViewController()
{
    @private
    Icon *lawnCam;
    Icon *waterCam;
    Icon *news;
    Icon *map;
}

- (void) createIcons;
- (void) destroyIcons;

@end

@implementation CampBrookwoodsViewController

@synthesize navBar;
@synthesize scrollView;
@synthesize countdownView;

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
	
	//add countdown to view
	cvc = [[[CountdownViewController alloc] initWithNibName:@"CountdownViewController" bundle:nil] autorelease];
    [self.countdownView addSubview:cvc.view];
    
    // set scrollview settings;
    [self.scrollView setContentSize:CGSizeMake(320, 282)];
    [self.scrollView setScrollEnabled: YES];
    [self.scrollView setPagingEnabled: YES];
    [self.scrollView flashScrollIndicators];
    
    // add icons
    [self createIcons];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void) createIcons {
    // initialize
    lawnCam = [[[Icon alloc] initWithNibName:@"Icon" bundle:nil icon:[UIImage imageNamed:@"webcam.png"] name:@"Front Lawn Webcam"] autorelease];
    waterCam = [[[Icon alloc] initWithNibName:@"Icon" bundle:nil icon:[UIImage imageNamed:@"webcam.png"] name:@"Boathouse Lawn Webcam"] autorelease];
    news = [[[Icon alloc] initWithNibName:@"Icon" bundle:nil icon:[UIImage imageNamed:@"news.png"] name:@"News"] autorelease];
    map = [[[Icon alloc] initWithNibName:@"Icon" bundle:nil icon:[UIImage imageNamed:@"maps.png"] name:@"Directions"] autorelease];
    [lawnCam retain];
    [waterCam retain];
    [news retain];
    [map retain];
    
    // set frame;
    lawnCam.view.frame = CGRectMake(320/4-.5*(lawnCam.view.frame.size.width/2), 30, lawnCam.view.frame.size.width, lawnCam.view.frame.size.height);
    waterCam.view.frame = CGRectMake(320/2+.5*(waterCam.view.frame.size.width/2), 30, waterCam.view.frame.size.width, waterCam.view.frame.size.height);
    news.view.frame = CGRectMake(320/4-.5*(news.view.frame.size.width/2), 150, news.view.frame.size.width, news.view.frame.size.height);
    map.view.frame = CGRectMake(320/2+.5*(map.view.frame.size.width/2), 150, map.view.frame.size.width, map.view.frame.size.height);
    
    // add to view
    [self.scrollView addSubview:[lawnCam view]];
    [self.scrollView addSubview:[waterCam view]];
    [self.scrollView addSubview:[news view]];
    [self.scrollView addSubview:[map view]];
    
    // set delegates
    [lawnCam setDelegate:self];
    [waterCam setDelegate:self];
    [news setDelegate:self];
    [map setDelegate:self];
}

- (void) destroyIcons {
    [lawnCam release];
    [waterCam release];
    [news release];
    [map release];
}

#pragma mark -
#pragma mark Icon Delegate Methods

- (void) iconWasTapped:(Icon *)icon {
    NSLog(@"%@", [icon label]);
    
    id presentedViewController = nil;
    if(icon == map)
	{
		// open up maps
        NSString *urlString = @"http://maps.google.com/maps?saddr=Current%20Location&daddr=34%20Camp%20Brookwoods%20Road%20Alton,NH";
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
	}
    else
    {
        if(icon == lawnCam)
        {
            presentedViewController = [[[WebcamViewController alloc] init] autorelease];
            ((WebcamViewController *)presentedViewController).url = @"http://69.21.83.38:1031/axis-cgi/jpg/image.cgi?resolution=600x320";
            ((WebcamViewController *)presentedViewController).name = @"Front Lawn Camera";
        }
        if(icon == waterCam)
        {
            presentedViewController = [[[WebcamViewController alloc] init] autorelease];
            ((WebcamViewController *)presentedViewController).url = @"http://69.21.83.38:8000/control/faststream.jpg?preview&size=600x320&framecount=1";
            ((WebcamViewController *)presentedViewController).name = @"Boat House Camera";
        }
        if(icon == news)
        {
            presentedViewController	= [[[UINavigationController alloc] initWithRootViewController:[[[NewsViewController alloc] initWithNibName:@"NewsViewController" bundle:nil] autorelease]] autorelease];
        }
        [self presentModalViewController:presentedViewController animated:YES];
    }
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [self destroyIcons];
    self.navBar = nil;
    self.scrollView = nil;
    self.countdownView = nil;
}


- (void)dealloc {
    [self.navBar release];
    [self.scrollView release];
    [self.countdownView release];
    [super dealloc];
}

@end
