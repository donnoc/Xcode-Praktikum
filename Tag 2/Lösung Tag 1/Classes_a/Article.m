//
//  Article.m
//  Aufgabe 1
//
//  Created by Felix Zwingenberger on 01.10.12.
//  Copyright (c) 2012 Uni Hamburg. All rights reserved.
//

#import "Article.h"

@implementation Article

@synthesize text = _text;
@synthesize title = _title;
@synthesize url = _url;
@synthesize date = _date;

-(Article*)initWithTitle:(NSString *)aTitle text:(NSString *)aText url:(NSURL *)aUrl date:(NSDate *)aDate {
    self = [super init];
    if(self) {
        self.title = aTitle;
        self.text = aText;
        self.url = aUrl;
        self.date = aDate;
    }
    return self;
}


@end
