//
//  AlertSignupViewController.h
//  CampBrookwoods
//
//  Created by Administrator on 12/28/10.
//  Copyright 2010 Christian Camps and Conferences.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AlertSignupViewController : UIViewController <UITextFieldDelegate ,UIAlertViewDelegate>
{
	IBOutlet UITextField *email;
	IBOutlet UITextField *confirmEmail;
	IBOutlet UIImageView *completed;

	NSString *userEmail;
}

-(IBAction)close;
- (IBAction) submitEmail;

@property (nonatomic, retain) IBOutlet UITextField *email;
@property (nonatomic, retain) IBOutlet UITextField *confirmEmail;
@property (nonatomic, retain) IBOutlet UIImageView *completed;

@end
