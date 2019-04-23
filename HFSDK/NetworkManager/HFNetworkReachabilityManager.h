//
//  HFNetworkReachabilityManager.h
//  HFSDK
//
//  Created by HeartlessSoy on 2019/4/18.
//  Copyright © 2019 HeartlessSoy. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol HFNetworkReachabilityManagerDelegate <NSObject>
@optional
- (void)monitorReachable;

@end

NS_ASSUME_NONNULL_BEGIN

@interface HFNetworkReachabilityManager : NSObject
@property (nonatomic, weak)id<HFNetworkReachabilityManagerDelegate> delegate;
/**
 *  开始检测网络
 */
- (void)start;
@end

NS_ASSUME_NONNULL_END
