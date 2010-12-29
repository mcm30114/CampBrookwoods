//
//  WebcamViewController.h
//  CampBrookwoods
//
//  Created by Administrator on 12/20/10.
//  Copyright 2010 Christian Camps and Conferences.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WebcamViewController : UIViewController
{
	IBOutlet UIImageView *webcamView;
	IBOutlet UINavigationBar *navBar;
	IBOutlet UIActivityIndicatorView *aiv;
	NSString *url;
	NSString *name;
}

-(void)updateCamera;
-(IBAction) returnToMainMenu;

@property (nonatomic, retain) UIImageView *webcamView;
@property (nonatomic, retain) IBOutlet UINavigationBar *navBar;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *aiv;
@property (assign) NSString *url;
@property (assign) NSString *name;

@end
