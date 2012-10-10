//
//  ViewController.m
//  MapDemo
//
//  Created by xyxd mac on 12-10-10.
//  Copyright (c) 2012年 XYXD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mMapView = _mMapView;
@synthesize locManager = _locManager;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
    self.locManager = [[CLLocationManager alloc] init] ;
    self.locManager.delegate = self;
	self.locManager.desiredAccuracy = kCLLocationAccuracyBest;
	self.locManager.distanceFilter = 5.0f; // in meters
	[self.locManager startUpdatingLocation];
    
    
    
    
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(39.91564361907798,116.39076885665897);
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(center, 10000,10000);
    //        viewRegion.center = self.bestLocation.coordinate;
    viewRegion.center = center;
    MKCoordinateRegion adjustedRegion = [_mMapView regionThatFits:viewRegion];
    [_mMapView setRegion:adjustedRegion animated:YES];
    _mMapView.zoomEnabled = YES;
    _mMapView.delegate = self;
     self.mMapView.showsUserLocation = YES;
    
    _mMapView.userLocation.title = [NSString stringWithFormat:@"位置：%f,%f",self.mMapView.userLocation.location.coordinate.latitude,self.mMapView.userLocation.location.coordinate.longitude] ;
   
    
//    [self.mMapView setCenterCoordinate:self.mMapView.userLocation.coordinate animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnClick:(id)sender
{
    UIButton *btn = (UIButton*) sender;
    
    switch ([btn tag]) {
        case 101://放大
        {
            MKCoordinateRegion region = self.mMapView.region;
            region.span.latitudeDelta=region.span.latitudeDelta * 0.4;
            region.span.longitudeDelta=region.span.longitudeDelta * 0.4;
            [self.mMapView setRegion:region animated:YES];
        }break;
        case 102://缩小
        {
            MKCoordinateRegion region = self.mMapView.region;
            double lati = region.span.latitudeDelta * 1.3;
            double longi = region.span.longitudeDelta * 1.3;
            if (lati<182 &&longi <292) {
                region.span.latitudeDelta=lati;
                region.span.longitudeDelta=longi;
            }
            
            [self.mMapView setRegion:region animated:YES];
        }break;
            
    }
}


#pragma mark - location

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    
    
      
    NSLog(@"newLocation,%f,%f",newLocation.coordinate.longitude,newLocation.coordinate.latitude);
    
    [self.locManager stopUpdatingLocation];
    
  
    
    
    
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    
    NSLog(@"位置失败:%@",[error description]);

    
}

@end
