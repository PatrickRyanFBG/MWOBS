//
//  MWGPSViewController.h
//  GPS
//
//  Created by Hackademy on 5/17/14.
//  Copyright (c) 2014 Dyn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MWGPSViewController : UIViewController <CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *location;
@property (strong, nonatomic) IBOutlet UILabel *coordinateLat;
@property (strong, nonatomic) IBOutlet UILabel *coordinateLon;
@property (strong, nonatomic) IBOutlet UILabel *altitude;
@property (strong, nonatomic) IBOutlet UILabel *hAccuracy;
@property (strong, nonatomic) IBOutlet UILabel *vAccuracy;
@property (strong, nonatomic) IBOutlet UILabel *timestamp;
@property (strong, nonatomic) IBOutlet UILabel *cAltTemp;
@property (nonatomic) float altitudeval;

@end
