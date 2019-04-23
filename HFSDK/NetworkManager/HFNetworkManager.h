//
//  HFNetworkManager.h
//  HFSDK
//
//  Created by HeartlessSoy on 2019/4/18.
//  Copyright © 2019 HeartlessSoy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HFNetworkManager : NSObject
+ (instancetype)sharedManager;
//- (void)setBaseUrl:(NSString*)url;
@end

NS_ASSUME_NONNULL_END
