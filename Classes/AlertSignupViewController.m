//
//  AlertSignupViewController.m
//  CampBrookwoods
//
//  Created by Administrator on 12/28/10.
//  Copyright 2010 Christian Camps and Conferences.Inc. All rights reserved.
//

#import "AlertSignupViewController.h"


@implementation AlertSignupViewController

@synthesize email, confirmEmail, completed;

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
	email.delegate = self;
	confirmEmail.delegate = self;
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

-(IBAction)submitEmail
{
	if([email.text isEqualToString:confirmEmail.text])
	{
		[email resignFirstResponder];
		[confirmEmail resignFirstResponder];
		userEmail = email.text;
		NSLog(@"%@", userEmail);
		self.completed.image = [UIImage imageNamed:@"checkmark.png"];
	}
	else
	{
		UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Email Mismatch" message:@"Please enter valid matching emails" delegate:self cancelButtonTitle:@"Try Again" otherButtonTitles:nil];
		[av show];
	}
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
	email.text = @"";
	confirmEmail.text = @"";
	[email becomeFirstResponder];
}

-(IBAction)close
{
	[self dismissModalViewControllerAnimated:YES];
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
	self.email = nil;
	self.confirmEmail = nil;
	self.completed = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
