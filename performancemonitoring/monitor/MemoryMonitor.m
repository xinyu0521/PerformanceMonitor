//
//  MemoryMonitor.m
//  performancemonitoring
//
//  Created by zhanx630 on 2021/11/30.
//

#import "MemoryMonitor.h"
#import <mach/mach.h>
#import <sys/sysctl.h>

@implementation MemoryMonitor

+ (int64_t)appMemoryUsage
{
    int64_t memoryUsageInByte = 0;
    task_vm_info_data_t vmInfo;
    mach_msg_type_number_t count = TASK_VM_INFO_COUNT;
    kern_return_t kernelReturn = task_info(mach_task_self(), TASK_VM_INFO, (task_info_t) &vmInfo, &count);
    if(kernelReturn == KERN_SUCCESS)
    {
        memoryUsageInByte = (int64_t) vmInfo.phys_footprint;
    }
    else {}
    
    return memoryUsageInByte;
}

+ (int64_t)memoryUsage
{
    size_t length = 0;
    int mib[6] = {0};
    
    int pagesize = 0;
    mib[0] = CTL_HW;
    mib[1] = HW_PAGESIZE;
    length = sizeof(pagesize);
    if (sysctl(mib, 2, &pagesize, &length, NULL, 0) < 0)
    {
        return 0;
    }
    
    mach_msg_type_number_t count = HOST_VM_INFO_COUNT;
    
    vm_statistics_data_t vmstat;
    
    if (host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmstat, &count) != KERN_SUCCESS)
    {
        return 0;
    }
    
    int wireMem = vmstat.wire_count * pagesize;
    int activeMem = vmstat.active_count * pagesize;
    return wireMem + activeMem;
}

+ (uint64_t)availableMemory {
    vm_statistics64_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(),
                                               HOST_VM_INFO,
                                               (host_info_t)&vmStats,
                                               &infoCount);
    
    if (kernReturn != KERN_SUCCESS) {
        return NSNotFound;
    }
    
    return vm_page_size * (vmStats.free_count + vmStats.inactive_count);
}

@end
