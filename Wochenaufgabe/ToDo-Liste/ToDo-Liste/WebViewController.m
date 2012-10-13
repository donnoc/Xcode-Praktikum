//
//  WebViewController.m
//  ToDo-Liste
//
//  Created by 8huebert on 12.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WebViewController.h"


@interface WebViewController()

@property (nonatomic, strong) NSURL* url;

@end


@implementation WebViewController

@synthesize url = _url;
@synthesize webViewWindow = _webViewWindow;


-(WebViewController*) initWithUrl:(NSURL*)url
{
	self =[super init];
	self = [super initWithNibName:@"WebViewController_iPhone" bundle:nil];
	
	if (self) {
		self.url = url;
	}
	
	NSLog(@"Initialisiere Webview mit URL: %@", self.url);
	
	return self;
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
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
    // Do any additional setup after loading the view from its nib.
	
	NSURLRequest* urlRequest = [NSURLRequest requestWithURL:self.url];
    [_webViewWindow loadRequest: urlRequest];
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
