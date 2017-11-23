//  weibo: http://weibo.com/xiaoqing28
//  blog:  http://www.alonemonkey.com
//
//  DingTalkDylib.m
//  DingTalkDylib
//
//  Created by admin on 2017/9/26.
//  Copyright (c) 2017年 ahaschool. All rights reserved.
//

#import "DingTalkDylib.h"
#import "CaptainHook.h"
#import <UIKit/UIKit.h>
#import <Cycript/Cycript.h>
#import <CoreLocation/CoreLocation.h>

#import "DTGPSButton.h"
static __attribute__((constructor)) void entry(){
    NSLog(@"\n               🎉!!！congratulations!!！🎉\n👍----------------insert dylib success----------------👍");
    
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        
        static dispatch_once_t onceToken_setting;
        dispatch_once(&onceToken_setting, ^{
            CGRect bounds = [UIScreen mainScreen].bounds;
            // 在Window最上层添加一个位置设置按钮
            UIWindow *window = [[UIApplication sharedApplication] keyWindow];
            UIViewController *rootViewController = window.rootViewController;
            DTGPSButton *button = [DTGPSButton sharedInstance];
            button.frame = CGRectMake(bounds.size.width - 39 - 15, bounds.size.height - 100, 40, 40);
            [rootViewController.view addSubview:button];
        });
        
        CYListenServer(6666);
    }];
}

//*

CHDeclareClass(CLLocation);

CHOptimizedMethod0(self, CLLocationCoordinate2D, CLLocation, coordinate){
    CLLocationCoordinate2D coordinate = CHSuper(0, CLLocation, coordinate);
    id LONGITUDE = [[NSUserDefaults standardUserDefaults]valueForKey:@"JF_GPS_LONGITUDE"];
    id LATITUDE = [[NSUserDefaults standardUserDefaults]valueForKey:@"JF_GPS_LATITUDE"];
    if (LONGITUDE && LATITUDE) {
        coordinate = CLLocationCoordinate2DMake([LATITUDE floatValue], [LONGITUDE floatValue]);
    }
    return coordinate;
}

CHConstructor{
    CHLoadLateClass(CLLocation);
    CHClassHook(0, CLLocation, coordinate);
}
