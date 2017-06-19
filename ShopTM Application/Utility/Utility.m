//
//  Utility.m
//  ShopTM Application
//
//  Created by Shelly Pritchard on 13/06/17.
//  Copyright © 2017 SPB. All rights reserved.
//

#import "Utility.h"

@implementation Utility


+(NSDictionary *)getDataFromStaticJson:(NSString *)jsonFileName
{
    NSString* path  = [[NSBundle mainBundle] pathForResource:jsonFileName ofType:@"json"];
    
    NSString* jsonString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *jsonError;
    NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&jsonError];
    
    return jsonResponse;
}

@end
