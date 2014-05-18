//
//  ConditionsViewController.h
//  TestApp2
//
//  Created by Patrick Ryan on 5/17/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConditionsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel * temp;
@property (strong, nonatomic) IBOutlet UILabel * wind;
@property (strong, nonatomic) IBOutlet UILabel * direc;
@property (strong, nonatomic) IBOutlet UILabel * gust;
@property (strong, nonatomic) IBOutlet UILabel * chill;
@property (strong, nonatomic) IBOutlet UILabel * time;

@end
