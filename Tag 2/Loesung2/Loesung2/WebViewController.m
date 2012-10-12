//
//  WebViewController.m
//  LoesungTag2
//
//  Created by Felix Zwingenberger on 11.10.12.
//  Copyright (c) 2012 Uni Hamburg. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

@synthesize webView = _webView;
@synthesize url = _url;

- (id)initWithURL:(NSURL*)url
{
    self = [super initWithNibName:@"WebViewController" bundle:nil];
    if (self) {
        self.url = url;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.url]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
