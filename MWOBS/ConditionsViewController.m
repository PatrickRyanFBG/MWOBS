//
//  ConditionsViewController.m
//  TestApp2
//
//  Created by Patrick Ryan on 5/17/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//

#import "ConditionsViewController.h"
#import "TFHpple.h"
#import "Reachability.h"
@interface ConditionsViewController ()

@end

@implementation ConditionsViewController

-(void) getConditions {
    NSURL *mWCondish = [NSURL URLWithString: @"http://www.mountwashington.org"];
    NSData *mWHTMLData = [NSData dataWithContentsOfURL: mWCondish];
    
    TFHpple *mWParser = [TFHpple hppleWithHTMLData: mWHTMLData];
    
    NSString *condishXpath = @"//div[@id='MWOmainConditions']//tr";
    NSArray *condishNodes = [mWParser searchWithXPathQuery: condishXpath];
    
    NSMutableArray *condishArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    for(TFHppleElement *element in condishNodes){
        NSString *tempString = [[NSString alloc] init];
        
        for(TFHppleElement *child in element.children){
            if ([child.tagName isEqualToString:@"td"]) {
                if(![[[child firstChild ] content] isEqualToString:nil]){
                    tempString = [[child firstChild ] content];
                }
            }
        }
        
        if(tempString != nil)
            [condishArray addObject:tempString];
    }
    
    if([condishArray count] > 0){
        self.temp.text = condishArray[0];
        self.wind.text = condishArray[1];
        self.direc.text = condishArray[2];
    
        if([condishArray count] < 5){
            self.chill.text = condishArray[3];
        }
        else{
            self.gust.text = condishArray[3];
            self.chill.text = condishArray[4];
        }
    }
    
    NSString *timeXpath = @"//td[@class='MWOconditionsTime']";
    NSArray *timeNodes = [mWParser searchWithXPathQuery: timeXpath];
    
    NSMutableArray *timeArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    for(TFHppleElement *element in timeNodes){
        NSString *tempString = [[NSString alloc] init];
        
        for(TFHppleElement *child in element.children){
            if ([child.tagName isEqualToString:@"span"]) {
                if(![[[child firstChild ] content] isEqualToString:nil]){
                    tempString = [[child firstChild ] content];
                }
            }
        }
        
        [timeArray addObject:tempString];
    }
    
    if([timeArray count] > 0)
        self.time.text = timeArray[0];
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
        [self getConditions];
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
