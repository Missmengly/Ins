//
//  NSTimer+BDTScorll.m
//  BaoDuiTong
//
//  Created by zhtt on 16/12/18.
//  Copyright © 2016年 BDT. All rights reserved.
//

#import "NSTimer+BDTScorll.h"

@implementation NSTimer (BDTScorll)


-(void)pauseTimer
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate distantFuture]];
}


-(void)resumeTimer
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate date]];
}

- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}

@end
