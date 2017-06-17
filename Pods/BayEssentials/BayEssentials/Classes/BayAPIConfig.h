//
//  BayAPIConfig.h
//  Pods
//
//  Created by Xiaoyu Li on 14/12/2016.
//
//

#import <Foundation/Foundation.h>

@interface BayAPIConfig : NSObject

@property (nonatomic, readonly, nonnull) NSString *scheme;
@property (nonatomic, readonly, nonnull) NSString *apiHost;
@property (nonatomic, readonly, nonnull) NSString *webviewHost;
@property (nonatomic, readonly, nonnull) NSString *userAgent;
@property (nonatomic, readonly, nonnull) NSString *apiVersion;

+ (nonnull instancetype)defaultConfig;
+ (nonnull instancetype)debugConfig;
+ (nonnull instancetype)feedbackConfig;

- (nonnull NSURL *)baseURL;
- (nonnull NSURL *)webviewURL;

@end
