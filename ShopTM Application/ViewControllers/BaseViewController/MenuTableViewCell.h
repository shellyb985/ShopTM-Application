//
//  MenuTableViewCell.h
//  ShopTM Application
//
//  Created by Shelly Pritchard on 18/06/17.
//  Copyright © 2017 SPB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblMenuName;
@property (weak, nonatomic) IBOutlet UILabel *lblOffer;
@property (weak, nonatomic) IBOutlet UIImageView *imgRightArrow;

@end
