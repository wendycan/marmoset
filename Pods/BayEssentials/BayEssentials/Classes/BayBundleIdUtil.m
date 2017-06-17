//
//  BayBundleIdUtil.m
//  Pods
//
//  Created by Xiaoyu Li on 15/12/2016.
//
//

#import "BayBundleIdUtil.h"

NSString * const BayWordsBundleId = @"com.shanbay.words";
NSString * const BayListenBundleId = @"com.shanbay.listen";
NSString * const BayNewsBundleId = @"com.shanbay.news";
NSString * const BaySpeakBundleId = @"com.shanbay.speak";
NSString * const BaySentenceBundleId = @"com.beeblio.sentence";
NSString * const BayReaderBundleId = @"com.shanbay.book";

NSString * const BayWordsAppId = @"531059691";
NSString * const BayListenAppId = @"897432803";
NSString * const BayNewsAppId = @"598541783";
NSString * const BaySpeakAppId = @"1089026929";
NSString * const BaySentenceAppId = @"698013609";
NSString * const BayReaderAppId = @"740310885";

NSString * const BayDeprecatedShanbayWordsUrl = @"shanbay://";
NSString * const BayDeprecatedShanbayNewsUrl = @"shanbaynews://";
NSString * const BayDeprecatedShanbayBookUrl = @"shanbaybook://";
NSString * const BayDeprecatedShanbaySentenceUrl = @"shanbaysentence://";
NSString * const BayDeprecatedShanbayListenUrl = @"shanbaylisten://";

@implementation BayBundleIdUtil

+ (NSString *)appName {
    NSDictionary *keys = @
    {
        BayWordsBundleId: @"words",
        BayListenBundleId: @"listen",
        BayReaderBundleId: @"reader",
        BaySentenceBundleId: @"sentence",
        BayNewsBundleId: @"news",
        BaySpeakBundleId: @"speak",
    };
    NSString *bundleId = [[NSBundle mainBundle] bundleIdentifier];
    if ([bundleId length] == 0) {
        bundleId = BayWordsAppId;
    }
    bundleId = [bundleId stringByReplacingOccurrencesOfString:@".inhouse" withString:@""];
    return keys[bundleId];
}

+ (BOOL)canOpenAppFromName:(NSString *)name {
    if ([name isEqualToString:@"words"] || [name isEqualToString:@"news"] || [name isEqualToString:@"listen"] || [name isEqualToString:@"sentence"] || [name isEqualToString:@"reader"] || [name isEqualToString:@"speak"]) {
        return YES;
    }
    return NO;
}

/**
 * 本app是否是扇贝单词
 */
+ (BOOL)isShanbayWords {
    NSString *appName = [[NSBundle mainBundle] bundleIdentifier];
    return [appName hasPrefix:BayWordsBundleId];
}

/**
 * 本app是否是扇贝新闻
 */
+ (BOOL)isShanbayNews {
    NSString *appName = [[NSBundle mainBundle] bundleIdentifier];
    return [appName hasPrefix:BayNewsBundleId];
}

/**
 * 本app是否是扇贝炼句
 */
+ (BOOL)isShanbaySentence {
    NSString *appName = [[NSBundle mainBundle] bundleIdentifier];
    return [appName hasPrefix:BaySentenceBundleId];
}

/**
 * 本app是否是扇贝读书
 */
+ (BOOL)isShanbayBook {
    NSString *appName = [[NSBundle mainBundle] bundleIdentifier];
    return [appName hasPrefix:BayReaderBundleId];
}

/**
 * 本app是否是扇贝听力
 */
+ (BOOL)isShanbayListen {
    NSString *appName = [[NSBundle mainBundle] bundleIdentifier];
    return [appName hasPrefix:BayListenBundleId];
}

/**
 * 本app是否是扇贝口语
 */
+ (BOOL)isShanbaySpeak {
    NSString *appName = [[NSBundle mainBundle] bundleIdentifier];
    return [appName hasPrefix:BaySpeakBundleId];
}

/**
 通过 app name 来打开某个 app
 */
