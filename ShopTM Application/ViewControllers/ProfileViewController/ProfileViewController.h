//
//  ProfileViewController.h
//  ShopTM Application
//
//  Created by Shelly Pritchard on 13/06/17.
//  Copyright © 2017 SPB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface ProfileViewController : BaseViewController


@property (weak, nonatomic) IBOutlet UIButton *btnEditProfile;
@property (weak, nonatomic) IBOutlet UIButton *btnKycRequestNow;
@property (weak, nonatomic) IBOutlet UIButton *btnMenu;

- (IBAction)onClickBackButton:(UIButton *)sender;
- (IBAction)onClickEditProfile:(UIButton *)sender;


@end
