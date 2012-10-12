//
//  ArticleDetailViewController.h
//  LoesungTag2
//
//  Created by Felix Zwingenberger on 11.10.12.
//  Copyright (c) 2012 Uni Hamburg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Article.h"

@interface ArticleDetailViewController : UIViewController

@property (nonatomic, strong) Article* article;

-(ArticleDetailViewController*)initWithArticle:(Article*)article;

@end
