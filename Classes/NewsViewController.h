//
//  NewsViewController.h
//  CampBrookwoods
//
//  Created by Administrator on 12/20/10.
//  Copyright 2010 Christian Camps and Conferences.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NewsViewController : UITableViewController
{
	NSMutableArray *titles;
	NSMutableArray *articles;
}

-(void)returnHome;

@end
