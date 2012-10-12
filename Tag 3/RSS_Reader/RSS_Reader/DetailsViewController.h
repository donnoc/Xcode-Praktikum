//
//  DetailsViewController.h
//  RSS_Reader
//
//  Created by 8huebert on 11.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Article.h"

@interface DetailsViewController : UIViewController<UISplitViewControllerDelegate>

@property (nonatomic, strong) Article* derArtikel;

@property (nonatomic, strong) IBOutlet UITextView* titelLabel;
@property (nonatomic, strong) IBOutlet UITextView* textLabel;
@property (nonatomic, strong) IBOutlet UILabel* datumLabel;

- (id)initWithArticle:(Article*)artikel;

- (IBAction) clickWebButton ;


@end
