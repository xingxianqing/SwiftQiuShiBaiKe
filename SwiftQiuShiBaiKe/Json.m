//
//  Json.m
//  SwiftQiuShiBaiKe
//
//  Created by 邢现庆 on 15-2-14.
//  Copyright (c) 2015年 邢现庆. All rights reserved.
//

#import "Json.h"
#import "ObjectModel.h"
@implementation Json
+(NSMutableArray*)jsonData:(NSDictionary*)result{
    NSMutableArray* array = [NSMutableArray array];
    NSArray* items = [result objectForKey:@"items"];
    
    for (NSDictionary* dic in items) {
        ObjectModel* model = [[ObjectModel alloc]init];
        NSDictionary* d = [dic objectForKey:@"user"];
        NSLog(@"%@",d);
        if ([d isKindOfClass:[NSNull class]]) {
            model.name = @"匿名";

        }else{
            model.name = [d objectForKey:@"login"];
        }
        
        model.content = [dic objectForKey:@"content"];
        [array addObject:model];
    }
    
    return array;
}
@end
