//
//  FPSMonitor.m
//  performancemonitoring
//
//  Created by zhanx630 on 2021/12/2.
//

#import "FPSMonitor.h"
#import <QuartzCore/QuartzCore.h>
#import "WeakProxy.h"

@implementation FPSMonitor {
    CADisplayLink *_link;
    NSUInteger _count;
    NSTimeInterval _lastTime;
    float fps;
}

- (id)init {
    self = [super init];
    if( self ){
        _link = [CADisplayLink displayLinkWithTarget:[WeakProxy proxyWithTarget:self] selector:@selector(tick:)];
        [_link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
        
    }
    return self;
}

- (void)dealloc {
    [_link invalidate];
}

- (void)tick:(CADisplayLink *)link {
    if (_lastTime == 0) {
        _lastTime = link.timestamp;
        return;
    }
    
    _count++;
    NSTimeInterval delta = link.timestamp - _lastTime;
    if (delta < 1) return;
    _lastTime = link.timestamp;
    fps = _count / delta;
    _count = 0;
}

- (float)getFPS
{
    return fps;
}

@end
