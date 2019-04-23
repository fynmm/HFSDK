//
//  UIView+HFScreen.h
//  HFSDK
//
//  Created by HeartlessSoy on 2019/4/18.
//  Copyright © 2019 HeartlessSoy. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (HFScreen)
/**
 *  屏幕宽度
 */
+ (CGFloat)hf_screen_width;
/**
 *  屏幕g高度
 */
+(CGFloat)hf_screen_height;

/**
 *  @params text    显示的文本
 */
- (void)showLoadingWithText:(nullable NSString*)text;
/**
 *  @params view    在view上显示,nil时显示在当前view上
 *  @params text    显示的文本
 */
- (void)showLoadingInView:(UIView*)view text:(nullable NSString*)text;

/**
 *  隐藏当前View的hud
 */
- (void)hiddenHud;

/**
 *  隐藏某个view的hud
 */
- (void)hiddenHudInView:(UIView*)view;


+ (UIWindow*)mainWindow;

+ (void)setRootViewController:(UIViewController*)vc;
@end

NS_ASSUME_NONNULL_END
