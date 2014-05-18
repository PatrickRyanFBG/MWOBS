//
//  DMRViewController.h
//  TestApp2
//
//  Created by Patrick Ryan on 5/17/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMRViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel * banner;

@property (strong, nonatomic) IBOutlet UILabel * weather;
@property (strong, nonatomic) IBOutlet UILabel * temp;
@property (strong, nonatomic) IBOutlet UILabel * wind;
@property (strong, nonatomic) IBOutlet UILabel * visi;
@property (strong, nonatomic) IBOutlet UILabel * humid;
@property (strong, nonatomic) IBOutlet UILabel * pressure;
@property (strong, nonatomic) IBOutlet UILabel * ground;
@property (strong, nonatomic) IBOutlet UITextView * textForcast;

@property (strong, nonatomic) IBOutlet UILabel * forcast;

@end
