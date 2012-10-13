//
//  MapViewAnnotation.h
//  ToDo-Liste
//
//  Created by Artur on 13.10.12.
//
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapViewAnnotation : NSObject <MKAnnotation> {
	
	NSString *title;
	CLLocationCoordinate2D coordinate;
	
}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (id)initWithTitle:(NSString *)ttl andCoordinate:(CLLocationCoordinate2D)c2d;

@end
