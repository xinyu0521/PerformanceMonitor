//
//  MemoryMonitor.h
//  performancemonitoring
//
//  Created by zhanx630 on 2021/11/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MemoryMonitor : NSObject

+ (int64_t)appMemoryUsage;

+ (int64_t)memoryUsage;

+ (uint64_t)availableMemory;

@end

NS_ASSUME_NONNULL_END
