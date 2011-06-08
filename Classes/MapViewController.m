//
//  MapViewController.m
//  CampBrookwoods
//
//  Created by Christopher Blatchley on 5/25/11.
//  Copyright 2011 LeTourneau. All rights reserved.
//

#import "MapViewController.h"


@implementation MapViewController

@synthesize mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSError *err;
    NSURLResponse *mapConnectionResponse;
    NSString *mapUrl = [NSString stringWithFormat:@"%@origin=%@&destination=%@&sensor=false", GOOGLE_MAP_API_URL, @"longview,TX", @"dallas,tx"];
    NSURLConnection *mapConnection = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:mapUrl]] returningResponse:&mapConnectionResponse error:err];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
