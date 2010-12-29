//
//  ArticleViewController.h
//  CampBrookwoods
//
//  Created by Administrator on 12/21/10.
//  Copyright 2010 Christian Camps and Conferences.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ArticleViewController : UIViewController
{
	IBOutlet UITextView *textArea;
	
	NSString *articleTitle;
	NSString *article;
}

@property (nonatomic, retain) IBOutlet UITextView *textArea;
@property (assign) NSString *articleTitle;
@property (assign) NSString *article;

@end
