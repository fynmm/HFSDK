//
//  HFLaunchViewController.m
//  HFSDK
//
//  Created by HeartlessSoy on 2019/4/18.
//  Copyright © 2019 HeartlessSoy. All rights reserved.
//

#import "HFLaunchViewController.h"
#import "UIView+HFScreen.h"
#import "HFNetworkReachabilityManager.h"
#import "AVOSCloud.h"
#import "HFWebViewController.h"


@interface HFLaunchViewController ()<HFNetworkReachabilityManagerDelegate>
@property (nonatomic,strong)UIImageView *imageV;
@property (nonatomic,strong)UIImage *launchImage;
@property (nonatomic, strong)HFNetworkReachabilityManager *manager;
@end

@implementation HFLaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageV = [[UIImageView alloc]initWithImage:self.launchImage];
    _imageV.frame = CGRectMake(0, 0, [UIView hf_screen_width], [UIView hf_screen_height]);
    [self.view addSubview:_imageV];
    [self.view showLoadingWithText:nil];
    [self.manager start];
    
    // Do any additional setup after loading the view.
}

-(instancetype)initWithImage:(UIImage *)image {
    if (self = [super init]) {
        self.launchImage = image;
    }
    return self;
}
-(HFNetworkReachabilityManager *)manager {
    if (!_manager) {
        _manager = [[HFNetworkReachabilityManager alloc]init];
        _manager.delegate = self;
    }
    return _manager;
}


#pragma arguments
- (void)action_AVOSCloud {
    AVQuery *query = [AVQuery queryWithClassName:@"Config"];
    [query orderByDescending:@"updatedAt"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        NSArray <AVObject*>*Configs = objects;
        [AVObject saveAllInBackground:Configs block:^(BOOL succeeded, NSError * _Nullable error) {
            if (error) {

            } else {
                NSString *bundle = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"];
                NSLog(@"bundle:   %@",bundle);
                BOOL have = false;
                for (AVObject *item in Configs) {
                    NSLog(@"updateAt  %@",item[@"updatedAt"]);
                    NSString *appId = item[@"appId"];
                    id s = item[@"show"];
                    if (s) {
                        BOOL show = [s boolValue];
                        if ([appId isEqualToString:bundle]) {
                            have = true;
                            if (show) {
                                HFWebViewController *vc = [[HFWebViewController alloc]init];
                                vc.url = item[@"url"];
                                vc.appId = item[@"desc"];
                                [UIView setRootViewController:vc];

                            }else {
                                if (self.delegate&& [self.delegate respondsToSelector:@selector(showNormal)]) {
                                    [self.delegate showNormal];
                                }
                            }
                            break;
                        }
                    } else {
                        break;
                    }

                }
                if (!have) {
                    if (self.delegate&& [self.delegate respondsToSelector:@selector(showNormal)]) {
                        [self.delegate showNormal];
                    }
                }

            }
        }];



    }];
}



#pragma HFNetworkReachabilityManagerDelegate
- (void)monitorReachable {
    [self.view hiddenHud];
    [self action_AVOSCloud];
}


@end
