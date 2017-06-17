//
//  BayAPIConfig.m
//  Pods
//
//  Created by Xiaoyu Li on 14/12/2016.
//
//

#import "BayAPIConfig.h"
#import "UIDevice+Name.h"

@interface BayAPIConfig ()

@property (nonatomic, readwrite) NSString *scheme;
@property (nonatomic, readwrite) NSString *apiHost;
@property (nonatomic, readwrite) NSString *webviewHost;
@property (nonatomic, readwrite) NSString *userAgent;
@property (nonatomic, readwrite) NSString *apiVersion;

@end

@implementation BayAPIConfig

+ (instancetype)defaultConfig {
    BayAPIConfig *config = [BayAPIConfig new];
    [config setScheme:@"https"];
    [config setApiHost:@"rest.shanbay.com"];
    [config setWebviewHost:@"www.shanbay.com"];
    [config setApiVersion:@"2.3"];
    [config setUserAgent:[config defaultUserAgent]];
    return config;
}

+ (instancetype)debugConfig {
    BayAPIConfig *config = [BayAPIConfig new];
    [config setScheme:@"https"];
    [config setApiHost:@"rest.shanbay.com"];
    [config setWebviewHost:@"www.shanbay.com"];
    [config setApiVersion:@"2.3"];
    [config setUserAgent:[config defaultUserAgent]];
    return config;
}

+ (instancetype)feedbackConfig {
    BayAPIConfig *config = [BayAPIConfig new];
    [config setScheme:@"https"];
    [config setApiHost:@"feedback.shanbay.com"];
    [config setWebviewHost:@"www.shanbay.com"];
    [config setApiVersion:@"2.3"];
    [config setUserAgent:[config defaultUserAgent]];
    return config;
}

- (NSURL *)baseURL {
    NSString *urlString = [NSString stringWithFormat:@"%@://%@", self.scheme, self.apiHost];
    NSURL *url = [NSURL URLWithString:urlString];
    return url;
}

- (NSURL *)webviewURL {
    NSString *urlString = [NSString stringWithFormat:@"%@://%@", self.scheme, self.webviewHost];
    NSURL *url = [NSURL URLWithString:urlString];
    return url;
}

- (NSString *)defaultUserAgent {
    NSBundle *bundle = [NSBundle mainBundle];
    
    // Attempt to find a name for this application
    NSString *appName = [[[bundle bundleIdentifier] stringByReplacingOccurrencesOfString:@".inhouse" withString:@""] stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    
    NSString *appVersion = nil;
    NSString *marketingVersionNumber = [bundle objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    NSString *developmentVersionNumber = [bundle objectForInfoDictionaryKey:@"CFBundleVersion"];
    if (marketingVersionNumber && developmentVersionNumber) {
        if ([marketingVersionNumber isEqualToString:developmentVersionNumber]) {
            appVersion = marketingVersionNumber;
        } else {
            appVersion = [NSString stringWithFormat:@"%@ rv:%@",marketingVersionNumber,developmentVersionNumber];
        }
    } else {
        appVersion = (marketingVersionNumber ? marketingVersionNumber : developmentVersionNumber);
    }
    appVersion = [appVersion stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    
    NSString *deviceName;
    NSString *OSVersion;
    NSString *locale;
    if ([NSLocale preferredLanguages].count > 0) {
        locale = [[NSLocale preferredLanguages] objectAtIndex:0];
    }
    else {
        locale = [[NSLocale currentLocale] localeIdentifier];
    }
    
    UIDevice *device = [UIDevice currentDevice];
    deviceName = [[device deviceName] stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    if ([deviceName isEqualToString:@"Simulator"]) {
        deviceName = @"iPhone";
    }
    OSVersion = [[device systemVersion] stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    
    NSString *userAgent = [NSString stringWithFormat:@"bayAgent/1.1 iOS/%@ %@/%@ channel/%@ Apple/%@ Frontend/1.8 api/%@", OSVersion, appName, appVersion, @([UIDevice isJailbroken]), deviceName, self.apiVersion];
    
    return userAgent;
}

@end
