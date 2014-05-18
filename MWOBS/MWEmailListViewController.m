//
//  MWEmailListViewController.m
//  EmailList
//
//  Created by Hackademy on 5/17/14.
//  Copyright (c) 2014 Dyn. All rights reserved.
//

#import "MWEmailListViewController.h"
//#import "MWEmailJoinViewController.h"
//#import "WebViewController.h"

@interface MWEmailListViewController ()

@end

@implementation MWEmailListViewController

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
    self.firstName.delegate = self;
    self.lastName.delegate = self;
    self.emailAddress.delegate = self;
    //[self.joinButton addTarget:self action:@selector(joinButton_clicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField setUserInteractionEnabled:YES];
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//@"email=&fname=Stefan&lname=Alexander&liame=sualexander@wpi.edu&format=HTML&submit=join";
-(IBAction)joinButton_clicked:(id)sender{
    NSString *myRequestString = [[NSString alloc] initWithFormat:@"email=&fname=%@&lname=%@&liame=%@&format=HTML&submit=Join", self.firstName.text, self.lastName.text, self.emailAddress.text];
    NSData *myRequestData = [NSData dataWithBytes: [myRequestString UTF8String] length: [myRequestString length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString: @"https://www.mountwashington.org/secure/list/index.php"]];
    [request setHTTPMethod: @"POST"];
    [request setHTTPBody: myRequestData];
    NSData *returnData = [NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil];
    
    NSString *dataString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    
    if ([dataString rangeOfString:@"Please Confirm Your Address"].location != NSNotFound)
    {
        // Confirmed
        UIAlertView *confirmAlert = [[UIAlertView alloc] initWithTitle:@"Confirmation"
                                                             message:@"A confirmation email has been sent."
                                                            delegate:nil
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil];
        [confirmAlert show];
        [confirmAlert release];
        self.firstName.text = @"";
        self.lastName.text = @"";
        self.emailAddress.text = @"";
    }
    else
    {
        // Error
        UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                             message:@"Please check the information you have entered."
                                                            delegate:nil
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil];
        [errorAlert show];
        [errorAlert release];
    }
    
    //NSLog(@"%@", dataString);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    MWEmailJoinViewController *vc = segue.destinationViewController;
    vc.firstName = self.firstName.text;
    vc.lastName = self.lastName.text;
    vc.emailAddress = self.emailAddress.text;
}
*/

@end
