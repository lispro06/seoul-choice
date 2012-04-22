    //
//  FindPathViewController.m
//  Church
//
//  Created by Kang Han on 11. 5. 11..
//  Copyright 2011 SSU. All rights reserved.
//

#import "FindPathViewController.h"


@implementation FindPathViewController
@synthesize imageView_search; 
@synthesize locationManager;
@synthesize mapView;
- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFailWithError:(NSError *)error{
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark{
	mPlacemark=placemark;
	[mapView addAnnotation:placemark];
}
#pragma mark -
#pragma mark CLLocationManagerDelegate Methods
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
	location=newLocation.coordinate;
	//One location is obtained.. just zoom to that location
	MKCoordinateRegion region;
	region.center=location;
	[mapView setRegion:region animated:TRUE];
}
// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/
- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation{  
    MKPinAnnotationView *annView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"MyPin"];  
    annView.animatesDrop=TRUE;  
    annView.canShowCallout = YES;  
    [annView setSelected:YES];  
    annView.pinColor = MKPinAnnotationColorPurple;  
    annView.calloutOffset = CGPointMake(-5, 5);  
    return annView;  
}  

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    mapView.mapType = MKMapTypeStandard;
    
    CLLocationCoordinate2D coord;
    coord.latitude=37.557202;
    coord.longitude=126.923039;
    
    CLLocationCoordinate2D coord2;
    coord2.latitude=37.536435;
    coord2.longitude=127.005904;
    
    MKCoordinateSpan span;
	span.latitudeDelta = 0.001;//표시되는 영역의 설정 수치가 작을수록 더 확대된다.
	span.longitudeDelta= 0.001;
    MKCoordinateRegion region = {coord, span};
    [mapView setRegion:region];
    [mapView setFrame:CGRectMake(0,0,320,415)];
    [self.view insertSubview:mapView atIndex:0];
    PlaceMark *addAnnotation = [[[PlaceMark alloc] initWithCoordinate:coord] retain];  
    [addAnnotation setTitle:@"가톨릭청년회관(CYC)"];
    [addAnnotation setSubTitle:@"마포구 동교동 158-2"];
    [mapView addAnnotation:addAnnotation];
    
    PlaceMark *addAnnotation2= [[[PlaceMark alloc] initWithCoordinate:coord2] retain];  
    [addAnnotation2 setTitle:@"선택주말장소"];
    [addAnnotation2 setSubTitle:@"용산구 한남동 714"];
    [mapView addAnnotation:addAnnotation2];
    [PlaceMark release];
    [mapView release];
//    NSArray *annotations = [NSArray arrayWithArray:[mapView annotations]];
//    [mapView removeAnnotations:annotations];
//    MKReverseGeocoder *geocoder=[[MKReverseGeocoder alloc] initWithCoordinate:coord];
//    geocoder.delegate=self;
//    [geocoder start];
}

-(IBAction)tue:(id)sender{
    CLLocationCoordinate2D coord;
    coord.latitude=37.557202;
    coord.longitude=126.923039;
    
    CLLocationCoordinate2D coord2;
    coord2.latitude=37.536435;
    coord2.longitude=127.005904;
    
    MKCoordinateSpan span;
	span.latitudeDelta = 0.001;//표시되는 영역의 설정 수치가 작을수록 더 확대된다.
	span.longitudeDelta= 0.001;
    MKCoordinateRegion region = {coord, span};
    [mapView setRegion:region];
}

-(IBAction)sat:(id)sender{
    
    CLLocationCoordinate2D coord;
    coord.latitude=37.536435;
    coord.longitude=127.005904;
    
    MKCoordinateSpan span;
	span.latitudeDelta = 0.001;//표시되는 영역의 설정 수치가 작을수록 더 확대된다.
	span.longitudeDelta= 0.001;
    MKCoordinateRegion region = {coord, span};
    [mapView setRegion:region];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[imageView_search release];
    [super dealloc];
}


@end
