//
//  RegularJudge.h
//  ChoiskycnApp
//
//  Created by mac on 14-9-24.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegularJudge : NSObject
//邮箱
+(BOOL)validateEmail:(NSString *)email;
//手机号码验证
+(BOOL)validateMobile:(NSString *)mobile;
//手机号码位数验证
+(BOOL)mobileLength:(NSString *)mobile;
//用户名
+(BOOL)validateUserName:(NSString *)name;
//车牌号验证
+ (BOOL) validateCarNo:(NSString *)carNo;
//车型
+ (BOOL) validateCarType:(NSString *)CarType;
//密码
+ (BOOL) validatePassword:(NSString *)passWord;
//昵称
+ (BOOL) validateNickname:(NSString *)nickname;
//身份证号
+ (BOOL) validateIdentityCard: (NSString *)identityCard;
//严密的身份证号判断
+ (BOOL)verifyIDCardNumber:(NSString *)value;
//判断是否为QQ号
+(BOOL)isQQ:(NSString *)qq;

@end
