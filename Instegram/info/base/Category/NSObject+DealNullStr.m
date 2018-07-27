//
//  NSObject+DealNullStr.m
//  LH
//
//  Created by zhtt on 2018/4/15.
//  Copyright © 2018年 LH. All rights reserved.
//

#import "NSObject+DealNullStr.h"
#import <objc/message.h>

// 判断为空的规则
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] ||[str isEqual:@"(null)"]|| str == nil || [str length] < 1 ? YES : NO )

@implementation NSObject (DealNullStr)

+ (instancetype)modelWithDict:(NSDictionary *)dict {
    id objc = [[self alloc] init];
    
    [objc setValuesForKeysWithDictionary:dict];
    
    unsigned int count = 0;
    
    Ivar *ivars = class_copyIvarList([self class], &count);
    
    for (int i = 0; i < count; i++) {
        
        Ivar ivar = ivars[i];
        
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        ivarName = [ivarName substringFromIndex:1];
        
        NSString *ivarType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        
        NSString *strType = [NSString stringWithFormat:@"\@\"%@\"",NSStringFromClass([NSString class])];
        
        id value = dict[ivarName];
        
        if ([ivarType isEqualToString:strType] && kStringIsEmpty(value)) {
            object_setIvar(objc, ivar, @"");
        }
    }
    return objc;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}
@end
