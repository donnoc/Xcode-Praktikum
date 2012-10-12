//
//  FeedSelectionViewController.h
//  LoesungTag2
//
//  Created by Felix Zwingenberger on 11.10.12.
//  Copyright (c) 2012 Uni Hamburg. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RssFeed;
@protocol FeedSelectionViewControllerDelegate;

@interface FeedSelectionViewController : UIViewController

@property (nonatomic, weak) id<FeedSelectionViewControllerDelegate> delegate;

@end

@protocol FeedSelectionViewControllerDelegate

-(void)feedSelectionController:(FeedSelectionViewController*)feedSelectionController didSelectFeed:(RssFeed*)rssFeed;

@end