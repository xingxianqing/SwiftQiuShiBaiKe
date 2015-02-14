//
//  OCHttpRequest.h
//  SwiftQiuShiBaiKe
//
//  Created by 邢现庆 on 15-2-14.
//  Copyright (c) 2015年 邢现庆. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^RequestFinishBlock)(id result);

@interface OCHttpRequest : NSObject

//get请求
+(void)requestGetByURL:(NSString*)url andBlock:(RequestFinishBlock)callback;
@end
