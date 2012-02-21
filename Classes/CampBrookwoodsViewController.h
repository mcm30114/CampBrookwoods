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

@interface CampBrookwoodsViewController : UIViewController
{
    IBOutlet UINavigationBar *navBar;
    IBOutlet UIScrollView *scrollView;
    IBOutlet UIView *countdownView;
    
	CountdownViewController *cvc;
}

@property (nonatomic, retain) IBOutlet UINavigationBar *navBar;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet UIView *countdownView;

@end

