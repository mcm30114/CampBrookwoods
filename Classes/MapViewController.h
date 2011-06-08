//
//  MapViewController.h
//  CampBrookwoods
//
//  Created by Christopher Blatchley on 5/25/11.
//  Copyright 2011 LeTourneau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#define GOOGLE_MAP_API_URL @"http://maps.googleapis.com/maps/api/directions/json?"

@interface MapViewController : UIViewController
{
    IBOutlet MKMapView *mapView;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@end
