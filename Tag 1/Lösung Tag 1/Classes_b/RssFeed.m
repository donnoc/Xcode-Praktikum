//
//  RssFeed.m
//  Aufgabe3
//
//  Created by Felix Zwingenberger on 10.10.12.
//  Copyright (c) 2012 Uni Hamburg. All rights reserved.
//

#import "RssFeed.h"

@implementation RssFeed

@synthesize title = _title;
@synthesize url = _url;

+(RssFeed*)rssFeedWithTitle:(NSString*)title url:(NSURL*)url {
    RssFeed* result = [[RssFeed alloc] init];
    result.title = title;
    result.url = url;
    
    return result;
}

/*
 * Gibt ein NSArray mit RSS-Feeds zurück.
 */
+(NSArray*)feeds {
    NSMutableArray* mutableFeedsArray = [NSMutableArray array];

    RssFeed* appleNewsFeed = [RssFeed rssFeedWithTitle:@"Apple News" url:[NSURL URLWithString:@"http://www.apple.com/de/main/rss/hotnews/hotnews.rss"]];
    [mutableFeedsArray addObject:appleNewsFeed];
    
    RssFeed* zeitOnlineFeed = [RssFeed rssFeedWithTitle:@"Zeit Online" url:[NSURL URLWithString:@"http://newsfeed.zeit.de/index"]];
    [mutableFeedsArray addObject:zeitOnlineFeed];
    
    return [mutableFeedsArray copy];
}

@end
