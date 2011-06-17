//
//  CampBrookwoodsViewController.h
//  CampBrookwoods
//
//  Created by Administrator on 12/20/10.
//  Copyright 2010 Christian Camps and Conferences.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountdownViewController.h"
#import "WebcamViewController.h"
#import "NewsViewController.h"
#import "Icon.h"

@interface CampBrookwoodsViewController : UIViewController <IconDelegate>
{
	Icon *lawnWebcamIcon;
	Icon *waterWebcamIcon;
	Icon *newsIcon;
	Icon *directions;
	CountdownViewController *cvc;
}

@end

