//
//  FeatureCollectionViewCell.h
//  ShopTM Application
//
//  Created by Shelly Pritchard on 16/06/17.
//  Copyright © 2017 SPB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeatureCollectionViewCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet UILabel *lblFeatureName;
@property (weak, nonatomic) IBOutlet UILabel *lblOffer;
@property (weak, nonatomic) IBOutlet UIImageView *imgFeatureIcon;

@end
