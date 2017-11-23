//
//  Header.h
//  DD
//
//  Created by admin on 2017/8/29.
//  Copyright © 2017年 ahaschool. All rights reserved.
//

#import <CoreFoundation/CoreFoundation.h>
#import <SystemConfiguration/SCNetworkReachability.h>
#import <sys/socket.h>
#import <netinet/in.h>
#import <arpa/inet.h>
#import <unistd.h>
#import <string.h>


@interface DTALocationManager : NSObject
@property(nonatomic) _Bool detectRiskOfFakeLocation;

typedef void(^CustomAction)(id obj, id sel ,id idx);

- (void)amapLocationManager:(id)arg1 didFailWithError:(id)arg2;

- (void)dt_requestLocationWithReGeocode:(_Bool)arg1 completion:(CustomAction)arg2;

@end

@interface AMapLocationManager : NSObject

@property(nonatomic) _Bool detectRiskOfFakeLocation;
@end

/*
Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef	target, SCNetworkReachabilityFlags	*flags);

CFArrayRef __nullable CNCopySupportedInterfaces	(void);


CFDictionaryRef __nullable CNCopyCurrentNetworkInfo	(CFStringRef interfaceName);
//*/

@interface DTCheckInTask : NSObject
{
}

@property(copy, nonatomic) NSArray *plainWifiList; // @synthesize
@property(copy, nonatomic) NSString *wifiList;
- (id)cWifiInfo;
- (_Bool)checkWifi:(id)arg1;
- (_Bool)queryWifiAndCheck;

@end


@interface LAActionResponse : NSObject

@property(copy, nonatomic) CustomAction resCallback; // @synthesize

@end

@interface LAPDeviceBase : NSObject
- (_Bool)isWiFiEnabled;
- (void)getWifiStatus:(id)arg1 to:(id)arg2;
- (void)__exported__getWifiStatus:(id)arg1 to:(id)arg2;

@end


