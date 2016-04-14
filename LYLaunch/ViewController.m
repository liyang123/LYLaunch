//
//  ViewController.m
//  LYLaunch
//
//  Created by liyang on 16/4/14.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIViewController *viewController = [[UIStoryboard storyboardWithName:@"LaunchScreen" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"LaunchScreen"];
    UIView *launchView = viewController.view;
    UIImageView  * Imageview= [[UIImageView  alloc]initWithFrame:[UIScreen mainScreen].bounds];
    Imageview.image = [UIImage imageNamed:@"baidu2"];
    [launchView addSubview:Imageview];
    [self.view addSubview:launchView];
    
    
    [UIView animateWithDuration:6.0f delay:0.0f options:UIViewAnimationOptionBeginFromCurrentState animations:^{
//        launchView.layer.transform = CATransform3DRotate(CATransform3DIdentity, M_PI_4, 1.5f, 1.5f, 1.5f);
        launchView.transform = CGAffineTransformMakeTranslation(0.0f, 0.1f);
    } completion:^(BOOL finished) {
        
        UIImageView *imgViewAd = [[UIImageView alloc] init];
        imgViewAd.frame = [UIScreen mainScreen].bounds;
        imgViewAd.image = [UIImage imageNamed:@"me"];
        [[UIApplication sharedApplication].keyWindow addSubview:imgViewAd];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:.25
                             animations:^{
                                 imgViewAd.alpha = 0.0f;
                             }
                             completion:^(BOOL finished) {
                                 [imgViewAd removeFromSuperview];
                             }];
        });
        [launchView removeFromSuperview];
    }];
    
}

















@end
