//
//  MWEmailListViewController.h
//  EmailList
//
//  Created by Hackademy on 5/17/14.
//  Copyright (c) 2014 Dyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MWEmailListViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *firstName;
@property (nonatomic, strong) IBOutlet UITextField *lastName;
@property (nonatomic, strong) IBOutlet UITextField *emailAddress;

@property (nonatomic, strong) IBOutlet UIButton *joinButton;
@property (retain, nonatomic) NSURLConnection *connection;
@property (retain, nonatomic) NSMutableData *receivedData;

-(IBAction)joinButton_clicked:(id)sender;

@end
