//
//  BDTScale.m
//  BaoDuiTong
//
//  Created by apple on 2016/12/20.
//  Copyright © 2016年 BDT. All rights reserved.
//

#import "BDTScale.h"

@implementation BDTScale

+ (instancetype)shareHandle
{
    static dispatch_once_t onceToken;
    static BDTScale *scale = nil;
    dispatch_once(&onceToken, ^{
        scale = [[BDTScale alloc] init];
        scale.Wsc = 1.0;
        scale.Hsc = 1.0;
    });
    return scale;
}


@end
