//
//  HFNetworkManager.m
//  HFSDK
//
//  Created by HeartlessSoy on 2019/4/18.
//  Copyright © 2019 HeartlessSoy. All rights reserved.
//

#import "HFNetworkManager.h"
#import "AFNetworking.h"

static HFNetworkManager *sharedManager = nil;

@interface HFNetworkManager ()
@property (nonatomic,strong)AFHTTPSessionManager *sessionManager;

@end

@implementation HFNetworkManager
+ (instancetype)sharedManager{
    if (!sharedManager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            sharedManager = [[HFNetworkManager alloc]init];
        });
    }
    return sharedManager;
}

-(AFHTTPSessionManager *)sessionManager {
    if (!_sessionManager) {
        _sessionManager = [[AFHTTPSessionManager alloc]init];
        _sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        [_sessionManager.requestSerializer setTimeoutInterval:15];
        _sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"text/html", @"application/json",@"text/javascript", nil];
    }
    return _sessionManager;
}


@end
