//
//  WebViewController.m
//  RSS_Reader
//
//  Created by 8huebert on 11.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WebViewController.h"

@implementation WebViewController

@synthesize dasWebfensterWebView = _dasWebfensterWebView;
@synthesize dieUrl = _dieUrl;


- (id)initWithURL:(NSURL *)dieUrl
{
    self = [super init];
    if (self) {
        self.dieUrl = dieUrl;
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURLRequest* urlRequest = [NSURLRequest requestWithURL:self.dieUrl];
    [_dasWebfensterWebView loadRequest: urlRequest];


    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
