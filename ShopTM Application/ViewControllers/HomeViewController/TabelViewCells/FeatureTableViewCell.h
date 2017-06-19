//
//  FeatureTableViewCell.h
//  ShopTM Application
//
//  Created by Shelly Pritchard on 14/06/17.
//  Copyright © 2017 SPB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeatureCollectionViewCell.h"

@interface FeatureTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UICollectionView *featureCollectionView;
@property (weak, nonatomic) IBOutlet UIView *vwBackground;




@end
