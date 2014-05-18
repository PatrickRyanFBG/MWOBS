//
//  MWSettingsViewController.m
//  EmailList
//
//  Created by Hackademy on 5/18/14.
//  Copyright (c) 2014 Dyn. All rights reserved.
//

#import "MWSettingsViewController.h"

extern bool notify;
extern int hour;
extern int minute;

@interface MWSettingsViewController ()

@end

@implementation MWSettingsViewController

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
    if (notify)
    {
        [self.notifySwitch setOn:YES animated:YES];
    }
    else
    {
        [self.notifySwitch setOn:NO animated:YES];
    }
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    [calendar setTimeZone:timeZone];
    //NSLog(@"%@", self.datePicker.date);
    NSDate *targetDate = self.datePicker.date;
    
    NSDateComponents *dateComps = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit fromDate:targetDate];
    hour = dateComps.hour;
    minute = dateComps.minute;
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

- (IBAction)Switched:(id)sender {
    if (self.notifySwitch.on)
    {
        notify = true;
    }
    else
    {
        notify = false;
    }
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    [calendar setTimeZone:timeZone];
    //NSLog(@"%@", self.datePicker.date);
    NSDate *targetDate = self.datePicker.date;
    
    NSDateComponents *dateComps = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit fromDate:targetDate];
    hour = dateComps.hour;
    minute = dateComps.minute;
}

- (IBAction)TimeChanged:(id)sender {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    [calendar setTimeZone:timeZone];
    //NSLog(@"%@", self.datePicker.date);
    NSDate *targetDate = self.datePicker.date;
    
    NSDateComponents *dateComps = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit fromDate:targetDate];
    hour = dateComps.hour;
    minute = dateComps.minute;
}
@end
