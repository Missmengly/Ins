//
//  BDTContants.h
//  BaoDuiTong
//
//  Created by zhtt on 16/12/16.
//  Copyright © 2016年 BDT. All rights reserved.
//

#ifndef BDTContants_h
#define BDTContants_h


#import "UIColor+Additional.h"
#import "BDTScale.h"

// 个人版url
////测试
//测试

//#define kNewModelUrl                  @"http://www.developerplat.com/dev.driver/app/doOperate"                     // 模型操作
//#define kGetNewImgAndFileUrl          @"http://biz.baoduitong.com"                                              // 后面拼接图片路径来获取图片
//#define kUploadingImgAndFile          @"http://www.developerplat.com/bdt.biz/modelDriver/upLoadFile"               // 上传图片或文件
//#define kBankICONUrl                  @"http://www.developerplat.com/bdt.biz/images/bank"                          // 获取银行图标
//#define kNewPersonalLoginUrl          @"http://www.developerplat.com/dev.driver/app"                               // 最新个人登陆
//#define kConsumeUrl                   @"http://www.developerplat.com/bdt.pay/pay/doAppConsume"                     // 积分兑换 配件消费等
//#define kETCRecharge                  @"http://www.developerplat.com/bdt.etc/EtcDriver/EtcRecgarge"                // ETC 充值
//#define kUniPayUrl                    @"http://www.developerplat.com/bdt.pay/third/cpcnPay"                        // 银行卡充值
//#define kAroundAndBreakUrl            @"http://www.developerplat.com/bdt.biz/logisticsDriver"                      // 李嘉欣编写的接口（附近、违章查询、验真）
//#define kWeiXPayUrl                   @"http://www.developerplat.com/bdt.pay/third/wechatPay?param="
//#define kBIZUrl                       @"http://www.developerplat.com/bdt.biz"
//#define KXingTianXiaUrl               @"http://wx.baoduitong.com/carDriver/toCarDetails?id="
//
//#define kApplyETCModelID                @"154"
//#define kDriverPathModelID              @"161"
//#define kBreakRulesModelID              @"165"
//#define kBaiDuMapToCityCodeModelID      @"170"


//正式

#define kNewModelUrl                  @"http://123.56.201.129:59090/app/doOperate"                             // 模型操作
#define kGetNewImgAndFileUrl          @"http://biz.baoduitong.com"                                             // 后面拼接图片路径来获取图片
#define kUploadingImgAndFile          @"http://biz.baoduitong.com/modelDriver/upLoadFile"                      // 上传图片或文件
#define kBankICONUrl                  @"http://biz.baoduitong.com/images/bank"                          // 获取银行图标
#define kNewPersonalLoginUrl          @"http://123.56.201.129:59090/app"                                       // 最新个人登陆
#define kConsumeUrl                   @"http://47.93.162.113:59091/pay/doAppConsume"                          // 积分兑换
#define kETCRecharge                  @"http://47.93.174.62:59093/EtcDriver/EtcRecgarge"                       // ETC 充值
#define kUniPayUrl                    @"http://47.93.162.113:59091/third/cpcnPay"       // 银联充值

#define kAroundAndBreakUrl            @"http://biz.baoduitong.com/logisticsDriver"                      // 李嘉欣编写的接口（附近、违章查询、验真）
#define kWeiXPayUrl                   @"http://47.93.162.113:59091/third/wechatPay?param="
#define kBIZUrl                       @"http://biz.baoduitong.com"
#define KXingTianXiaUrl               @"http://wx.baoduitong.com/carDriver/toCarDetails?id="

#define kApplyETCModelID                @"154"
#define kDriverPathModelID              @"161"
#define kBreakRulesModelID              @"165"
#define kBaiDuMapToCityCodeModelID      @"170"

    //
    // IMSDK相关的配置 -- 测试环境
#define kSdkAppId                     @"1400036641"     /// BDT里的测试
#define kSdkAccountType               @"14304"
#define busiIdDEBUG                   5539
#define busiIdRELEASE                 5538
#define busiIdCompany                 busiIdDEBUG



    ///// 不分正式 测试
    //#define KZJUrl                        @"http://ext.baoduitong.com/zj/data/getData"     /// 中交接口   只有一个URL，不分正式 测试

