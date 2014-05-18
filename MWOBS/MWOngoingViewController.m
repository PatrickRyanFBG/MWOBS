//
//  MWOngoingViewController.m
//  MWOBS
//
//  Created by Rachel Lareau on 5/17/14.
//  Copyright (c) 2014 Dyn. All rights reserved.
//

#import "MWOngoingViewController.h"

@interface MWOngoingViewController ()

@end

@implementation MWOngoingViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SWST:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.mountwashington.org/education/tours/"]];
}

- (IBAction)LFTRP:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.mountwashington.org/education/center/"]];
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
