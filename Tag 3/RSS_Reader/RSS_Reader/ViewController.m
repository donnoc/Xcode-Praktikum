//
//  ViewController.m
//  RSS_Reader
//
//  Created by 8huebert on 11.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "RssFeed.h"
#import "RSSParser.h"
#import "Article.h"
#import "DetailsViewController.h"


@interface ViewController()

@property (nonatomic, strong) RSSParser* alleRssDokumente;
@property (nonatomic, strong) NSArray* rssArtikel;


@end



@implementation ViewController

@synthesize iPadDetailsController = _iPadDetailsController;
@synthesize alleRssDokumente = _alleRssDokumente;
@synthesize rssArtikel = _rssArtikel;

- (ViewController*)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        self.alleRssDokumente = [[RSSParser alloc] init];
        self.rssArtikel = [self.alleRssDokumente parseXMLFileAtURL:[NSURL URLWithString:@"http://www.apple.com/de/main/rss/hotnews/hotnews.rss"]];
        self.title = @"News";
    }
    return self;
    
}


// Liefert die Zellen für die einzelnen Tabellen-Zeilen
- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    UITableViewCell* eineZeile = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"hallo"];
    NSMutableString* titleString = [NSMutableString stringWithString:@"Zeile "];
    [titleString appendFormat:@"%d", indexPath.row];
    
    Article* article = [self.rssArtikel objectAtIndex:indexPath.row];
    [eineZeile setText:article.title];
    
    
    return eineZeile;
}

// Anzahl der Zeilen in einem Tabellenabschnitt
- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection: (NSInteger)section
{
    return [self.rssArtikel count];
    
}

// Wird aufgerufen wenn eine Zeile angetippt wurde
- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        DetailsViewController* derViewController = [[DetailsViewController alloc] initWithArticle:[self.rssArtikel objectAtIndex:indexPath.row]];
        [self.navigationController pushViewController: derViewController animated:YES];
    } else {
        self.iPadDetailsController.derArtikel = [self.rssArtikel objectAtIndex:indexPath.row]; 
        [self.iPadDetailsController.navigationController popToRootViewControllerAnimated:YES];
    }
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    
    NSLog(@"View Controller ist gestartet");
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