#define kSearch                       @"search"
#define kEditData                     @"editData"
#define kOperation                    @"operation"
#define kTerminal                     @"terminal"



#define kOperationSelect              @"0"
#define kOperationInsert              @"1"
#define kOperationUpdate              @"2"
#define kOperationDelete              @"3"
#define kOperationSelects             @"4"
#define kOperationInserts             @"5"
#define kOperationUpdates             @"6"
#define kOperationDeletes             @"7"
#define kOperationGetAndIncrement     @"8"
#define kOperationTongJiZuJian        @"9"


#pragma mark - 系统版本
    /// 判断版本
#define iOS_CURREnt_Vesion             ([[[UIDevice currentDevice] systemVersion] floatValue] )

    /// 判断是否是ios7.0以上版本
#define iOS_7_Vesion_More              ([[[UIDevice currentDevice] systemVersion] intValue] >= 7)

    /// 判断是否是ios8.0以上版本
#define iOS_8_Vesion_More              ([[[UIDevice currentDevice] systemVersion] intValue] >= 8)

    /// 判断是否是ios11.0以上版本
#define iOS_11_Vesion_More              ([[[UIDevice currentDevice] systemVersion] intValue] >= 11)

#define iOS_7_Vesion                   ([[[UIDevice currentDevice] systemVersion] intValue] == 7)
#define iOS_8_Vesion                   ([[[UIDevice currentDevice] systemVersion] intValue] == 8)
#define iOS_9_Vesion                   ([[[UIDevice currentDevice] systemVersion] intValue] == 9)
#define iOS_10_Vesion                  ([[[UIDevice currentDevice] systemVersion] intValue] == 10)






#pragma mark - 屏幕常数
    //  屏幕比例
#define MY_WSC [BDTScale shareHandle].Wsc
#define MY_HSC [BDTScale shareHandle].Hsc

    /// 获取屏幕宽度
#define  bdtScreenWidth                ([UIScreen mainScreen].bounds.size.width)

    /// 获取屏幕高度
#define  bdtScreenHeight               ((([[[UIDevice currentDevice] systemVersion] floatValue]) >= 7.0) ? ([UIScreen mainScreen].bounds.size.height) : (([UIScreen mainScreen].bounds.size.height) - (KStatusBarHeight+44)))

#define  IPHONE_X_HEIGHT               812

    /// 获取屏幕高度
#define  bdtScreenHeightFull           [UIScreen mainScreen].bounds.size.height

    /// 获取Tab高度
#define  kTabHeight                    ((NSInteger)bdtScreenHeightFull == IPHONE_X_HEIGHT ? (34+49)*MY_HSC : 49*MY_HSC)

    /// 获取Nav高度
#define  kNavHeight                    (KStatusBarHeight+44)

    /// 获取状态栏高度
#define  kStatusBarHeight              20

    //横向比例
#define WidthScale(number)             ([UIScreen mainScreen].bounds.size.width/375.*(number))
    //纵向比例
#define HeightScale(number)            ([UIScreen mainScreen].bounds.size.height/667.*(number))


#define KStatusBarHeight                 [[UIApplication sharedApplication] statusBarFrame].size.height



#pragma mark - 字号大小
#define kFontSystem(size)              [UIFont systemFontOfSize:size]
#define kFontBoldSystem(size)          [UIFont boldSystemFontOfSize:size]
#define kMainSize                      16
#define kSubSize                       14

    //导航条标题文字大小
#define kFontSizeNavigationTitle       kFontSystem(19.0f)

    //导航条按钮文字大小
#define kFontSizeNavigationBtnTitle    kFontSystem(16.0f)






#pragma mark - 颜色
    //  设置颜色
#define RGB(__r,__g,__b) [UIColor colorWithRed:(__r) / 255.0 green:(__g) / 255.0 blue:(__b) / 255.0 alpha:1]

