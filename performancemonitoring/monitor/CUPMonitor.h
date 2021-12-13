//
//  CUPMonitor.h
//  performancemonitoring
//
//  Created by zhanx630 on 2021/11/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CUPMonitor : NSObject

+ (float)appCupUsage;

+ (float)cupUsage;

+ (NSUInteger)cpuNumber;

+ (NSString *)cpuTypeString;

+ (NSString *)cpuSubtypeString;

@end

NS_ASSUME_NONNULL_END
