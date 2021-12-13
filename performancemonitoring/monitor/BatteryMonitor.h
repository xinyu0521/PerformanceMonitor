//
//  BatterMonitor.h
//  performancemonitoring
//
//  Created by zhanx630 on 2021/12/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BatteryMonitor : NSObject

+ (float)getBatteryLevel;

@end

NS_ASSUME_NONNULL_END
