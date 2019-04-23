//
//  AppDelegate.m
//  HFSDK-Test
//
//  Created by HeartlessSoy on 2019/4/23.
//  Copyright © 2019 HeartlessSoy. All rights reserved.
//

#import "AppDelegate.h"
#import <HFSDK/HFSDK.h>
#import "AAAViewController.h"
#import "AVOSCloud.h"

@interface AppDelegate ()<HFLaunchViewControllerDelegate>

@end

@implementation AppDelegate

-(void)showNormal {
    [UIView setRootViewController:[AAAViewController new]];
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [AVOSCloud setApplicationId:@"avlpD5ocmkwsXT8q4J837FmW-gzGzoHsz" clientKey:@"bD2yvxHHC3Eo5rGkk5e5nSb3"];
    NSString *imageName = @"Default-Port-hd47";
    if ([UIView hf_screen_width] > 375) {
        imageName = @"Default-Port-hd55";
    }
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    HFLaunchViewController *vc = [[HFLaunchViewController alloc]initWithImage:[UIImage imageNamed:imageName]];
    vc.delegate = self;
    [UIView setRootViewController:vc];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
