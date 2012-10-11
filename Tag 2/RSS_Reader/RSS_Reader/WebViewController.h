//
//  WebViewController.h
//  RSS_Reader
//
//  Created by 8huebert on 11.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate> 

@property (nonatomic, strong) IBOutlet UIWebView* dasWebfensterWebView;
@property (nonatomic, strong) NSURL* dieUrl;


- (id)initWithURL:(NSURL *)dieUrl;


@end
