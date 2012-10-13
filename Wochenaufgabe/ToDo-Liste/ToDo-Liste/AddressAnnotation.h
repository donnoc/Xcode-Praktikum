//
//  AddressAnnotation.h
//  ToDo-Liste
//
//  Created by Artur on 13.10.12.
//
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface AddressAnnotation : NSObject<MKAnnotation> {
	CLLocationCoordinate2D coordinate;
}


-(id)initWithCoordinate:(CLLocationCoordinate2D) c;


@end