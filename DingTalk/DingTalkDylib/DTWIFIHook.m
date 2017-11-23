//
//  DTWIFIHook.m
//  DD
//
//  Created by admin on 2017/9/8.
//  Copyright © 2017年 ahaschool. All rights reserved.
//

#import <dlfcn.h>
#import "fishhook.h"

#include <substrate.h>

#import "CaptainHook.h"
#import <UIKit/UIKit.h>
#import <Cycript/Cycript.h>

#import "DTWIFIHook.h"


// Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
static Boolean (*orig_SCNetworkReachabilityGetFlags)(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags);

static Boolean jf_SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags) {
    
    Boolean re = false;
    //kSCNetworkReachabilityFlagsTransientConnection
    DTWifiModel *wifi = [DTWIFIHook  wifiHooked];
    
    if(wifi && wifi.flags > 0) {
        
        re = true;
        
        *flags = wifi.flags;
    }
    
    if(!re) {
        
        re = orig_SCNetworkReachabilityGetFlags(target, flags);
    }
    
    return re;
}

// CFDictionaryRef CNCopyCurrentNetworkInfo        (CFStringRef interfaceName)
static CFDictionaryRef (*orig_CNCopyCurrentNetworkInfo)(CFStringRef interfaceName);

static CFDictionaryRef jf_CNCopyCurrentNetworkInfo(CFStringRef interfaceName) {
    
    CFDictionaryRef re = NULL;
    
    DTWifiModel *wifi = [DTWIFIHook wifiHooked];
    
    if(wifi) {
        
        NSDictionary *dictionary = @{
                                     @"BSSID" : (wifi.BSSID ? wifi.BSSID : @""),
                                     @"SSID" : (wifi.SSID ? wifi.SSID : @""),
                                     @"SSIDDATA" : (wifi.SSIDDATA ? wifi.SSIDDATA : @""),
                                     };
        re = CFRetain((__bridge CFDictionaryRef)(dictionary));
    }
    
    if(!re) {
        
        re = orig_CNCopyCurrentNetworkInfo(interfaceName);
    }
    
    return re;
}

// CFArrayRef CNCopySupportedInterfaces        (void)
static CFArrayRef (*orig_CNCopySupportedInterfaces)();

static CFArrayRef jf_CNCopySupportedInterfaces() {
    
    CFArrayRef re = NULL;
    
    DTWifiModel *wifi = [DTWIFIHook wifiHooked];
    
    if(wifi && wifi.ifnam) {
        
        NSArray *array = [NSArray arrayWithObject:wifi.ifnam];
        
        re = CFRetain((__bridge CFArrayRef)(array));
    }
    
    if(!re) {
        
        re = orig_CNCopySupportedInterfaces();
    }
    
    return re;
}

@implementation DTWifiModel
- (instancetype)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWith:(NSString *)ifnam dictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (self) {
        
    }
    return self;
}
@end
//*
int my_dladdr(const void * imp,Dl_info * info);
int (*old_dladdr_func)(const void * imp,Dl_info * info);

int my_dladdr(const void * imp,Dl_info * info){
    Dl_info new_info;
    old_dladdr_func(imp,&new_info);
    //	NSLog(@"method CLLocation coordinate:");
    NSString * string = [NSString stringWithUTF8String:new_info.dli_sname];
    if ([string rangeOfString:@"coordinate"].location != NSNotFound) {
        NSLog(@"%@",@"yty_123");
        new_info.dli_fname = "/System/Library/Frameworks/CoreLocation.framework/CoreLocation";
        new_info.dli_sname = "CLGetStatusBarIconState";
        NSLog(@"yty_dli_fname:%s",new_info.dli_fname);
        NSLog(@"yty_dli_sname:%s",new_info.dli_sname);
        NSLog(@"yty_dli_fbase:%p",new_info.dli_fbase);
        NSLog(@"yty_dli_saddr:%p",new_info.dli_saddr);
    }
    
    //	info = &new_info;
    (*info).dli_fname = new_info.dli_fname;
    (*info).dli_sname = new_info.dli_sname;
    (*info).dli_fbase = new_info.dli_fbase;
    (*info).dli_saddr = new_info.dli_saddr;
    
    return old_dladdr_func(imp,&new_info);
}
//*/

@implementation DTWIFIHook

//*
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //rebind_symbols((struct rebinding[2]){{"close", my_close, (void *)&orig_close}, {"open", my_open, (void *)&orig_open}}, 2);
        rebind_symbols((struct rebinding[4]){
            {"CNCopySupportedInterfaces", jf_CNCopySupportedInterfaces, (void *)&orig_CNCopySupportedInterfaces},
            {"CNCopyCurrentNetworkInfo", jf_CNCopyCurrentNetworkInfo, (void *)&orig_CNCopyCurrentNetworkInfo},
            {"SCNetworkReachabilityGetFlags", jf_SCNetworkReachabilityGetFlags, (void *)&orig_SCNetworkReachabilityGetFlags},
            {"dladdr", my_dladdr, (void *)&old_dladdr_func},
        }, 4);
    });
}//*/

+ (DTWifiModel *)wifiHooked{
    DTWifiModel *wifi = [DTWifiModel new];
    wifi.BSSID = @"10:88:ce:c7:af:44";
    wifi.SSID = @"ChinaNet-9LQM";
    return wifi;
}
@end
