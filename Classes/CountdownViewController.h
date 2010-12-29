//
//  CountdownViewController.h
//  CampBrookwoods
//
//  Created by Administrator on 12/20/10.
//  Copyright 2010 Christian Camps and Conferences.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CountdownViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
{
	IBOutlet UILabel *months;
	IBOutlet UILabel *days;
	IBOutlet UILabel *hours;
	IBOutlet UILabel *minutes;
	IBOutlet UILabel *sessionLabel;
	
	UIPickerView *pv;
	int selectedSession;
	
	NSDate *today;
	NSDate *campStart;
}

-(void) updateCountdownView;
-(IBAction) selectSession;
-(void) removePickerView;

@property (nonatomic, retain) IBOutlet UILabel *months;
@property (nonatomic, retain) IBOutlet UILabel *days;
@property (nonatomic, retain) IBOutlet UILabel *hours;
@property (nonatomic, retain) IBOutlet UILabel *minutes;
@property (nonatomic, retain) IBOutlet UILabel *sessionLabel;

@end