+ (void)openAppFromName:(NSString *)name {
    if ([name isEqualToString:@"words"]) {
        if ([self canLauchShanbayWords]) {
            [self launchShanbayWords];
        } else {
            [self updateShanbayWords];
        }
    } else if ([name isEqualToString:@"news"]) {
        if ([self canLauchShanbayNews]) {
            [self launchShanbayNews];
        } else {
            [self updateShanbayNews];
        }
    } else if ([name isEqualToString:@"listen"]) {
        if ([self canLauchShanbayListen]) {
            [self launchShanbayListen];
        } else {
            [self updateShanbayListen];
        }
    } else if ([name isEqualToString:@"sentence"]) {
        if ([self canLauchShanbaySentence]) {
            [self launchShanbaySentence];
        } else {
            [self updateShanbaySentence];
        }
    } else if ([name isEqualToString:@"reader"]) {
        if ([self canLauchShanbayBook]) {
            [self launchShanbayBook];
        } else {
            [self updateShanbayBook];
        }
    } else if ([name isEqualToString:@"speak"]) {
        if ([self canLauchShanbaySpeak]) {
            [self launchShanbaySpeak];
        } else {
            [self updateShanbaySpeak];
        }
    }
}


+ (BOOL)canLauchShanbayWords {
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:[BayWordsBundleId stringByAppendingString:@"://"]]];
}

+ (BOOL)canLauchShanbayNews {
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:[BayNewsBundleId stringByAppendingString:@"://"]]];
}

+ (BOOL)canLauchShanbayBook {
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:[BayReaderBundleId stringByAppendingString:@"://"]]];
}

+ (BOOL)canLauchShanbaySentence {
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:[BaySentenceBundleId stringByAppendingString:@"://"]]];
}

+ (BOOL)canLauchShanbayListen {
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:[BayListenBundleId stringByAppendingString:@"://"]]];
}

+ (BOOL)canLauchShanbaySpeak {
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:[BaySpeakBundleId stringByAppendingString:@"://"]]];
}

+ (BOOL)canLauchDeprecatedShanbayWords {
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:BayDeprecatedShanbayWordsUrl]];
}

+ (BOOL)canLauchDeprecatedShanbayNews {
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:BayDeprecatedShanbayNewsUrl]];
}

+ (BOOL)canLauchDeprecatedShanbayBook {
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:BayDeprecatedShanbayBookUrl]];
}

+ (BOOL)canLauchDeprecatedShanbaySentence {
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:BayDeprecatedShanbaySentenceUrl]];
}

+ (BOOL)canLauchDeprecatedShanbayListen {
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:BayDeprecatedShanbayListenUrl]];
}

+ (BOOL)updateCurrentApp {
    NSString *bundleID = [[NSBundle mainBundle] bundleIdentifier];
    if ([bundleID hasPrefix:BayWordsBundleId]) {
        [self updateShanbayWords];
    } else if ([bundleID hasPrefix:BayNewsBundleId]) {
        [self updateShanbayNews];
    } else if ([bundleID hasPrefix:BayListenBundleId]) {
        [self updateShanbayListen];
    } else if ([bundleID hasPrefix:BaySentenceBundleId]) {
        [self updateShanbaySentence];
    } else if ([bundleID hasPrefix:BayReaderBundleId]) {
        [self updateShanbayBook];
    } else if ([bundleID hasPrefix:BaySpeakBundleId]) {
        [self updateShanbaySpeak];
    }
    return YES;
}

+ (BOOL)launchShanbaySpeak {
    if ([self canLauchShanbaySpeak]) {
        return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[BaySpeakBundleId stringByAppendingString:@"://"]]];
    } else {
        return [self updateShanbaySpeak];
    }
}

/**
 * 跳转到 扇贝单词
 */
+ (BOOL)launchShanbayWords {
    if ([self canLauchShanbayWords]) {
        return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[BayWordsBundleId stringByAppendingString:@"://"]]];
    }
    else if ([self canLauchDeprecatedShanbayWords]) {
        return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:BayDeprecatedShanbayWordsUrl]];
    }
    else {
        return [self updateShanbayWords];
    }
}

/**
 * 跳转到 扇贝新闻
 */
+ (BOOL)launchShanbayNews {
    if ([self canLauchShanbayNews]) {
        return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[BayNewsBundleId stringByAppendingString:@"://"]]];
    }
    else if ([self canLauchDeprecatedShanbayNews]) {
        return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:BayDeprecatedShanbayNewsUrl]];
    }
    else {
        return [self updateShanbayNews];
    }
}

