//
//  ProfileViewController.m
//  rivals
//
//  Created by Stephen on 9/30/16.
//  Copyright © 2016 sdbrown2. All rights reserved.
//

#import "ProfileViewController.h"
#import "ProfileModel.h"
#import "FRDStravaClientImports.h"

@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //clear labels and start spinner
    [self.nameLabel setText:@""];
    [self.locationLabel setText:@""];
    [self.activityIndicator startAnimating];
    [self.activityIndicator setHidden:NO];
    [[ProfileModel sharedInstance] loadDataWithCompletion:^(bool success, NSError *error) {
        [self.activityIndicator stopAnimating];
        [self.activityIndicator setHidden:YES];
        if (success){
            StravaAthlete *currentAthlete = [ProfileModel sharedInstance].currentAthlete;
            [self.nameLabel setText:[NSString stringWithFormat:@"%@ %@", currentAthlete.firstName, currentAthlete.lastName]];
            [self.locationLabel setText:[NSString stringWithFormat:@"%@, %@", currentAthlete.city, currentAthlete.state]];
        }
        else{
            UIAlertController *errorAlert = [UIAlertController alertControllerWithTitle:@"Alert" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [errorAlert addAction:okAction];
            [self presentViewController:errorAlert animated:YES completion:nil];
        }
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
