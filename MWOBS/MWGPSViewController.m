//
//  MWGPSViewController.m
//  GPS
//
//  Created by Hackademy on 5/17/14.
//  Copyright (c) 2014 Dyn. All rights reserved.
//

#import "MWGPSViewController.h"
#import "TFHpple.h"
#import "Reachability.h"

@interface MWGPSViewController ()

@end

@implementation MWGPSViewController

-(void) getAltWeather{
    NSURL *mWAlt = [NSURL URLWithString: @"http://www.mountwashington.org/weather/mesonet/"];
    NSData *mWAltData = [NSData dataWithContentsOfURL: mWAlt];
    
    TFHpple *mWParser = [TFHpple hppleWithHTMLData: mWAltData];
    
    NSString *altXpath = @"//div[@id='Tdata3']//span/span";
    NSArray *altNodes = [mWParser searchWithXPathQuery: altXpath];
    
    NSMutableArray *altArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    for(TFHppleElement *element in altNodes){
        NSString *tempString = [[NSString alloc] init];
        tempString = [[element firstChild ] content];
        
        tempString = [[element firstChild] content];
        
        if(tempString != nil)
            [altArray addObject:tempString];
    }
    
    if([altArray count] > 0){
        if(self.altitudeval <= 1600){
            self.cAltTemp.text = [NSString stringWithFormat:@"The temp at your current altitute is %@.", altArray[[altArray count] -1]];
            NSLog(@"%@", altArray[[altArray count] -1]);
        }
        else if( self.altitudeval <= 2300){
            self.cAltTemp.text = [NSString stringWithFormat:@"The temp at your current altitute is between %@ and %@.", altArray[[altArray count] -1], altArray[[altArray count] -2]];
            NSLog(@"%@", altArray[[altArray count] -2]);
        }
        else if(self.altitudeval <= 3300){
            self.cAltTemp.text = [NSString stringWithFormat:@"The temp at your current altitute is between %@ and %@.", altArray[[altArray count] -2], altArray[[altArray count] -3]];
            NSLog(@"%@", altArray[[altArray count] -3]);
        }
        else if(self.altitudeval <= 4000){
            self.cAltTemp.text = [NSString stringWithFormat:@"The temp at your current altitute is between %@ and %@.", altArray[[altArray count] -3], altArray[[altArray count] -4]];
            NSLog(@"%@", altArray[[altArray count] -4]);
        }
        else if(self.altitudeval <= 4300){
            self.cAltTemp.text = [NSString stringWithFormat:@"The temp at your current altitute is between %@ and %@.", altArray[[altArray count] -4], altArray[[altArray count] -5]];
            NSLog(@"%@", altArray[[altArray count] -5]);
        }
        else if(self.altitudeval <= 5300){
            self.cAltTemp.text = [NSString stringWithFormat:@"The temp at your current altitute is between %@ and %@.", altArray[[altArray count] -5], altArray[[altArray count] -6]];
            NSLog(@"%@", altArray[[altArray count] -6]);
        }
        else if(self.altitudeval <= 6288){
            self.cAltTemp.text = [NSString stringWithFormat:@"The temp at your current altitute is between %@ and %@.", altArray[[altArray count] -6], altArray[[altArray count] -7]];
            NSLog(@"%@", altArray[[altArray count] -7]);
        }
        else{
            self.cAltTemp.text = [NSString stringWithFormat:@"The temp at your current altitute is %@.", altArray[[altArray count] -7]];
        }
    }
    else{
        self.cAltTemp.text = @"No Internetconnection";
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.coordinateLat.textAlignment = NSTextAlignmentRight;
    self.coordinateLon.textAlignment = NSTextAlignmentRight;
    self.altitude.textAlignment = NSTextAlignmentRight;
    self.hAccuracy.textAlignment = NSTextAlignmentRight;
    self.vAccuracy.textAlignment = NSTextAlignmentRight;
    self.timestamp.textAlignment = NSTextAlignmentRight;
    if ([CLLocationManager locationServicesEnabled]) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
        [self.locationManager startUpdatingLocation];
        self.locationManager.delegate = self;
        self.location = [[CLLocation alloc] init];
        //NSLog(@"locationservices enabled");
    }
    else
    {
        //NSLog(@"locationservices disabled");
    }
    
    Reachability *networkReach = [Reachability reachabilityForInternetConnection];
    
    NetworkStatus networkStat = [networkReach currentReachabilityStatus];
    
    if(networkStat == NotReachable){
        
    }
    else{
        [self getAltWeather];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    self.location = locations.lastObject;
    self.altitudeval = self.location.altitude * 3.28084;
    //NSLog(@"%@", self.location.description);
    self.coordinateLat.text = [NSString stringWithFormat:@"%.02f", self.location.coordinate.latitude];
    self.coordinateLon.text = [NSString stringWithFormat:@"%.02f", self.location.coordinate.longitude];
    self.altitude.text = [NSString stringWithFormat:@"%.02f", self.altitudeval];
    self.hAccuracy.text = [NSString stringWithFormat:@"%.02f", self.location.horizontalAccuracy];
    self.vAccuracy.text = [NSString stringWithFormat:@"%.02f", self.location.verticalAccuracy];
    self.timestamp.text = [NSString stringWithFormat:@"%@", self.location.timestamp];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
