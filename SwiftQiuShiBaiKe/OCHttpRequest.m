//
//  OCHttpRequest.m
//  SwiftQiuShiBaiKe
//
//  Created by 邢现庆 on 15-2-14.
//  Copyright (c) 2015年 邢现庆. All rights reserved.
//

#import "OCHttpRequest.h"

@implementation OCHttpRequest
//get
+(void)requestGetByURL:(NSString*)url andBlock:(RequestFinishBlock)callback{
    NSMutableURLRequest* request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:Nil];
        
        callback(dic);
    }];
    [task resume];
}

@end
