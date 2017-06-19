//
//  HomeViewController.h
//  ShopTM Application
//
//  Created by Shelly Pritchard on 11/06/17.
//  Copyright © 2017 SPB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "Utility.h"

#import "FeatureTableViewCell.h"
#import "MainOfferTableViewCell.h"
#import "NormalOfferTableViewCell.h"
#import "ShoppingTableViewCell.h"

#import "FeatureCollectionViewCell.h"
#import "MainOfferCollectionViewCell.h"
#import "NormalOfferCollectionViewCell.h"
#import "ShoppingCollectionViewCell.h"
#import "HomeFooterView.h"

#import "TableViewFooterCell.h"

@interface HomeViewController : BaseViewController<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *ContentTabelView;
@property (weak, nonatomic) IBOutlet UIButton *btnMenu;

- (IBAction)onClickBackbutton:(UIButton *)sender;

@end
