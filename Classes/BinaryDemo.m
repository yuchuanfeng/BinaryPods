//
//  BinaryDemo.m
//  BinaryPods
//
//  Created by Yu,Chuanfeng on 2020/2/3.
//

#import "BinaryDemo.h"
#import <AFNetworking.h>


@implementation BinaryDemo
+ (void)load {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self execTask];
    });
}

+ (void)execTask {
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer =  [AFHTTPResponseSerializer serializer];
    NSString *url = @"https://www.baidu.com/";
    [sessionManager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"sessionManager success!!!");
        NSLog(@"%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"sessionManager failure!!!");
    }];
}

@end
