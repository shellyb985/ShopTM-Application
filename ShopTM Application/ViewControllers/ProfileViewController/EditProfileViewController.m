//
//  EditProfileViewController.m
//  ShopTM Application
//
//  Created by Shelly Pritchard on 18/06/17.
//  Copyright © 2017 SPB. All rights reserved.
//

#import "EditProfileViewController.h"

@interface EditProfileViewController ()

@end

@implementation EditProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onClickBackButton:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)onClickDoneButton:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
