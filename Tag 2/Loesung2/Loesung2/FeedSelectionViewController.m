//
//  FeedSelectionViewController.m
//  LoesungTag2
//
//  Created by Felix Zwingenberger on 11.10.12.
//  Copyright (c) 2012 Uni Hamburg. All rights reserved.
//

#import "FeedSelectionViewController.h"
#import "RssFeed.h"

@interface FeedSelectionViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray* feeds;

@end

@implementation FeedSelectionViewController

@synthesize delegate = _delegate;
@synthesize feeds = _feeds;

- (id)init
{
    self = [super initWithNibName:@"FeedSelectionViewController" bundle:nil];
    if (self) {
        self.feeds = [RssFeed feeds];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Select feed";
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.feeds.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* articleCellIdentifier = @"articleCell";
    
    UITableViewCell* result = [tableView dequeueReusableCellWithIdentifier:articleCellIdentifier];
    if(result == nil) {
        result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:articleCellIdentifier];
    }
    RssFeed* feed = [self.feeds objectAtIndex:indexPath.row];
    result.textLabel.text = feed.title;
    
    return result;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate feedSelectionController:self didSelectFeed:[self.feeds objectAtIndex:indexPath.row]];
}

@end
