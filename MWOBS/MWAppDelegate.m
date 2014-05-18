//
//  MWAppDelegate.m
//  MWOBS
//
//  Created by Rachel Lareau on 5/16/14.
//  Copyright (c) 2014 Dyn. All rights reserved.
//

#import "MWAppDelegate.h"

extern bool notify;
extern int hour;
extern int minute;

@implementation MWAppDelegate


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    if (notify)
    {
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
        [calendar setTimeZone:timeZone];
        
        NSDate *now = [NSDate date];
        
        // Selectively convert the date components (year, month, day) of the input date
        NSDateComponents *dateComps = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit fromDate:now];
        
        // Set to next day only if passed 8am.
        if (dateComps.hour >= hour)
        {
            int daysToAdd = 0;
            NSDate *newDate1 = [now dateByAddingTimeInterval:60*60*24*daysToAdd];
            dateComps = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit  fromDate:newDate1];
        }
        
        // Set the time components manually
        [dateComps setHour:hour];
        [dateComps setMinute:minute];
        [dateComps setSecond:0];
        
        NSLog(@"%d %d", hour, minute);
        
        // Convert back
        NSDate *day = [calendar dateFromComponents:dateComps];
        
        UILocalNotification *notification = [[UILocalNotification alloc] init];
        notification.fireDate = [day dateByAddingTimeInterval:0];
        notification.alertBody = @"Make sure to check the weather!";
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
