//
//  SBUserInfoStore.h
//  Shanbay
//
//  Created by 吴姜苇 on 13-1-16.
//  Copyright (c) 2013年 shanbay.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SBUserInfoStore : NSObject

#pragma mark - user store

+ (NSDictionary *)shanbayDefaults;
+ (BOOL)synchronizeShanbayDefaults:(NSDictionary *)shanbayDefaults;

#pragma mark - general cache object
+ (BOOL)cacheObject:(id<NSCoding>)object withKey:(NSString *)key;
+ (id<NSCoding>)cachedObjectWithKey:(NSString *)key;

@end
