//
//  MapViewAnnotation.m
//  ToDo-Liste
//
//  Created by Artur on 13.10.12.
//
//

#import "MapViewAnnotation.h"

@implementation MapViewAnnotation

@synthesize title, coordinate;

- (id)initWithTitle:(NSString *)ttl andCoordinate:(CLLocationCoordinate2D)c2d {
	self = [super init];
	title = ttl;
	coordinate = c2d;
	return self;
}


@end
