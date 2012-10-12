//
//  RSS-Parser.h
//  RSSExample
//
//  Created by Felix
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RSSParser : NSObject<NSXMLParserDelegate> {
}

- (NSArray *)parseXMLFileAtURL:(NSURL *)URL;

@end
