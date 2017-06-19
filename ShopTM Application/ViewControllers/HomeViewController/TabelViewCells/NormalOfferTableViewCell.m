//
//  NormalOfferTableViewCell.m
//  ShopTM Application
//
//  Created by Shelly Pritchard on 14/06/17.
//  Copyright © 2017 SPB. All rights reserved.
//

#import "NormalOfferTableViewCell.h"

@implementation NormalOfferTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    UINib *featureNib = [UINib nibWithNibName:@"NormalOfferCollectionViewCell" bundle:nil];
    [self.offerCollectionView registerNib:featureNib forCellWithReuseIdentifier:@"NormalOfferCollectionViewCell"];
    
    UICollectionViewFlowLayout *collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    [collectionViewFlowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    collectionViewFlowLayout.itemSize = CGSizeMake(240.0, 100.0);
    
    self.offerCollectionView.collectionViewLayout = collectionViewFlowLayout;
    
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
