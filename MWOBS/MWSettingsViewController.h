//
//  MWSettingsViewController.h
//  EmailList
//
//  Created by Hackademy on 5/18/14.
//  Copyright (c) 2014 Dyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MWSettingsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UISwitch *notifySwitch;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)Switched:(id)sender;
- (IBAction)TimeChanged:(id)sender;

@end
