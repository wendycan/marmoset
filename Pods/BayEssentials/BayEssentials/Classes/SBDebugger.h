//
//  SBDebugger.h
//  ShanbayCommons
//
//  Created by 吴姜苇 on 13-10-14.
//  Copyright (c) 2013年 shanbay.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern NSString *keyNameDebugOn;
extern NSString *keyNameDebugServerIP;
extern NSString *keyNameDebugServerIPs;

@interface SBDebugger : NSObject

+ (void)openDebugger;
+ (void)closeDebugger;

+ (BOOL)setDebuggerInReviewOn:(BOOL)on;
+ (BOOL)isDebuggerInReviewOn;

+ (void)setUsingLocalFLEX:(BOOL)on;
+ (BOOL)isUsingLocalFLEX;

+ (BOOL) isDebuggerOn;
+ (void) setDebugServerIP:(NSString *)IPAddress;
+ (NSString *) debugServerIP;
+ (NSString *)defaultDebugAddress;

+ (NSArray *)getServerIPs;
+ (void)deleteServerIP:(NSString *)IPAddress;
+ (void)addServerIP:(NSString *)IPAddress;

+ (void)enableExceptionHandler;
+ (void)simulateMemoryWarning;

@end
