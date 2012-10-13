//
//  MapViewController.m
//  ToDo-Liste
//
//  Created by 8huebert on 12.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController()

@property CLLocationCoordinate2D location;
@property NSString* name;

@end


@implementation MapViewController

@synthesize location = _location;
@synthesize name = _name;


- (id) initWithLocationCoordinate:(CLLocationCoordinate2D)location andName:(NSString*)name
{
	self = [super initWithNibName:@"MapViewController_iPhone" bundle:nil];
	
	if (self) {
		self.location = location;
		self.name = name;
	}
	
	NSLog(@"[MapViewController] Initialisiere Map mit Coordinaten %f", self.location.latitude);
	
	return self;
	
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	// define zoom lvl
	MKCoordinateSpan span;
	span.latitudeDelta=0.02;
	span.longitudeDelta=0.02;

	// navigate the map center to coordinates
	[_mapView setRegion:MKCoordinateRegionMake(self.location, span)];
	
//	// add a red pin to location
//	AddressAnnotation* annotation = [[AddressAnnotation alloc] initWithCoordinate:self.location];
//	[_mapView addAnnotation:annotation];
	NSLog(@"Der name für den Pin ist: %@", self.name);
	// Add the annotation to our map view
	MapViewAnnotation* newAnnotation = [[MapViewAnnotation alloc] initWithTitle:self.name andCoordinate:self.location];
	[self.mapView addAnnotation:newAnnotation];
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
	NSLog(@"Auf den Pin geklickt");
	
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view
{
	
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
