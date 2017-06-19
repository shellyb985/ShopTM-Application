//
//  MainOfferTableViewCell.h
//  ShopTM Application
//
//  Created by Shelly Pritchard on 14/06/17.
//  Copyright © 2017 SPB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainOfferCollectionViewCell.h"

@interface MainOfferTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UICollectionView *offerCollectionView;

@end
