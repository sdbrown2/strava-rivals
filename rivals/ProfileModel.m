//
//  ProfileModel.m
//  rivals
//
//  Created by Stephen on 9/30/16.
//  Copyright © 2016 sdbrown2. All rights reserved.
//

#import "ProfileModel.h"

@implementation ProfileModel

+ (instancetype)sharedInstance
{
    static dispatch_once_t p = 0;
    __strong static id _sharedObject = nil;
        dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

-(void)loadDataWithCompletion:(void (^)(bool success, NSError *error))completion
{
    [[FRDStravaClient sharedInstance] fetchCurrentAthleteWithSuccess:^(StravaAthlete *athlete) {
        NSLog(@"Athlete fetch success");
        self.currentAthlete = athlete;
        completion(YES, nil);
    } failure:^(NSError *error) {
        NSLog(@"Athlete fetch fail");
        completion(NO, error);
    }];
}

@end
