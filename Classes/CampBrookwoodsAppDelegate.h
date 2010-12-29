//
//  CampBrookwoodsAppDelegate.h
//  CampBrookwoods
//
//  Created by Administrator on 12/20/10.
//  Copyright 2010 Christian Camps and Conferences.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CampBrookwoodsViewController;

@interface CampBrookwoodsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CampBrookwoodsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CampBrookwoodsViewController *viewController;

@end

