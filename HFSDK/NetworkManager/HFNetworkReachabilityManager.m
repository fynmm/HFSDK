//
//  HFNetworkReachabilityManager.m
//  HFSDK
//
//  Created by HeartlessSoy on 2019/4/18.
//  Copyright © 2019 HeartlessSoy. All rights reserved.
//

#import "HFNetworkReachabilityManager.h"
#import "AFNetworking.h"


@interface HFNetworkReachabilityManager ()
@property (nonatomic, assign)BOOL isStart;
@property (nonatomic, strong)AFNetworkReachabilityManager *manager;
@end


@implementation HFNetworkReachabilityManager

-(instancetype)init {
    
    if (self = [super init]) {
        self.manager = [AFNetworkReachabilityManager sharedManager];
    }
    return self;
}
- (void)start {
    if (self.isStart) {
        return;
    }
    self.isStart = true;
    [_manager addObserver:self forKeyPath:@"networkReachabilityStatus" options:NSKeyValueObservingOptionNew context:nil ];
    [self.manager startMonitoring];
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"networkReachabilityStatus"]) {
        if (self.manager.isReachable) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(monitorReachable)]) {
                [self.delegate monitorReachable];
            }
        }
    }
    
}
- (void)dealloc {
    if (self.isStart) {
         [_manager removeObserver:self forKeyPath:@"networkReachabilityStatus"];
    }
    if (self.manager) {
        [self.manager stopMonitoring];
    }
}

@end
