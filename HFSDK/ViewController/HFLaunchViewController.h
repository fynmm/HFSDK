//
//  HFLaunchViewController.h
//  HFSDK
//
//  Created by HeartlessSoy on 2019/4/18.
//  Copyright © 2019 HeartlessSoy. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol HFLaunchViewControllerDelegate <NSObject>

- (void)showNormal;

@end

NS_ASSUME_NONNULL_BEGIN

@interface HFLaunchViewController : UIViewController

- (instancetype)initWithImage:(UIImage*)image;
@property (nonatomic, assign)id<HFLaunchViewControllerDelegate> delegate;


@end

NS_ASSUME_NONNULL_END
