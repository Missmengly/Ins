//
//  UIControl+UIControl_buttonCon.m
//  BaoDuiTong
//
//  Created by zhtt on 2017/12/15.
//  Copyright © 2017年 BDT. All rights reserved.
//

#import "UIControl+UIControl_buttonCon.h"

#import <objc/message.h>

static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";

static NSTimeInterval YG_TEMP_INTERVAL;

@implementation UIControl (UIControl_buttonCon)

+ (void)load {
    
    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method b = class_getInstanceMethod(self, @selector(__yg_sendAction:to:forEvent:));
    method_exchangeImplementations(a, b);
}

- (void)__yg_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    
    if (NSDate.date.timeIntervalSince1970 - YG_TEMP_INTERVAL < self.yg_acceptEventInterval) {
        return;
    }
    
    if (self.yg_acceptEventInterval > 0)     {
        YG_TEMP_INTERVAL  = NSDate.date.timeIntervalSince1970;
    }
    
    [self __yg_sendAction:action to:target forEvent:event];
}

- (NSTimeInterval)yg_acceptEventInterval{
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}

- (void)setYg_acceptEventInterval:(NSTimeInterval)yg_acceptEventInterval{
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(yg_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
