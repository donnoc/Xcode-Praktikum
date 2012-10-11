//
//  DetailsViewController.m
//  RSS_Reader
//
//  Created by 8huebert on 11.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailsViewController.h"
#import "WebViewController.h"


@implementation DetailsViewController

@synthesize derArtikel = _derArtikel;

@synthesize titelLabel = _titelLabel;
@synthesize textLabel  = _textLabel;
@synthesize datumLabel = _datumLabel;



- (id)initWithArticle:(Article*)artikel
                    
{
    self = [super init];
    if (self) {
        self.derArtikel = artikel;
        self.title = _derArtikel.title;
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
    [_titelLabel setText:_derArtikel.title];
    [_textLabel setText:_derArtikel.text];
    [_datumLabel setText:[[_derArtikel date] description]];
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


- (void) clickWebButton
{
    WebViewController* derViewController = [[WebViewController alloc]initWithURL:_derArtikel.url];
    [self.navigationController pushViewController: derViewController animated:YES];
}

@end
