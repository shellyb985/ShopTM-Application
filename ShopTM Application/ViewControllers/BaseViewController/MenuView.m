//
//  MenuView.m
//  ShopTM Application
//
//  Created by Shelly Pritchard on 18/06/17.
//  Copyright © 2017 SPB. All rights reserved.
//

#import "MenuView.h"
#import "Utility.h"
#import "MenuTableViewCell.h"

@implementation MenuView {
    NSArray *arrMenus;
    NSArray *arrSubMenu;
    BOOL subCategory;
    NSInteger selectedIndex;
}


- (id)init {
    
    self = [super init];
    if (self) {
        
        UINib *nib = [UINib nibWithNibName:@"MenuView" bundle:nil];
        self = [[nib instantiateWithOwner:self options:nil] objectAtIndex:0];
        nib = nil;

        [self getMenuList];
        [self.btnBack setHidden:YES];

        [self.menuTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [self.menuTableView setDelegate:self];
        [self.menuTableView setDataSource:self];
        
        UINib *menuNib = [UINib nibWithNibName:@"MenuTableViewCell" bundle:nil];
        [self.menuTableView registerNib:menuNib forCellReuseIdentifier:@"MenuTableViewCell"];
    }
    
    return self;
}

- (void)getMenuList {
    NSDictionary *menuDict = [Utility getDataFromStaticJson:@"MenuList"];
    arrMenus = [NSArray arrayWithArray:[menuDict objectForKey:@"MenuList"]];
}





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (subCategory) {
        return arrSubMenu.count;
    }
    else {
        return arrMenus.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *menuDict;
    NSArray *item;
    
    if (!subCategory) {
        menuDict = [arrMenus objectAtIndex:indexPath.row];
        item = [menuDict objectForKey:@"item"];

    }

    
    MenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuTableViewCell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[MenuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MenuTableViewCell"];
    }
    
    if (subCategory) {
        [cell.lblMenuName setText:[arrSubMenu objectAtIndex:indexPath.row]];
        [cell.lblOffer setText:@""];
        [cell.imgRightArrow setHidden:YES];

    }
    else {
        [cell.lblMenuName setText:[menuDict objectForKey:@"name"]];
        [cell.lblOffer setText:[menuDict objectForKey:@"offercode"]];
        
        if (item.count > 0) {
            [cell.imgRightArrow setHidden:NO];
        }
        else {
            [cell.imgRightArrow setHidden:YES];
        }

    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (subCategory) {
        
    }
    else {
        NSDictionary *menuDict = [arrMenus objectAtIndex:indexPath.row];
        NSArray *item = [menuDict objectForKey:@"item"];
        if (item.count > 0) {
            arrSubMenu = nil;
            arrSubMenu = [NSArray arrayWithArray:item];
            subCategory = YES;
            [self.btnBack setHidden:NO];
            [self.menuTableView reloadData];
            
        }

    }
    
    
}
- (IBAction)onClickBackButton:(id)sender {
    subCategory = NO;
    arrSubMenu = nil;
    [self.btnBack setHidden:YES];
    [self.menuTableView reloadData];
    
}
@end
