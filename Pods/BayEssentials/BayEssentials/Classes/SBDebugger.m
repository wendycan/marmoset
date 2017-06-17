//
//  SBDebugger.m
//  ShanbayCommons
//
//  Created by 吴姜苇 on 13-10-14.
//  Copyright (c) 2013年 shanbay.com. All rights reserved.
//

#import "SBDebugger.h"
#import "SBUserInfoStore.h"

NSString *keyNameDebugOn = @"kDebugOn";
NSString *keyNameDebugServerIP = @"kDebugServerIP";
NSString *keyNameDebugServerIPs = @"kDebugDefaultServerIPs";

NSString *keyNameDebugInReviewOn = @"kDebugInReviewOn";
NSString *keyNameDebugUsingLocalFLEX = @"kNameDebugUsingLocalFLEX";

static void (*origin_exceptionHandler)(NSException *) = NULL;
static void SBUncaughtExceptionHandler(NSException *exception) {
    NSLog(@"exception : %@", exception);
    NSLog(@"call stack : %@", [exception callStackSymbols]);
    if (origin_exceptionHandler) {
        origin_exceptionHandler(exception);
    }
}

@implementation SBDebugger

+ (void)openDebugger {
    NSMutableDictionary *shanbayDefaults = [NSMutableDictionary dictionaryWithDictionary:[SBUserInfoStore shanbayDefaults]];
    [shanbayDefaults setObject:[NSNumber numberWithBool:YES] forKey:keyNameDebugOn];
    [SBUserInfoStore synchronizeShanbayDefaults:shanbayDefaults];
    NSLog(@"open debugger!");
}

+ (void)closeDebugger {
    NSMutableDictionary *shanbayDefaults = [NSMutableDictionary dictionaryWithDictionary:[SBUserInfoStore shanbayDefaults]];
    [shanbayDefaults setObject:[NSNumber numberWithBool:NO] forKey:keyNameDebugOn];
    [SBUserInfoStore synchronizeShanbayDefaults:shanbayDefaults];
    NSLog(@"close debugger!");
}

+ (BOOL)isDebuggerOn {
    return [[[SBUserInfoStore shanbayDefaults] objectForKey:keyNameDebugOn] boolValue];
}

+ (BOOL)setDebuggerInReviewOn:(BOOL)on {
    NSMutableDictionary *shanbayDefaults = [NSMutableDictionary dictionaryWithDictionary:[SBUserInfoStore shanbayDefaults]];
    [shanbayDefaults setObject:[NSNumber numberWithBool:on] forKey:keyNameDebugInReviewOn];
    return [SBUserInfoStore synchronizeShanbayDefaults:shanbayDefaults];
}

+ (BOOL)isDebuggerInReviewOn {
    return [[[SBUserInfoStore shanbayDefaults] objectForKey:keyNameDebugInReviewOn] boolValue];
}

+ (void)setUsingLocalFLEX:(BOOL)on {
    NSMutableDictionary *shanbayDefaults = [NSMutableDictionary dictionaryWithDictionary:[SBUserInfoStore shanbayDefaults]];
    [shanbayDefaults setObject:[NSNumber numberWithBool:on] forKey:keyNameDebugUsingLocalFLEX];
    [SBUserInfoStore synchronizeShanbayDefaults:shanbayDefaults];
}

+ (BOOL)isUsingLocalFLEX {
    return [[[SBUserInfoStore shanbayDefaults] objectForKey:keyNameDebugUsingLocalFLEX] boolValue];
}

+ (void)setDebugServerIP:(NSString *)IPAddress {
    NSMutableDictionary *shanbayDefaults = [NSMutableDictionary dictionaryWithDictionary:[SBUserInfoStore shanbayDefaults]];
    [shanbayDefaults setObject:IPAddress forKey:keyNameDebugServerIP];
    [SBUserInfoStore synchronizeShanbayDefaults:shanbayDefaults];
}

