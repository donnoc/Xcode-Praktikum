//
//  Article.h
//  Aufgabe3
//
//  Created by Felix Zwingenberger on 10.10.12.
//  Copyright (c) 2012 Uni Hamburg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Article : NSObject

@property (nonatomic, strong) NSString* text;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSURL* url;
@property (nonatomic, strong) NSDate* date;

-(Article*)initWithTitle:(NSString *)aTitle text:(NSString *)aText url:(NSURL *)aUrl date:(NSDate *)aDate;

@end
