#line 1 "/Users/admin/Desktop/MyTest/DingTalk/DingTalkDylib/DingTalkDylib.xm"


#import <UIKit/UIKit.h>
#import "Header.h"
#include <substrate.h>
#import "dlfcn.h"
#import <AVFoundation/AVFoundation.h>


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class DTInfoPlist; @class AMapLocationManager; @class AVCaptureStillImageOutput; 
static _Bool (*_logos_orig$_ungrouped$AMapLocationManager$detectRiskOfFakeLocation)(_LOGOS_SELF_TYPE_NORMAL AMapLocationManager* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AMapLocationManager$detectRiskOfFakeLocation(_LOGOS_SELF_TYPE_NORMAL AMapLocationManager* _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$DTInfoPlist$getAppBundleId)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$DTInfoPlist$getAppBundleId(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static NSData * (*_logos_meta_orig$_ungrouped$AVCaptureStillImageOutput$jpegStillImageNSDataRepresentation$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, CMSampleBufferRef); static NSData * _logos_meta_method$_ungrouped$AVCaptureStillImageOutput$jpegStillImageNSDataRepresentation$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, CMSampleBufferRef); 

#line 9 "/Users/admin/Desktop/MyTest/DingTalk/DingTalkDylib/DingTalkDylib.xm"


static _Bool _logos_method$_ungrouped$AMapLocationManager$detectRiskOfFakeLocation(_LOGOS_SELF_TYPE_NORMAL AMapLocationManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    HBLogDebug(@"-[<AMapLocationManager: %p> detectRiskOfFakeLocation]", self);
    _Bool  r = _logos_orig$_ungrouped$AMapLocationManager$detectRiskOfFakeLocation(self, _cmd);
    HBLogDebug(@" = %d", r);
    return r;
}



static id _logos_meta_method$_ungrouped$DTInfoPlist$getAppBundleId(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    return @"com.laiwang.DingTalk";
}


#define jf_photoDirectory [NSTemporaryDirectory() stringByAppendingPathComponent:@"jf/photo"]
#define jf_photoName @"jf_photo.png"
#define jf_photoPath [NSString stringWithFormat:@"%@/%@", jf_photoDirectory, jf_photoName]


static NSData * _logos_meta_method$_ungrouped$AVCaptureStillImageOutput$jpegStillImageNSDataRepresentation$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CMSampleBufferRef jpegSampleBuffer){
    NSData *data = [[NSData alloc] initWithContentsOfFile:jf_photoPath];
    return data ? data : _logos_meta_orig$_ungrouped$AVCaptureStillImageOutput$jpegStillImageNSDataRepresentation$(self, _cmd, jpegSampleBuffer);
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$AMapLocationManager = objc_getClass("AMapLocationManager"); MSHookMessageEx(_logos_class$_ungrouped$AMapLocationManager, @selector(detectRiskOfFakeLocation), (IMP)&_logos_method$_ungrouped$AMapLocationManager$detectRiskOfFakeLocation, (IMP*)&_logos_orig$_ungrouped$AMapLocationManager$detectRiskOfFakeLocation);Class _logos_class$_ungrouped$DTInfoPlist = objc_getClass("DTInfoPlist"); Class _logos_metaclass$_ungrouped$DTInfoPlist = object_getClass(_logos_class$_ungrouped$DTInfoPlist); MSHookMessageEx(_logos_metaclass$_ungrouped$DTInfoPlist, @selector(getAppBundleId), (IMP)&_logos_meta_method$_ungrouped$DTInfoPlist$getAppBundleId, (IMP*)&_logos_meta_orig$_ungrouped$DTInfoPlist$getAppBundleId);Class _logos_class$_ungrouped$AVCaptureStillImageOutput = objc_getClass("AVCaptureStillImageOutput"); Class _logos_metaclass$_ungrouped$AVCaptureStillImageOutput = object_getClass(_logos_class$_ungrouped$AVCaptureStillImageOutput); MSHookMessageEx(_logos_metaclass$_ungrouped$AVCaptureStillImageOutput, @selector(jpegStillImageNSDataRepresentation:), (IMP)&_logos_meta_method$_ungrouped$AVCaptureStillImageOutput$jpegStillImageNSDataRepresentation$, (IMP*)&_logos_meta_orig$_ungrouped$AVCaptureStillImageOutput$jpegStillImageNSDataRepresentation$);} }
#line 35 "/Users/admin/Desktop/MyTest/DingTalk/DingTalkDylib/DingTalkDylib.xm"
