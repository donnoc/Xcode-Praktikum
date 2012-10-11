//
//  RSS-Parser.m
//  RSSExample
//
//  Created by Felix
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "RSSParser.h"
#import "Article.h"

@interface RSSParser ()

@property (nonatomic, strong) Article* item;
@property (nonatomic, strong) NSString* currentElement;
@property (nonatomic, strong) NSMutableString* currentTitle;
@property (nonatomic, strong) NSMutableString* currentDate;
@property (nonatomic, strong) NSMutableString* currentSummary;
@property (nonatomic, strong) NSMutableString* currentLink;

@property (nonatomic, strong) NSMutableArray *feedItems;
@property (nonatomic, strong) NSXMLParser *xmlParser;

@end

@implementation RSSParser

@synthesize item = _item;
@synthesize currentElement = _currentElement;
@synthesize currentTitle = _currentTitle;
@synthesize currentDate = _currentDate;
@synthesize currentSummary = _currentSummary;
@synthesize currentLink = _currentLink;
@synthesize feedItems = _feedItems;
@synthesize xmlParser = _xmlParser;

- (NSArray *)parseXMLFileAtURL:(NSURL *)xmlURL {
	self.feedItems = [[NSMutableArray alloc] init];
	
	self.xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
	[self.xmlParser setDelegate:self];
	[self.xmlParser setShouldProcessNamespaces:NO];
	[self.xmlParser setShouldReportNamespacePrefixes:NO];
	[self.xmlParser setShouldResolveExternalEntities:NO];
	
	[self.xmlParser parse];
    self.xmlParser = nil;
    
    NSArray* result = [self.feedItems copy];
    self.feedItems = nil;
    
	return result;
}

- (void)parser:(NSXMLParser *)parser parseErrorOccured:(NSError *)parseError {
	NSString *errorString = [NSString stringWithFormat:@"Unable to download story feed from web site (Error code %i )", [parseError code]];
	NSLog(@"error parsing XML: %@", errorString);
	UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error loading content" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[errorAlert show];
}

- (void)parserDidStartDocument:(NSXMLParser *)parser {
	NSLog(@"Beginn mit dem Parsen");
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *) elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
	self.currentElement = [elementName copy];
	if ([elementName isEqualToString:@"item"]) {
		self.item = [[Article alloc] init];
		self.currentTitle = [[NSMutableString alloc] init];
		self.currentDate = [[NSMutableString alloc] init];
		self.currentSummary = [[NSMutableString alloc] init];
		self.currentLink = [[NSMutableString alloc] init];
	}
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	if ([self.currentElement isEqualToString:@"title"]) {
		[self.currentTitle appendString:string];
	} else if ([self.currentElement isEqualToString:@"link"]) {
		[self.currentLink appendString:string];
	} else if ([self.currentElement isEqualToString:@"description"]) {
		[self.currentSummary appendString:string];
	} else if ([self.currentElement isEqualToString:@"pubDate"]) {
		[self.currentDate appendString:string];
	}
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	if ([elementName isEqualToString:@"item"]) {
		self.item.title = self.currentTitle;
		self.item.url = [NSURL URLWithString:self.currentLink];
		self.item.text = self.currentSummary;
		NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		formatter.dateFormat = @"EEE, dd MM yyyy HH:mm:ss Z";
		formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en"];
		NSDate *theDate = [formatter dateFromString:[self.currentDate stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
		self.item.date = theDate;
		[self.feedItems addObject:self.item];
		
		self.item = nil;
		self.currentTitle = nil;
		self.currentDate = nil;
		self.currentSummary = nil;
		self.currentLink = nil;
	}
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
	NSLog(@"Parsen beendet");
	NSLog(@"Anzahl eingelesener Elemente: %d ", [self.feedItems count]);
    self.item = nil;
    self.currentTitle = nil;
    self.currentDate = nil;
    self.currentSummary = nil;
    self.currentLink = nil;
}

@end
