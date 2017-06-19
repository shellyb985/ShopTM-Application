//
//  UpdateViewController.m
//  ShopTM Application
//
//  Created by Shelly Pritchard on 17/06/17.
//  Copyright © 2017 SPB. All rights reserved.
//

#import "UpdateViewController.h"

@interface UpdateViewController ()

@end

@implementation UpdateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.updateTableView.estimatedRowHeight = 140;
    self.updateTableView.rowHeight = UITableViewAutomaticDimension;
    self.updateTableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    
    UINib *updateCellNib = [UINib nibWithNibName:@"UpdateTableViewCell" bundle:nil];
    [self.updateTableView registerNib:updateCellNib forCellReuseIdentifier:@"UpdateTableViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return 1;
 }
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"UpdateTableViewCell";
    UpdateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UpdateTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}

@end
