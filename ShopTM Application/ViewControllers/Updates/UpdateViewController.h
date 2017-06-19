//
//  UpdateViewController.h
//  ShopTM Application
//
//  Created by Shelly Pritchard on 17/06/17.
//  Copyright © 2017 SPB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UpdateTableViewCell.h"

@interface UpdateViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *updateTableView;

@end
