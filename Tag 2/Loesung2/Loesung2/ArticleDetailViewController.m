//
//  ArticleDetailViewController.m
//  LoesungTag2
//
//  Created by Felix Zwingenberger on 11.10.12.
//  Copyright (c) 2012 Uni Hamburg. All rights reserved.
//

#import "ArticleDetailViewController.h"
#import "WebViewController.h"

@interface ArticleDetailViewController ()

@property (nonatomic, strong) IBOutlet UILabel* dateLabel;
@property (nonatomic, strong) IBOutlet UILabel* titleLabel;
@property (nonatomic, strong) IBOutlet UITextView* detailTextView;
@property (nonatomic, strong) IBOutlet UIButton* showArticleButton;

@end

@implementation ArticleDetailViewController

@synthesize article = _article;

@synthesize dateLabel = _dateLabel;
@synthesize titleLabel = _titleLabel;
@synthesize showArticleButton = _showArticleButton;
@synthesize detailTextView = _detailTextView;

- (id)initWithArticle:(Article*)article
{
    self = [super init];
    if (self) {
        self.article = article;
    }
    return self;
}

-(IBAction)showArticleButtonTapped {
    WebViewController* webController = [[WebViewController alloc] initWithURL:self.article.url];
    [self.navigationController pushViewController:webController animated:YES];
}

-(void)viewDidLoad {
    self.title = self.article.title;
    self.titleLabel.text = self.article.title;
    self.detailTextView.text = self.article.text;
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateFormatterShortStyle;
    dateFormatter.timeStyle = NSDateFormatterShortStyle;
    self.dateLabel.text = [dateFormatter stringFromDate:self.article.date];

    self.showArticleButton.enabled = (self.article.url != nil);
}

@end
