//
//  DMRViewController.m
//  TestApp2
//
//  Created by Patrick Ryan on 5/17/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//

#import "DMRViewController.h"
#import "TFHpple.h"
#import "Reachability.h"

@interface DMRViewController ()

@end

@implementation DMRViewController

-(void) getDMR {
    NSURL *mWDMR = [NSURL URLWithString: @"http://www.mountwashington.org/weather/summit.php"];
    NSData *mWDMRData = [NSData dataWithContentsOfURL: mWDMR];

   TFHpple *mWParser = [TFHpple hppleWithHTMLData: mWDMRData];

    NSString *dmrXpath = @"//div[@id='MWOleft']//p";
    NSArray *dmrNodes = [mWParser searchWithXPathQuery: dmrXpath];

    NSMutableArray *dmrArray = [[NSMutableArray alloc] initWithCapacity:0];

    for(TFHppleElement *element in dmrNodes){
        NSString *tempString = [[NSString alloc] init];
        tempString = [[element firstChild ] content];
        if(tempString != nil)
            [dmrArray addObject:tempString];
    }
    
    if([dmrArray count] > 0){
        self.weather.text = dmrArray[0];
        self.temp.text = dmrArray[1];
        self.wind.text = dmrArray[2];
        self.visi.text = dmrArray[3];
        self.humid.text = dmrArray[4];
        self.pressure.text = dmrArray[5];
        self.ground.text = dmrArray[6];
    }

    NSString *bannerXpath = @"//div[@class='MWObanner']";
    NSArray *bannerNodes = [mWParser searchWithXPathQuery: bannerXpath];
    
    NSMutableArray *bannerArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    for(TFHppleElement *element in bannerNodes){
        NSString *tempString = [[NSString alloc] init];
        tempString = [[element firstChild ] content];
        if(tempString != nil)
            [bannerArray addObject:tempString];
    }
    
    if([bannerArray count] > 0){
        self.banner.text = bannerArray[0];
    }
    
    if([dmrArray count] > 0){
        self.textForcast.text = dmrArray[[dmrArray count] - 1];
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
    
    Reachability *networkReach = [Reachability reachabilityForInternetConnection];
    
    NetworkStatus networkStat = [networkReach currentReachabilityStatus];
    
    if(networkStat == NotReachable){
        
    }
    else{
        [self getDMR];
    }
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
