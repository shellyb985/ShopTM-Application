//
//  ProfileViewController.m
//  ShopTM Application
//
//  Created by Shelly Pritchard on 13/06/17.
//  Copyright © 2017 SPB. All rights reserved.
//

#import "ProfileViewController.h"
#import "EditProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.btnEditProfile.layer setCornerRadius:3.0];
    [self.btnEditProfile.layer setBorderWidth:1.0];
    [self.btnEditProfile.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    
    [self.btnKycRequestNow.layer setCornerRadius:3.0];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showSideMenu {
}

- (IBAction)onClickBackButton:(UIButton *)sender {
    [self showMenu];
}

- (IBAction)onClickEditProfile:(UIButton *)sender {
    [self navigateToEditProfileVC];
}

- (void)navigateToEditProfileVC {
    EditProfileViewController *editController = [[EditProfileViewController alloc] initWithNibName:@"EditProfileViewController" bundle:nil];
    [self.navigationController pushViewController:editController animated:YES];
}
@end
