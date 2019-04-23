//
//  UIView+HFScreen.m
//  HFSDK
//
//  Created by HeartlessSoy on 2019/4/18.
//  Copyright © 2019 HeartlessSoy. All rights reserved.
//

#import "UIView+HFScreen.h"
#import "MBProgressHUD.h"

@implementation UIView (HFScreen)
+(CGFloat)hf_screen_width {
    return [UIScreen mainScreen].bounds.size.width;
}
+(CGFloat)hf_screen_height {
    return [UIScreen mainScreen].bounds.size.height;
}
- (void)showLoadingWithText:(nullable NSString*)text {
    [self showLoadingInView:self text:text];
}
-(void)showLoadingInView:(UIView*)view text:(nullable NSString*)text{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:true];
    if (text.length>0) {
        hud.label.text = text;
    }
}
- (void)hiddenHud{
    [self hiddenHudInView:self];
}
- (void)hiddenHudInView:(UIView *)view{
    [MBProgressHUD hideHUDForView:view animated:true];
}
+(UIWindow *)mainWindow {
    UIApplication *app = [UIApplication sharedApplication];
    UIWindow *window;
    if ([app.delegate respondsToSelector:@selector(window)]) {
        window = [app.delegate window];
    }else {
        window = [app keyWindow];
    }
    if (!window) {
        window = [[UIWindow alloc]initWithFrame:CGRectMake(0, 0, [self hf_screen_width], [self hf_screen_height])];
        window.backgroundColor = [UIColor whiteColor];
    }
    return window;
}
+ (void)setRootViewController:(UIViewController*)vc {
    UIWindow *window = [self mainWindow];
    window.rootViewController = vc;
    [window makeKeyAndVisible];
}
@end
