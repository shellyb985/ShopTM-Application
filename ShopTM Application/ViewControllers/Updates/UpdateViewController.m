//
//  UpdateViewController.m
//  ShopTM Application
//
//  Created by Shelly Pritchard on 17/06/17.
//  Copyright © 2017 SPB. All rights reserved.
//

#import "UpdateViewController.h"
#import "Utility.h"

@interface UpdateViewController () {
    NSArray *arrUpdates;
}

@end

@implementation UpdateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.updateTableView.estimatedRowHeight = 140;
    self.updateTableView.rowHeight = UITableViewAutomaticDimension;
    self.updateTableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self getLatestUpdates];
    
    UINib *updateCellNib = [UINib nibWithNibName:@"UpdateTableViewCell" bundle:nil];
    [self.updateTableView registerNib:updateCellNib forCellReuseIdentifier:@"UpdateTableViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getLatestUpdates {
    NSDictionary *dict = [Utility getDataFromStaticJson:@"Update"];
    arrUpdates = [dict objectForKey:@"update"];
}

#pragma mark -
 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return arrUpdates.count;
 }
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"UpdateTableViewCell";
    UpdateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    NSDictionary *updateDict = [arrUpdates objectAtIndex:indexPath.row];
    if (cell == nil) {
        cell = [[UpdateTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    if ([[updateDict objectForKey:@"type"] isEqualToString:@"info"]) {
        [cell.imgUpdateIcon setImage:[UIImage imageNamed:@"Info_Uicon"]];
    }
    else {
        [cell.imgUpdateIcon setImage:[UIImage imageNamed:@"Offer_Uicon"]];
    }
    
    
    [cell.lblTitle setText:[updateDict objectForKey:@"name"]];
    [cell.lblDetail setText:[updateDict objectForKey:@"detail"]];
    [cell.lblTime setText:[updateDict objectForKey:@"time"]];
    
    return cell;
}

@end
