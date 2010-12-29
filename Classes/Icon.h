//
//  icon.h
//  CampBrookwoods
//
//  Created by Administrator on 12/20/10.
//  Copyright 2010 Christian Camps and Conferences.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Icon;

@protocol IconDelegate

-(void)iconWasTapped:(Icon *)icon;

@end


@interface Icon : UIViewController
{
	IBOutlet UIImageView *thumbnail;
	IBOutlet UILabel *label;
	
	id <IconDelegate> delegate;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil icon:(UIImage *)image name:(NSString *)name;

-(IBAction)touchInIcon;
-(void)deselectIcon;

@property (nonatomic, retain) IBOutlet UIImageView *thumbnail;
@property (nonatomic, retain) IBOutlet UILabel * label;
@property (retain) id delegate;

@end
