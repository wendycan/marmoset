//
//  BayBundleIdUtil.h
//  Pods
//
//  Created by Xiaoyu Li on 15/12/2016.
//
//

#import <Foundation/Foundation.h>

extern NSString * _Nonnull const BayWordsBundleId;
extern NSString * _Nonnull const BayListenBundleId;
extern NSString * _Nonnull const BayNewsBundleId;
extern NSString * _Nonnull const BaySpeakBundleId;
extern NSString * _Nonnull const BaySentenceBundleId;
extern NSString * _Nonnull const BayReaderBundleId;

extern NSString * _Nonnull const BayWordsAppId;
extern NSString * _Nonnull const BayListenAppId;
extern NSString * _Nonnull const BayNewsAppId;
extern NSString * _Nonnull const BaySpeakAppId;
extern NSString * _Nonnull const BaySentenceAppId;
extern NSString * _Nonnull const BayReaderAppId;

@interface BayBundleIdUtil : NSObject

+ (nonnull NSString *)appName;

+ (BOOL)isShanbayWords;
+ (BOOL)isShanbayNews;
+ (BOOL)isShanbaySentence;
+ (BOOL)isShanbayBook;
+ (BOOL)isShanbayListen;
+ (BOOL)isShanbaySpeak;

+ (BOOL)canOpenAppFromName:(nullable NSString *)name;
+ (void)openAppFromName:(nullable NSString *)name;

+ (BOOL)canLauchShanbaySpeak;
+ (BOOL)canLauchShanbayWords;
+ (BOOL)canLauchShanbayNews;
+ (BOOL)canLauchShanbayBook;
+ (BOOL)canLauchShanbaySentence;
+ (BOOL)canLauchShanbayListen;

+ (BOOL)canLauchDeprecatedShanbayWords;
+ (BOOL)canLauchDeprecatedShanbayNews;
+ (BOOL)canLauchDeprecatedShanbayBook;
+ (BOOL)canLauchDeprecatedShanbaySentence;
+ (BOOL)canLauchDeprecatedShanbayListen;

+ (BOOL)launchShanbayWords;
+ (BOOL)launchShanbayNews;
+ (BOOL)launchShanbayBook;
+ (BOOL)launchShanbaySentence;
+ (BOOL)launchShanbayListen;
+ (BOOL)launchBookOrNews;
+ (BOOL)launchShanbaySpeak;

+ (BOOL)updateCurrentApp;
+ (BOOL)updateShanbayWords;
+ (BOOL)updateShanbayNews;
+ (BOOL)updateShanbayBook;
+ (BOOL)updateShanbaySentence;
+ (BOOL)updateShanbayListen;
+ (BOOL)updateShanbaySpeak;

+ (BOOL)commentShanbayWords;
+ (BOOL)commentShanbayNews;
+ (BOOL)commentShanbayBook;
+ (BOOL)commentShanbaySentence;
+ (BOOL)commentShanbayListen;
+ (BOOL)commentShanbaySpeak;

@end
