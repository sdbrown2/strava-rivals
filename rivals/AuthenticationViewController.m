//
//  AuthenticationViewController.m
//  rivals
//
//  Created by Stephen on 9/27/16.
//  Copyright © 2016 sdbrown2. All rights reserved.
//

#import "AuthenticationViewController.h"
#import "FRDStravaClientImports.h"

@interface AuthenticationViewController ()

@end

@implementation AuthenticationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Check for a stored token, fetch user and advance
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)authenticateButtonPressed:(id)sender {
    NSString *urlString = @"rivals://localhost";
    [[FRDStravaClient sharedInstance] authorizeWithCallbackURL:[NSURL URLWithString:urlString]
                                                     stateInfo:nil];
}

-(void)exchangeTokenForCode:(NSString *)code{
    [[FRDStravaClient sharedInstance] exchangeTokenForCode:code
                                                   success:^(StravaAccessTokenResponse *response) {
                                                       NSLog(@"Exchange success");
                                                       [self performSegueWithIdentifier:@"showProfile" sender:self];
                                                   } failure:^(NSError *error) {
                                                       NSLog(@"Exchange failure");
                                                       UIAlertController *errorAlert = [UIAlertController alertControllerWithTitle:@"Alert" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
                                                       UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                                                       [errorAlert addAction:okAction];
                                                       [self presentViewController:errorAlert animated:YES completion:nil];
                                                   }];
}

@end
