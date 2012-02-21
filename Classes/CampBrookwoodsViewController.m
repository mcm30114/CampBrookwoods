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
    
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
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
