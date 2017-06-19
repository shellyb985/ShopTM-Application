//
//  FeatureTableViewCell.m
//  ShopTM Application
//
//  Created by Shelly Pritchard on 14/06/17.
//  Copyright © 2017 SPB. All rights reserved.
//

#import "FeatureTableViewCell.h"

@implementation FeatureTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    UINib *featureNib = [UINib nibWithNibName:@"FeatureCollectionViewCell" bundle:nil];
    [self.featureCollectionView registerNib:featureNib forCellWithReuseIdentifier:@"FeatureCollectionViewCell"];
    
    UICollectionViewFlowLayout *collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    [collectionViewFlowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    collectionViewFlowLayout.itemSize = CGSizeMake(70.0, 100.0);
    
    self.featureCollectionView.collectionViewLayout = collectionViewFlowLayout;
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
