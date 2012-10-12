//
//  ViewController.m
//  LoesungTag2
//
//  Created by Felix Zwingenberger on 11.10.12.
//  Copyright (c) 2012 Uni Hamburg. All rights reserved.
//

#import "ViewController.h"
#import "RssFeed.h"
#import "Article.h"
#import "RSSParser.h"
#import "ArticleDetailViewController.h"
#import "FeedSelectionViewController.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, FeedSelectionViewControllerDelegate>

@property (nonatomic, strong) RssFeed* currentFeed;
@property (nonatomic, strong) NSArray* articles;

@property (nonatomic, strong) IBOutlet UITableView* tableView;

@end

@implementation ViewController

@synthesize currentFeed = _currentFeed;
@synthesize articles = _articles;
@synthesize tableView = _tableView;

-(ViewController*)init {
    self = [super init];
    if(self) {
        RSSParser* rssParser = [[RSSParser alloc] init];
        self.currentFeed = [[RssFeed feeds] objectAtIndex:0];
        self.articles = [rssParser parseXMLFileAtURL:self.currentFeed.url];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.currentFeed.title;
    UIBarButtonItem* feedSelectionButton = [[UIBarButtonItem alloc] initWithTitle:@"Select feed" style:UIBarButtonItemStyleBordered target:self action:@selector(selectFeed)];
    self.navigationItem.leftBarButtonItem = feedSelectionButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.articles.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* articleCellIdentifier = @"articleCell";
    
    UITableViewCell* result = [tableView dequeueReusableCellWithIdentifier:articleCellIdentifier];
    if(result == nil) {
        result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:articleCellIdentifier];
    }
    Article* article = [self.articles objectAtIndex:indexPath.row];
    result.textLabel.text = article.title;
    result.detailTextLabel.text = article.text;
    
    return result;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Article* article = [self.articles objectAtIndex:indexPath.row];
    ArticleDetailViewController* articleDetailsController = [[ArticleDetailViewController alloc] initWithArticle:article];
    [self.navigationController pushViewController:articleDetailsController animated:YES];
}

-(void)selectFeed {
    FeedSelectionViewController* feedSelectionController = [[FeedSelectionViewController alloc] init];
    feedSelectionController.delegate = self;
    [self presentViewController:feedSelectionController animated:YES completion:NULL];
}

-(void)feedSelectionController:(FeedSelectionViewController *)feedSelectionController didSelectFeed:(RssFeed *)rssFeed {
    self.currentFeed = rssFeed;
    
    RSSParser* rssParser = [[RSSParser alloc] init];
    self.articles = [rssParser parseXMLFileAtURL:self.currentFeed.url];
    [feedSelectionController dismissViewControllerAnimated:YES completion:NULL];
    [self.tableView reloadData];
}

@end
