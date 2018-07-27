//
//  UIButton+Block.h
//  IBoXiao_ios
//
//  Created by 于龙 on 14-3-25.
//  Copyright (c) 2014年 ___boxiao___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

typedef void (^ActionBlock)();

@interface UIButton (Block)

@property (readonly) NSMutableDictionary *event;

- (void)handleControlEvent:(UIControlEvents)event withBlock:(ActionBlock)action;

@end
