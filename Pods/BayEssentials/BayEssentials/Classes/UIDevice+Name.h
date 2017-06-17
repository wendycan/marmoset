//
//  UIDevice+Name.h
//  ShanbayCommons
//
//  Created by 吴姜苇 on 14-4-4.
//  Copyright (c) 2014年 shanbay.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Name)

+ (BOOL)isJailbroken;

- (NSString*)deviceName;
+ (CGFloat)sb_scale;

@end
