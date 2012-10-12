//
//  WebViewController.h
//  LoesungTag2
//
//  Created by Felix Zwingenberger on 11.10.12.
//  Copyright (c) 2012 Uni Hamburg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIWebView* webView;
@property (nonatomic, strong) NSURL* url;

- (id)initWithURL:(NSURL*)url;

@end
