#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "BayAPIConfig.h"
#import "BayBundleIdUtil.h"
#import "SBDebugger.h"
#import "SBUserInfoStore.h"
#import "UIDevice+Name.h"

FOUNDATION_EXPORT double BayEssentialsVersionNumber;
FOUNDATION_EXPORT const unsigned char BayEssentialsVersionString[];

