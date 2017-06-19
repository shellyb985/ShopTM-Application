//
//  BaseViewController.m
//  ShopTM Application
//
//  Created by Shelly Pritchard on 18/06/17.
//  Copyright © 2017 SPB. All rights reserved.
//

#import "BaseViewController.h"
#import "MenuView.h"

@interface BaseViewController () {
    MenuView *menuView;
    UIView *menuBgView;
    NSLayoutConstraint *left;
}

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createSideMenu];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createSideMenu {
    
    menuBgView = [[UIView alloc] init];
    [menuBgView setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5]];
    //Menu Bg View creations
    [self.view addSubview:menuBgView];    
    menuBgView.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray *horizontal1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[menuBgView]-0-|" options:0 metrics:@{} views:NSDictionaryOfVariableBindings(menuBgView)];
    NSArray *vertical1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[menuBgView]-0-|" options:0 metrics:@{} views:NSDictionaryOfVariableBindings(menuBgView)];
    
    [self.view addConstraints:horizontal1];
    [self.view  addConstraints:vertical1];

    
    //Hide Menu button Creation
    UIButton *btnHidemenu = [[UIButton alloc] init];
    [btnHidemenu setBackgroundColor:[UIColor clearColor]];
    [btnHidemenu addTarget:self action:@selector(hideMenu) forControlEvents:UIControlEventTouchUpInside];
    [menuBgView addSubview:btnHidemenu];
    btnHidemenu.translatesAutoresizingMaskIntoConstraints = NO;

    NSArray *horizontal = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[btnHidemenu]-0-|" options:0 metrics:@{} views:NSDictionaryOfVariableBindings(btnHidemenu)];
    NSArray *vertical = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[btnHidemenu]-0-|" options:0 metrics:@{} views:NSDictionaryOfVariableBindings(btnHidemenu)];
    [self.view addConstraints:horizontal];
    [self.view  addConstraints:vertical];


    [menuBgView setHidden:YES];
    
    
    menuView = [[MenuView alloc] init];
    [self.view addSubview:menuView];
    
    menuView.translatesAutoresizingMaskIntoConstraints = NO;

    left = [NSLayoutConstraint constraintWithItem:menuView
                                                            attribute:NSLayoutAttributeLeft
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.view
                                                            attribute:NSLayoutAttributeLeft
                                                           multiplier:1
                                                             constant:-300];
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:menuView
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier:1
                                                            constant:0];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:menuView
                                                              attribute:NSLayoutAttributeBottom
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.view
                                                              attribute:NSLayoutAttributeBottom
                                                             multiplier:1
                                                               constant:0];
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:menuView
                                                             attribute:NSLayoutAttributeWidth
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:nil
                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                            multiplier:1
                                                              constant:300];
    
    [self.view addConstraint:top];
    [self.view  addConstraint:bottom];
    [self.view addConstraint:left];
    [self.view addConstraint:width];

}

- (void)showMenu {

    left.constant = 0.0;
    [menuBgView setHidden:NO];
    [UIView animateWithDuration:0.50 animations:^{
        [self.view updateConstraintsIfNeeded];
        [self.view layoutIfNeeded];
        
    }];
    
}

- (void)hideMenu {
    left.constant = -300.0;
    
    [UIView animateWithDuration:0.50 animations:^{
        [self.view updateConstraintsIfNeeded];
        [self.view layoutIfNeeded];

    } completion:^(BOOL finished) {
        [menuBgView setHidden:YES];
    }];
}

@end
