//
//  SBUserInfoStore.m
//  Shanbay
//
//  Created by 吴姜苇 on 13-1-16.
//  Copyright (c) 2013年 shanbay.com. All rights reserved.
//

#import "SBUserInfoStore.h"

NSString * const shanbayDefaultsKeyName = @"com.shanbay.defaults";

@implementation SBUserInfoStore

/**
 * 获取shanbay defaults字典
 */
+ (NSDictionary *)shanbayDefaults {
    
    NSDictionary *shanbayDefaults = [[NSUserDefaults standardUserDefaults] objectForKey:shanbayDefaultsKeyName];
    if (shanbayDefaults) {
        return shanbayDefaults;
    }
    
    return [NSDictionary dictionary];
}

/**
 * 储存shanbay defaults 字典
 */
+ (BOOL)synchronizeShanbayDefaults:(NSDictionary *)shanbayDefaults {
    
    if (shanbayDefaults) {
        [[NSUserDefaults standardUserDefaults] setObject:shanbayDefaults forKey:shanbayDefaultsKeyName];
        return [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    return NO;
}

+ (id<NSCoding>)cachedObjectWithKey:(NSString *)key
{
    if (key == nil) {
        return nil;
    }
    NSData* data = [[self shanbayDefaults] objectForKey:key];
    if (data) {
        @try {
            return [NSKeyedUnarchiver unarchiveObjectWithData:data];
        } @catch (NSException *exception) {
            NSLog(@"%@", exception.description);
        }
    }
    return nil;
}

+ (BOOL)cacheObject:(id<NSCoding>)object withKey:(NSString *)key
{
    if (object == nil || key == nil) {
        return NO;
    }

    BOOL result = NO;
    NSData* data = [NSKeyedArchiver archivedDataWithRootObject:object];
    if (data) {
        NSMutableDictionary *shanbayDefaults = [NSMutableDictionary dictionaryWithDictionary:[self shanbayDefaults]];
        [shanbayDefaults setObject:data forKey:key];
        result = [self synchronizeShanbayDefaults:shanbayDefaults];
    }
    return result;
}

@end
