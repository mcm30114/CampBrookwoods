//
//  CountdownViewController.m
//  CampBrookwoods
//
//  Created by Administrator on 12/20/10.
//  Copyright 2010 Christian Camps and Conferences.Inc. All rights reserved.
//

#import "CountdownViewController.h"

#define	MONTH 06

@implementation CountdownViewController

@synthesize months, days, hours, minutes, sessionLabel;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
		campStartingDates = [[[NSArray alloc] initWithObjects:
							 [NSNumber numberWithInt:26], [NSNumber numberWithInt:24], [NSNumber numberWithInt:23], [NSNumber numberWithInt:22], [NSNumber numberWithInt:21],
							 [NSNumber numberWithInt:26], [NSNumber numberWithInt:25], [NSNumber numberWithInt:24], [NSNumber numberWithInt:23], [NSNumber numberWithInt:21], nil
							  ] autorelease];
		[campStartingDates retain];
    }
    return self;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	selectedSession = [[NSUserDefaults standardUserDefaults] integerForKey:@"SelectedSession"];
	[self updateCountdownView];
}

-(void) updateCountdownView
{
	//create today's date
	NSDate *today = [[[NSDate alloc] init] autorelease];
	[today retain];
	
	//create calenday
	NSCalendar *gregorian = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
	[gregorian retain];
	
	//setup camp date
	NSDateComponents *components= [[[NSDateComponents alloc] init] autorelease];
	[components retain];
	
	 // index for years' start date
	
	if([[gregorian components:NSMonthCalendarUnit fromDate:today] month] > 7)
	{
		[components setDay:[[campStartingDates objectAtIndex:[[gregorian components:NSYearCalendarUnit fromDate:today] year] - 2011 + 1] intValue]];
		[components setMonth:MONTH];
		[components setYear:[[gregorian components:NSYearCalendarUnit fromDate:today] year] + 1];
	}
	else
	{
		[components setDay:[[campStartingDates objectAtIndex:[[gregorian components:NSYearCalendarUnit fromDate:today] year] - 2011] intValue]];
		[components setMonth:MONTH];
		[components setYear:[[gregorian components:NSYearCalendarUnit fromDate:today] year]];
	}
	
	//set date then adjust for session
	NSDate *campStart = [gregorian dateFromComponents:components];
	campStart = [campStart dateByAddingTimeInterval:60 * 60 * 24 * 7 * 2 * selectedSession]; // multiply camp session times two weeks
	
	//get interval
	NSDateComponents *intervalComponents = [gregorian components:NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit fromDate:today toDate:campStart options:0];
	
	//initialize labels
	if([today timeIntervalSinceDate:campStart] > 0) // if camp has already started...
	{
		months.text = @"--";
		days.text = @"--";
		hours.text = @"--";
		minutes.text = @"--";
		sessionLabel.text = @"Camp has already started!!";
	}
	else
	{
		NSDateFormatter *df = [[[NSDateFormatter alloc] init] autorelease];
		[df setDateStyle:NSDateFormatterMediumStyle];
		months.text = [NSString stringWithFormat:@"%d", [intervalComponents month]];
		days.text = [NSString stringWithFormat:@"%d", [intervalComponents day]];
		hours.text = [NSString stringWithFormat:@"%d", [intervalComponents hour]];
		minutes.text = [NSString stringWithFormat:@"%d", [intervalComponents minute]];
		sessionLabel.text = [NSString stringWithFormat:@"Session %d: %@", selectedSession + 1, [df stringFromDate:campStart]];
	}
	
	//release dates
	[today release];
	[components release];
	[gregorian release];
	
	[self performSelector:@selector(updateCountdownView) withObject:nil afterDelay:60];
}

-(IBAction) selectSession
{
	pv = [[[UIPickerView alloc] init] autorelease];
	pv.delegate = self;
	pv.dataSource = self;
	pv.showsSelectionIndicator = YES;
	pv.frame = CGRectMake(0, 640, 320, 216);
	[pv selectRow:selectedSession inComponent:0 animated:NO];
	[self.view.superview addSubview:pv];
	
	[UIView beginAnimations:@"PickerViewAnimation" context:self.view.superview];
	[UIView setAnimationDuration:0.5];
	pv.frame = CGRectMake(0, self.view.superview.frame.size.height - 216, 320, 216);
	[UIView commitAnimations];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return 4;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	return [NSString stringWithFormat:@"Session %d", row + 1];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	/*
	if(selectedSession == row)
	{
		[pv removeFromSuperview];
		NSLog(@"%d", selectedSession);
	}
	else
	{
		selectedSession = row;
		NSLog(@"session: %d, row: %d", selectedSession, row);
	}
	*/
	selectedSession = row;
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setInteger:selectedSession forKey:@"SelectedSession"];
	[self removePickerView];
	[self updateCountdownView];
}

-(void) removePickerView
{
	[UIView beginAnimations:@"PickerRemove" context:self.view.superview];
	[UIView setAnimationDuration:0.5];
	pv.frame = CGRectMake(0, 640, 320, 216);
	[UIView commitAnimations];
	[pv performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:0.5];
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
	self.months = nil;
	self.days = nil;
	self.hours = nil;
	self.minutes = nil;
	self.sessionLabel = nil;
}


- (void)dealloc {
	[campStartingDates release];
    [super dealloc];
}


@end
