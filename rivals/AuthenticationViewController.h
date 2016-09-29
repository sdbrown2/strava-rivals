//
//  AuthenticationViewController.h
//  rivals
//
//  Created by Stephen on 9/27/16.
//  Copyright © 2016 sdbrown2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AuthenticationViewController : UIViewController

-(void)exchangeTokenForCode:(NSString *)code;


@end