#define RGBA(r,g,b,a)                  [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#define kColorWhite                     ([UIColor hexStringToColor:@"#ffffff" alpha:1.0f])

#define kColorBlue                      ([UIColor hexStringToColor:@"#229AEE" alpha:1.0f])

#define kColorRed                       ([UIColor hexStringToColor:@"#F56B40" alpha:1.0f])

#define kCellDetailTextColor            [UIColor hexStringToColor:@"#9a9a9a" alpha:1.0]

#define kTableViewBackground            ([UIColor hexStringToColor:@"#F5F5F5" alpha:1.0])

#define kSearchBarBackground            RGBA(240, 240, 240, 1)

#define kCellSeparatorColor             ([UIColor hexStringToColor:@"#DCDCDC" alpha:1.0])

#define kColor96                        ([UIColor hexStringToColor:@"#969696" alpha:1.0])

#define kColor4A                        ([UIColor hexStringToColor:@"#4A4A4A" alpha:1.0])

#define kColor5A                        ([UIColor hexStringToColor:@"#5A5A5A" alpha:1.0])

#define kColor2B                        ([UIColor hexStringToColor:@"#2B2B2B" alpha:1.0])

#define kColorD3                        ([UIColor hexStringToColor:@"#D3D3D3" alpha:1.0])

#define kColorBD                        ([UIColor hexStringToColor:@"#BDBDBD" alpha:1.0])

#define kColorOrange                    ([UIColor hexStringToColor:@"#F4B05E" alpha:1.0])

#define kColor2E                        ([UIColor hexStringToColor:@"#2E2E2E" alpha:1.0])
#define kColor9B                        ([UIColor hexStringToColor:@"#9B9B9B" alpha:1.0])
#define kColor9F                        ([UIColor hexStringToColor:@"#9F9F9F" alpha:1.0])


    // 颜色标注
#define UIColorFromRGB(rgbValue)        [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
    // 三原色
#define RGB_COLOR(R,G,B)                [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1]
#define RGBA_COLOR(R,G,B,A)             [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0  alpha:A]






#pragma  mark - 蓝牙指令
#define  pBluetoothTypeFindCard            @"4211B6"                    /// 寻卡
#define  pBluetoothTypeReset               @"4211B801050084000008"      /// 复位
#define  pBluetoothTypeCatalog             @"4211B8010700A40000021001"  /// 选目录
#define  pBluetoothTypeBalance             @"4211B80105805C000204"      /// 余额查询
#define  pBluetoothTypeInformation         @"4211B8010500B095002B"      /// 查询卡片信息
#define  pBluetoothTypeCheck               @"4211B801080020000003123456"      /// 圈存校验
#define  pNotifyStr                        @"00000a67-0000-1000-8000-00805f9b34fb"
#define  pWriteStr                         @"00000a66-0000-1000-8000-00805f9b34fb"

/**
 *定义系统自带方法 [UIImage imageNamed:imageName]
 * @parma 图片名称
 **/
#define kImageWithName(imageName)       [UIImage imageNamed:imageName]



#define WEAKSELF                        __weak __typeof(self) weakSelf = self;

#define STRONGSELF                      __strong __typeof(self) strongSelf = WEAKSELF;

#define FUIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]








#define MHPxConvertPt(__Px) floor((__Px) * bdtScreenWidth/375.0f)
#define MHGlobalUserDefaultAvatar [UIImage imageNamed:@"WechatIMG9"]
#define CMH_MAIN_TINTCOLOR [UIColor colorWithRed:(10 / 255.0) green:(193 / 255.0) blue:(42 / 255.0) alpha:1]



// 是否为空对象
#define MHObjectIsNil(__object)  ((nil == __object) || [__object isKindOfClass:[NSNull class]])

// 字符串为空
#define MHStringIsEmpty(__string) ((__string.length == 0) || MHObjectIsNil(__string))

// 字符串不为空
#define MHStringIsNotEmpty(__string)  (!MHStringIsEmpty(__string))

// 数组为空
#define MHArrayIsEmpty(__array) ((MHObjectIsNil(__array)) || (__array.count==0))



#endif /* BDTContants_h */
