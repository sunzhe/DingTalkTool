//
//  DTWifiSettingViewController.m
//  DD
//
//  Created by admin on 2017/9/8.
//  Copyright © 2017年 ahaschool. All rights reserved.
//

#import "DTWifiSettingViewController.h"
#import <SystemConfiguration/SCNetworkReachability.h>

@interface DTWifiSettingViewController ()

@property (nonatomic, strong)DTWifiModel *currentWifi;
@end

@implementation DTWifiSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
- (void)fetchCurrentWifi {
    
    [_currentWifi.array removeAllObjects];
    
    CFArrayRef arrayRef = CNCopySupportedInterfaces();
    NSArray *ifs = (__bridge_transfer NSArray *)arrayRef;
    
    if(ifs && [ifs count] > 0) {
        
        NSString *ifnam = [ifs objectAtIndex:0];
        
        CFDictionaryRef info = CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        
        NSDictionary *dictionary = (__bridge_transfer NSDictionary *)info;
        
        if (dictionary && [dictionary count]) {
            
            DTWifiModel *wifi = [[DTWifiModel alloc] initWith:ifnam dictionary:dictionary];
            
            wifi.flags = [self fetchCurrentNetworkStatus];
            
            //[_currentWifi addObject:wifi];
        }
    }
}//*/

/*
- (SCNetworkReachabilityFlags)fetchCurrentNetworkStatus {
    
    // 创建零地址，0.0.0.0的地址表示查询本机的网络连接状态
    struct sockaddr_in zeroAddress;//sockaddr_in是与sockaddr等价的数据结构
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;//sin_family是地址家族，一般都是“AF_xxx”的形式。通常大多用的是都是AF_INET,代表TCP/IP协议族
    
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress); //创建测试连接的引用：
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags) {
        NSLog(@"Error. Could not recover network reachability flagsn");
        return 0;
    }
    
    return flags;
}//*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
