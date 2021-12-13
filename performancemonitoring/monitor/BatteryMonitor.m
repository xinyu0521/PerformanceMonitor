//
//  BatterMonitor.m
//  performancemonitoring
//
//  Created by zhanx630 on 2021/12/1.
//

#import "BatteryMonitor.h"
#import <UIKit/UIKit.h>

@implementation BatteryMonitor

+ (float)getBatteryLevel
{
    [UIDevice currentDevice].batteryMonitoringEnabled = YES;
    return [UIDevice currentDevice].batteryLevel;
}

@end
