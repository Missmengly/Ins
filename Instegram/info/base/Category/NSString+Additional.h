//
//  NSString+Additional.h
//  LiveStore
//
//  Created by 于龙 on 13-11-14.
//  Copyright (c) 2013年 fm.laifu.ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@interface NSString (Additional)
- (CGSize)calculateSize:(CGSize)size font:(UIFont *)font;
//PredicateString 为正则字符串  字符串是否匹配正则
- (BOOL)evaluateByPredicateString:(NSString*)PredicateString;
+ (float) heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width;
+ (CGFloat)heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width maximumNumberOfLines:(int)lines;
+ (CGFloat)widthForString:(NSString *)value fontSize:(float)fontSize;   //计算字符串宽度
+ (BOOL) isValidateEmail:(NSString *)email;
+ (BOOL) isValidateMobile:(NSString *)mobile;
+ (BOOL) isValidateIBC:(NSString *)number;//11位数字
+ (BOOL) validateCarNo:(NSString*) carNo;
+ (BOOL) isBlankString:(NSString *)string;
/**
 *  字符串是否是空
 *
 *  @return BOOL
 */
+ (BOOL)isNullString:(NSString *)string;
+ (BOOL) isValidatePhone:(NSString *)phone;

//- (BOOL)isEmptyString;//是否是空字符串

//+ (BOOL)isPureInt:(NSString *)string;//是否为整形数字

//+ (NSString*)stringTimeUnitBySeconds:(NSInteger)seconds;//秒换算对应的分钟小时天

-  (int)charNumber;//判断字符串中字符个数   汉子为2字符

/// 身份证验证
+ (BOOL) IsIdentityCard:(NSString *)IDCardNumber;

/// 银行卡验证
+ (BOOL) IsBankCard:(NSString *)cardNumber ;

@end
