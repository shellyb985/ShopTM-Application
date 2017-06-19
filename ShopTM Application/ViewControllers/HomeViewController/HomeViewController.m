//
//  HomeViewController.m
//  ShopTM Application
//
//  Created by Shelly Pritchard on 11/06/17.
//  Copyright © 2017 SPB. All rights reserved.
//

#import "HomeViewController.h"
#define RBG_COLOR(X,Y,Z,A) [UIColor colorWithRed:X/255.0 green:Y/255.0 blue:Z/255.0 alpha:A]

#define TRAVEL @"Travel"
#define UTILITY @"Utility"
#define RECHARGE @"Recharge"
#define ENTERTAINMENT @"Entertainment"
#define PAYWITHPAYTM @"Pay With Paytm"
#define GIFTCARD @"Gift Cards"

#define FEATURE @"feature"
#define MAINOFFER @"mainoffer"
#define NORMALOFFER @"normaloffer"
#define SHOPING @"shopping"

@interface HomeViewController () {
    
    NSArray *arrBankFunction;
    NSArray *arrRechargeItem;
    NSArray *arrBookingItem;
    NSArray *arrMallCategory;
    NSArray *arrMallPromotion;
    NSDictionary *dictOffer;
    
    NSDictionary *mainJson;
    NSArray *arrMainContent;
}

@end

