//
//  ViewController.h
//  MapDemo
//
//  Created by xyxd mac on 12-10-10.
//  Copyright (c) 2012年 XYXD. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>


@property (weak, nonatomic) IBOutlet MKMapView *mMapView;
@property (retain, nonatomic) CLLocationManager *locManager;

@end