/**
 * 跳转到 扇贝读书
 */
+ (BOOL)launchShanbayBook {
    if ([self canLauchShanbayBook]) {
        return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[BayReaderBundleId stringByAppendingString:@"://"]]];
    }
    else if ([self canLauchDeprecatedShanbayBook]) {
        return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:BayDeprecatedShanbayBookUrl]];
    }
    else {
        return [self updateShanbayBook];
    }
}

/**
 * 跳转到 扇贝炼句
 */
+ (BOOL)launchShanbaySentence {
    if ([self canLauchShanbaySentence]) {
        return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[BaySentenceBundleId stringByAppendingString:@"://"]]];
    }
    else if ([self canLauchDeprecatedShanbaySentence]) {
        return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:BayDeprecatedShanbaySentenceUrl]];
    }
    else {
        return [self updateShanbaySentence];
    }
}

/**
 * 跳转到 扇贝听力
 */
+ (BOOL)launchShanbayListen {
    if ([self canLauchShanbayListen]) {
        return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[BayListenBundleId stringByAppendingString:@"://"]]];
    }
    else if ([self canLauchDeprecatedShanbayListen]) {
        return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:BayDeprecatedShanbayListenUrl]];
    }
    else {
        return [self updateShanbayListen];
    }
}


/**
 * 跳转到 扇贝读书 或者 扇贝新闻
 */
+ (BOOL)launchBookOrNews {
    if ([self canLauchShanbayNews]) {
        return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[BayNewsBundleId stringByAppendingString:@"://"]]];
    }
    else if ([self canLauchShanbayBook]) {
        return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[BayReaderBundleId stringByAppendingString:@"://"]]];
    }
    else if ([self canLauchDeprecatedShanbayNews]) {
        return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:BayDeprecatedShanbayNewsUrl]];
    }
    else if ([self canLauchDeprecatedShanbayBook]) {
        return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:BayDeprecatedShanbayBookUrl]];
    }
    else {
        return [self updateShanbayNews];
    }
}

/**
 * 在 app store 打开 扇贝单词
 */
+ (BOOL)updateShanbayWords {
    return [self updateAppForId:BayWordsAppId];
}

/**
 * 在 app store 打开 扇贝新闻
 */
+ (BOOL)updateShanbayNews {
    return [self updateAppForId:BayNewsAppId];
}

/**
 * 在 app store 打开 扇贝读书
 */
+ (BOOL)updateShanbayBook {
    return [self updateAppForId:BayReaderAppId];
}

/**
 * 在 app store 打开 扇贝炼句
 */
+ (BOOL)updateShanbaySentence {
    return [self updateAppForId:BaySentenceAppId];
}

/**
 * 在 app store 打开 扇贝听力
 */
+ (BOOL)updateShanbayListen {
    return [self updateAppForId:BayListenAppId];
}

+ (BOOL)updateShanbaySpeak {
    return [self updateAppForId:BaySpeakAppId];
}

+ (BOOL)updateAppForId:(NSString *)appId {
    NSString* url = [NSString stringWithFormat:@"https://itunes.apple.com/app/id%@", appId];
    return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

/**
 * 评论 扇贝单词
 */
+ (BOOL)commentShanbayWords {
    return [self commentAppForId:BayWordsAppId];
}

/**
 * 评论 扇贝新闻
 */
+ (BOOL)commentShanbayNews {
    return [self commentAppForId:BayNewsAppId];
}

/**
 * 评论 扇贝读书
 */
+ (BOOL)commentShanbayBook {
    return [self commentAppForId:BayReaderAppId];
}

/**
 * 评论 扇贝炼句
 */
+ (BOOL)commentShanbaySentence {
    return [self commentAppForId:BaySentenceAppId];
}

/**
 * 评论 扇贝听力
 */
+ (BOOL)commentShanbayListen {
    return [self commentAppForId:BayListenAppId];
}

/**
 * 评论 扇贝口语
 */
+ (BOOL)commentShanbaySpeak {
    return [self commentAppForId:BaySpeakAppId];
}


/**
 * private
 * 根据 app id 评论某个应用
 */
+ (BOOL)commentAppForId:(NSString *)appId {
    NSString* url = [NSString stringWithFormat:@"https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=%@&pageNumber=0&sortOrdering=1&type=Purple+Software&mt=8", appId];
    return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

@end
