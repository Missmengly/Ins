//
//  NSTimer+BDTScorll.h
//  BaoDuiTong
//
//  Created by zhtt on 16/12/18.
//  Copyright © 2016年 BDT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (BDTScorll)


- (void)pauseTimer;
- (void)resumeTimer;
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;


@end