@implementation HomeViewController
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/
- (void)viewDidLoad {
    [super viewDidLoad];

    
    UINib *banfFunctionNib = [UINib nibWithNibName:@"BankFunctionTableViewCell" bundle:nil];
    [self.ContentTabelView registerNib:banfFunctionNib forCellReuseIdentifier:@"BankFunctionTableViewCell"];
    
    self.ContentTabelView.estimatedRowHeight = 140;
    self.ContentTabelView.rowHeight = UITableViewAutomaticDimension;
    self.ContentTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    
    UINib *featureNib = [UINib nibWithNibName:@"FeatureTableViewCell" bundle:nil];
    UINib *normalOfferNib = [UINib nibWithNibName:@"NormalOfferTableViewCell" bundle:nil];
    UINib *mainOfferNib = [UINib nibWithNibName:@"MainOfferTableViewCell" bundle:nil];
    UINib *shopingNib = [UINib nibWithNibName:@"ShoppingTableViewCell" bundle:nil];
    UINib *footer = [UINib nibWithNibName:@"TableViewFooterCell" bundle:nil];
    
    [self.ContentTabelView registerNib:featureNib forCellReuseIdentifier:@"FeatureTableViewCell"];
    [self.ContentTabelView registerNib:normalOfferNib forCellReuseIdentifier:@"NormalOfferTableViewCell"];
    [self.ContentTabelView registerNib:mainOfferNib forCellReuseIdentifier:@"MainOfferTableViewCell"];
    [self.ContentTabelView registerNib:shopingNib forCellReuseIdentifier:@"ShoppingTableViewCell"];
    [self.ContentTabelView registerNib:footer forCellReuseIdentifier:@"TableViewFooterCell"];
    
    [self.btnMenu addTarget:self action:@selector(showSideMenu) forControlEvents:UIControlEventTouchUpInside];

    
    [self getMainJson];
    
    [self.view updateConstraintsIfNeeded];
    [self.view layoutIfNeeded];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-
- (void)getMainJson {
    mainJson = [Utility getDataFromStaticJson:@"Main"];
    arrMainContent = [mainJson objectForKey:@"mainJson"];
}

- (void)showSideMenu {
    [self showMenu];
}

#pragma mark- UIATableView Datasource and delegates
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arrMainContent.count+1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == arrMainContent.count) {
        static NSString *identifier = @"TableViewFooterCell";
        TableViewFooterCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[TableViewFooterCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        return cell;

    }
    
    NSDictionary *contentDict = [arrMainContent objectAtIndex:indexPath.row];
    NSLog(@"%@",[contentDict objectForKey:@"type"]);
    if ([[contentDict objectForKey:@"type"] isEqualToString:FEATURE]) {
        static NSString *identifier = @"FeatureTableViewCell";
        FeatureTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[FeatureTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        [cell.lblTitle setText:[contentDict objectForKey:@"title"]];
        
        [cell.featureCollectionView setTag:indexPath.row];
        [cell.featureCollectionView setDataSource:self];
        [cell.featureCollectionView setDelegate:self];
        [cell.featureCollectionView reloadData];
        if (indexPath.row == 0) {
            [cell.vwBackground setBackgroundColor:RBG_COLOR(2.0, 33.0, 172.0, 1.0)];
            [cell.lblTitle setTextColor:[UIColor whiteColor]];
        }
        else {
            [cell.vwBackground setBackgroundColor:RBG_COLOR(255.0, 255.0, 255.0, 1.0)];
            [cell.lblTitle setTextColor:[UIColor blackColor]];
        }
        
        return cell;
    }
    else if ([[contentDict objectForKey:@"type"] isEqualToString:MAINOFFER]) {
        static NSString *identifier = @"MainOfferTableViewCell";
        MainOfferTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[MainOfferTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        
        [cell.offerCollectionView setTag:indexPath.row];
        [cell.offerCollectionView setDataSource:self];
        [cell.offerCollectionView setDelegate:self];

        return cell;
        
    }
    else if ([[contentDict objectForKey:@"type"] isEqualToString:NORMALOFFER]) {
        static NSString *identifier = @"NormalOfferTableViewCell";
        NormalOfferTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[NormalOfferTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        
        [cell.lblOffer setText:[contentDict objectForKey:@"title"]];
        [cell.offerCollectionView setTag:indexPath.row];
        [cell.offerCollectionView setDataSource:self];
        [cell.offerCollectionView setDelegate:self];

        
        return cell;
        
    }
    else {
        static NSString *identifier = @"ShoppingTableViewCell";
        ShoppingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[ShoppingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        return cell;

    }

    
    
}


#pragma mark- CollectionView DataSource and Delegate Method
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    NSDictionary *contentDict = [arrMainContent objectAtIndex:collectionView.tag];
    NSArray *arrData = [contentDict objectForKey:@"content"];
    NSDictionary *data = [arrData objectAtIndex:indexPath.row];
    
    if ([[contentDict objectForKey:@"type"] isEqualToString:FEATURE]) {
        static NSString *identifier = @"FeatureCollectionViewCell";
        FeatureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[FeatureCollectionViewCell alloc] init];
        }
        
        [cell.lblFeatureName setText:[data objectForKey:@"id"]];
        [cell.imgFeatureIcon setImage:[UIImage imageNamed:[data objectForKey:@"image"]]];
        [cell.lblOffer setText:[data objectForKey:@"couponCode"]];
        
        if (collectionView.tag == 0) {
            [cell.lblFeatureName setTextColor:[UIColor whiteColor]];
            [cell.lblOffer setTextColor:[UIColor whiteColor]];
        }
        else {
            [cell.lblFeatureName setTextColor:[UIColor blackColor]];
            [cell.lblOffer setTextColor:[UIColor blackColor]];
        }
        
        
        return cell;
    }
    else if ([[contentDict objectForKey:@"type"] isEqualToString:MAINOFFER]) {
        static NSString *identifier = @"MainOfferCollectionViewCell";
        MainOfferCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[MainOfferCollectionViewCell alloc] init];
        }
        [cell.activityIndicator setHidden:NO];
        [cell.activityIndicator startAnimating];

        NSURL *imageURL = [NSURL URLWithString:[arrData objectAtIndex:indexPath.row]];
        NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            [cell.activityIndicator setHidden:YES];
            [cell.activityIndicator stopAnimating];
            
            if (data) {
                UIImage *image = [UIImage imageWithData:data];
                if (image) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [cell.activityIndicator stopAnimating];
                        [cell.activityIndicator setHidden:YES];

                        if (cell) {
                            [cell.imgOffer setImage:image];
                        }
                        
                    });
                }
            }
        }];
        [task resume];
        
        return cell;
        
    }
    else if ([[contentDict objectForKey:@"type"] isEqualToString:NORMALOFFER]) {
        static NSString *identifier = @"NormalOfferCollectionViewCell";
        NormalOfferCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[NormalOfferCollectionViewCell alloc] init];
        }

        [cell.activityIndicator setHidden:NO];
        [cell.activityIndicator startAnimating];

        NSURL *imageURL = [NSURL URLWithString:[arrData objectAtIndex:indexPath.row]];
        NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

            if (data) {
                UIImage *image = [UIImage imageWithData:data];
                if (image) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [cell.activityIndicator stopAnimating];
                        [cell.activityIndicator setHidden:YES];

                        if (cell) {
                            [cell.imgOffer setImage:image];
                        }
                            
                    });
                }
            }
        }];
        [task resume];
        
        return cell;
        
        
    }
    else {
        static NSString *identifier = @"ShoppingCollectionViewCell";
        ShoppingCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[ShoppingCollectionViewCell alloc] init];
        }
        
        return cell;
        
    }
    
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSDictionary *contentDict = [arrMainContent objectAtIndex:collectionView.tag];
    NSArray *arr = [contentDict objectForKey:@"content"];
    
    return arr.count;
}




- (IBAction)onClickBackbutton:(UIButton *)sender {
}
@end
