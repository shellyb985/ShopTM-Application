//
//  NormalOfferTableViewCell.h
//  ShopTM Application
//
//  Created by Shelly Pritchard on 14/06/17.
//  Copyright © 2017 SPB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NormalOfferCollectionViewCell.h"

@interface NormalOfferTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *lblOffer;
@property (weak, nonatomic) IBOutlet UICollectionView *offerCollectionView;

@end
