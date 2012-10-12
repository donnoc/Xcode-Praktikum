//
//  Task.h
//  ToDo-Liste
//
//  Created by Artur on 12.10.12.
//
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Task : NSObject

@property (nonatomic, strong) NSString*              name;
@property (nonatomic, strong) NSString*              date;
@property (nonatomic, strong) NSString*              description;
@property (nonatomic, strong) NSURL*                 url;
@property                     CLLocationCoordinate2D gps;  // IMPORTAND NO STAR

-(Task*)initWithName:       (NSString*)             name
			 andDate:       (NSString*)             date
			 andDescription:(NSString*)             description
			 andUrl:        (NSURL*)                url
			 andGps:        (CLLocationCoordinate2D)gps;


@end
