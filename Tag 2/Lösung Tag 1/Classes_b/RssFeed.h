//
//  RssFeed.h
//  Aufgabe3
//
//  Created by Felix Zwingenberger on 10.10.12.
//  Copyright (c) 2012 Uni Hamburg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RssFeed : NSObject

@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSURL* url;

+(RssFeed*)rssFeedWithTitle:(NSString*)title url:(NSURL*)url;

+(NSArray*)feeds;

@end
