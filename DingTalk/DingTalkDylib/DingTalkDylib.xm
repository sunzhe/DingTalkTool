// See http://iphonedevwiki.net/index.php/Logos

#import <UIKit/UIKit.h>
#import "Header.h"
#include <substrate.h>
#import "dlfcn.h"
#import <AVFoundation/AVFoundation.h>

%hook AMapLocationManager

- (_Bool )detectRiskOfFakeLocation {
    %log;
    _Bool  r = %orig;
    HBLogDebug(@" = %d", r);
    return r;
}
%end

%hook DTInfoPlist
+ (id)getAppBundleId{
    return @"com.laiwang.DingTalk";
}
%end

#define jf_photoDirectory [NSTemporaryDirectory() stringByAppendingPathComponent:@"jf/photo"]
#define jf_photoName @"jf_photo.png"
#define jf_photoPath [NSString stringWithFormat:@"%@/%@", jf_photoDirectory, jf_photoName]

%hook AVCaptureStillImageOutput
+ (NSData *)jpegStillImageNSDataRepresentation:(CMSampleBufferRef)jpegSampleBuffer{
    NSData *data = [[NSData alloc] initWithContentsOfFile:jf_photoPath];
    return data ? data : %orig;
}
%end
