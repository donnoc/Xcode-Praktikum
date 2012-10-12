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



- (id)init
{

    NSString* nameOfNib;
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        nameOfNib = @"DetailsViewController";
    } else {
        nameOfNib = @"DetailsViewController_iPad";
       
    }
 
    self = [super initWithNibName:nameOfNib bundle:nil];
    
    return self;
}


- (id)initWithArticle:(Article*)artikel
{
    NSString* nameOfNib;
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        nameOfNib = @"DetailsViewController";
    } else {
        nameOfNib = @"DetailsViewController_iPad";
    }
    self = [super initWithNibName:nameOfNib bundle:nil];
    if (self) {
        self.derArtikel = artikel;
        self.title = _derArtikel.title;
    }
    return self;
}

-(void)setDerArtikel:(Article *)derArtikel {
    _derArtikel = derArtikel;

    [_titelLabel setText:_derArtikel.title];
    [_textLabel setText:_derArtikel.text];
    [_datumLabel setText:[[_derArtikel date] description]];
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
    return YES;
}


- (void) clickWebButton
{
    WebViewController* derViewController = [[WebViewController alloc]initWithURL:_derArtikel.url];
    [self.navigationController pushViewController: derViewController animated:YES];
}

-(void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc {
    self.navigationItem.rightBarButtonItem = barButtonItem;
}

-(void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
    self.navigationItem.rightBarButtonItem = nil;
}

@end
