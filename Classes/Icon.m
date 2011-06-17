//
//  icon.m
//  CampBrookwoods
//
//  Created by Administrator on 12/20/10.
//  Copyright 2010 Christian Camps and Conferences.Inc. All rights reserved.
//

#import "Icon.h"


@implementation Icon

@synthesize thumbnail, label;
@synthesize delegate;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil icon:(UIImage *)image name:(NSString *)name
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
		self.view.backgroundColor = [UIColor clearColor];
		if(image)
			self.thumbnail.image = image;
		else
			self.thumbnail.backgroundColor = [UIColor clearColor];
		
		if(name)
			self.label.text = name;
		else
			self.label.text = nil;
    }
    return self;
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

-(IBAction)touchInIcon
{
	self.view.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.1];
	[self.delegate iconWasTapped:self];
	[self performSelector:@selector(deselectIcon) withObject:nil afterDelay:1];
}

-(void) deselectIcon
{
	self.view.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	self.thumbnail = nil;
	self.label = nil;
    self.delegate = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