+ (NSString *)debugServerIP {
    NSString *defaultValue = [[SBUserInfoStore shanbayDefaults] objectForKey:keyNameDebugServerIP];
    if (defaultValue == nil) {
        defaultValue = [self defaultDebugAddress];
        NSMutableDictionary *shanbayDefaults = [NSMutableDictionary dictionaryWithDictionary:[SBUserInfoStore shanbayDefaults]];
        [shanbayDefaults setObject:defaultValue forKey:keyNameDebugServerIP];
        [SBUserInfoStore synchronizeShanbayDefaults:shanbayDefaults];
    }
    
    return defaultValue;
}

+ (NSString *)defaultDebugAddress {
    return  @"https://dev.shanbay.com";
}

+ (NSString *)defaultCommonAddress {
    return  @"http://www.shanbay.com";
}

+ (NSArray *)getServerIPs {
    
    NSArray *defaultIPs = [[SBUserInfoStore shanbayDefaults] objectForKey:keyNameDebugServerIPs];
    if (defaultIPs == nil) {
        defaultIPs = @[[self defaultDebugAddress], [self defaultCommonAddress]];
        NSMutableDictionary *shanbayDefaults = [NSMutableDictionary dictionaryWithDictionary:[SBUserInfoStore shanbayDefaults]];
        [shanbayDefaults setObject:defaultIPs forKey:keyNameDebugServerIPs];
        [SBUserInfoStore synchronizeShanbayDefaults:shanbayDefaults];
    }
    
    return defaultIPs;
}

+ (void)deleteServerIP:(NSString *)IPAddress {
    
    if (IPAddress.length == 0) {
        return;
    }
    
    NSArray *serverIPs = [self getServerIPs];
    if (serverIPs.count > 0) {
        NSMutableArray *array = [NSMutableArray arrayWithArray:serverIPs];
        
        for (int i = 0; i < array.count; i ++) {
            NSString *address = [array objectAtIndex:i];
            if ([address isEqualToString:IPAddress]) {
                [array removeObject:address];
                break;
            }
        }
        
        NSMutableDictionary *shanbayDefaults = [NSMutableDictionary dictionaryWithDictionary:[SBUserInfoStore shanbayDefaults]];
        [shanbayDefaults setObject:array forKey:keyNameDebugServerIPs];
        [SBUserInfoStore synchronizeShanbayDefaults:shanbayDefaults];
    }
}

+ (void)addServerIP:(NSString *)IPAddress {
    
    if (IPAddress.length == 0) {
        return;
    }

    NSURL *url = [NSURL URLWithString:IPAddress];
    if (!url) {
        return;
    }

    NSArray *serverIPs = [self getServerIPs];
    NSMutableArray *array = [NSMutableArray arrayWithArray:serverIPs];
    
    BOOL already = NO;
    for (int i = 0; i < array.count; i ++) {
        NSString *address = [array objectAtIndex:i];
        if ([address isEqualToString:IPAddress]) {
            already = YES;
            break;
        }
    }
    
    if (!already){
        [array addObject:IPAddress];
        
        NSMutableDictionary *shanbayDefaults = [NSMutableDictionary dictionaryWithDictionary:[SBUserInfoStore shanbayDefaults]];
        [shanbayDefaults setObject:array forKey:keyNameDebugServerIPs];
        [SBUserInfoStore synchronizeShanbayDefaults:shanbayDefaults];
    }
}

+ (void)enableExceptionHandler {
    origin_exceptionHandler = NSGetUncaughtExceptionHandler();
    NSSetUncaughtExceptionHandler(SBUncaughtExceptionHandler);
}

+ (void)simulateMemoryWarning {
#ifdef DEBUG
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Wundeclared-selector"
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication] performSelector:@selector(_performMemoryWarning)];
    });
    
    #pragma clang diagnostic pop
#endif
}

@end
