//
//  StartupMeasurer.h
//  performancemonitoring
//
//  Created by zhanx630 on 2021/11/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LaunchTimeMeasurer : NSObject

+ (LaunchTimeMeasurer *)shareInstance;

- (void)finishedLaunch;

- (CFAbsoluteTime)getLaunchingTime;

@end

NS_ASSUME_NONNULL_END
