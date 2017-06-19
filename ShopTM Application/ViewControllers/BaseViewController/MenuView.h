//
//  MenuView.h
//  ShopTM Application
//
//  Created by Shelly Pritchard on 18/06/17.
//  Copyright © 2017 SPB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuView : UIView<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *btnBack;
@property (weak, nonatomic) IBOutlet UITableView *menuTableView;

- (IBAction)onClickBackButton:(id)sender;
@end
