//
//  UIControl+UIControl_buttonCon.h
//  BaoDuiTong
//
//  Created by zhtt on 2017/12/15.
//  Copyright © 2017年 BDT. All rights reserved.
//

#import <UIKit/UIKit.h>

#define defaultInterval 2//默认时间间隔

@interface UIControl (UIControl_buttonCon)

@property (nonatomic, assign) NSTimeInterval yg_acceptEventInterval;   // 可以用这个给重复点击加间隔

@end
