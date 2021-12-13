//
//  StartupMeasurer.m
//  performancemonitoring
//
//  Created by zhanx630 on 2021/11/30.
//

#import "LaunchTimeMeasurer.h"

CFAbsoluteTime startTime;

@interface LaunchTimeMeasurer()

@property (nonatomic, assign) CFAbsoluteTime endTime;

@end

@implementation LaunchTimeMeasurer

+ (void)load {
    startTime = CFAbsoluteTimeGetCurrent();
}

+ (LaunchTimeMeasurer *)shareInstance
{
    static LaunchTimeMeasurer *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[LaunchTimeMeasurer alloc] init];
    });
    return instance;
}

- (void)finishedLaunch
{
    _endTime = CFAbsoluteTimeGetCurrent();
}

- (CFAbsoluteTime)getLaunchingTime
{
    return _endTime - startTime;
}

@end
