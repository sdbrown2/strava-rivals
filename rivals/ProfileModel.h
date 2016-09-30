//
//  ProfileModel.h
//  rivals
//
//  Created by Stephen on 9/30/16.
//  Copyright © 2016 sdbrown2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FRDStravaClientImports.h"

@interface ProfileModel : NSObject
@property (strong, nonatomic) StravaAthlete *currentAthlete;

+(ProfileModel *)sharedInstance;
-(void)loadDataWithCompletion:(void (^)(bool success, NSError *error))completion;
@end
