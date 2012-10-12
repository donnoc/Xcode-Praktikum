//
//  Task.m
//  ToDo-Liste
//
//  Created by Artur on 12.10.12.
//
//

#import "Task.h"

@implementation Task

@synthesize name        = _name;
@synthesize date        = _date;
@synthesize description = _description;
@synthesize url         = _url;
@synthesize gps         = _gps;


/**
 * initWithName:andDate:andDescription:andUrl:andGps:
 * 
 * initialisiert einen Artikel sofort mit seinen parametern
 */
-(Task*)initWithName:       (NSString*)             name
			 andDate:       (NSString*)             date
			 andDescription:(NSString*)             description
			 andUrl:        (NSURL*)                url
			 andGps:        (CLLocationCoordinate2D)gps
{
	self = [super init];
	
	if (self) {
		self.name        = name;
		self.date        = date;
		self.description = description;
		self.url         = url;
		self.gps         = gps;
	}
	
	NSLog(@"[Task] initialize Task");
	return self;
}


@end
