//
//  BXNavigationItemHelper.h
//  IBoXiao_ios
//
//  Created by zhtt on 14-3-26.
//  Copyright (c) 2014年 ___boxiao___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BXNavTitleView.h"
#import "BXButton.h"
#import "XLSlideSwitch.h"

@interface BXNavigationItemHelper : NSObject

+ (UIButton *)setupCancleButtonWithController:(UIViewController *)viewController;

/**
 * 注意:
 * 返回值为关闭按钮本身
 */
+ (UIButton *)setupCloseButton;
/**
 * 设置左item为返回按钮
 * 返回值为按钮本身
 */
+ (UIButton *)setupReturnButtonWithController:(UIViewController *)viewController;

/**
 * 设置左边item 图片
 * 返回值为按钮本身
 */
+ (UIButton *)setupLeftBtnItemWitController:(UIViewController *)viewController backImage:(UIImage *)image;

// 左侧自定义文字按钮
+ (UIButton *)setLeftBtnTitle:(NSString *)title withController:(UIViewController *)viewController;

/**
 * 设置左item为取消按钮
 * 返回值为按钮本身
 */
+ (UIButton *)setupCancelButtonWithController:(UIViewController *)viewController;

/**
 * 设置右item为带右箭头的按钮，文字内容可自定义
 * 返回值为按钮本身
 */
+ (UIButton *)setupNextButtonWithController:(UIViewController *)viewController withTitle:(NSString *)title;


// 右侧自定义文字按钮
+ (UIButton *)setupRightButtonWithController:(UIViewController *)viewController withTitle:(NSString *)title;

// 右侧自定义文字图片按钮
+ (UIButton *)setupRightButtonWithController:(UIViewController *)viewController withTitle:(NSString *)title withImage:(UIImage *)image;

/**
 * 设置右item为完成按钮
 * 返回值为按钮本身
 */
+ (UIButton *)setupDoneButtonWitController:(UIViewController *)viewController;

/**
 * 设置右item为发送按钮
 * 返回值为按钮本身
 */
+ (UIButton *)setupSendButtonWitController:(UIViewController *)viewController;
/**
 * 设置右item为发布按钮
 * 返回值为按钮本身
 */

+ (UIButton *)setupReleaseButtonWitController:(UIViewController *)viewController;

/**
 * 设置右item为操作按钮
 * 返回值为按钮本身
 */
+ (UIButton *)setupOperationButtonWitController:(UIViewController *)viewController;
/**
 * 设置右item 按照图片
 * 返回值为按钮本身
 */
+ (UIButton *)setupRightBtnItemWitController:(UIViewController *)viewController backImage:(UIImage *)image;

/**
 * 设置右item 按照图片
 * 返回值为按钮本身
 */
+ (UIButton *)setupRightBtnItemWitController:(UIViewController *)viewController backImage:(UIImage *)image highlightImage:(UIImage*)lightImage;

/**
 * 设置标题
 * 只提供了文字内容设置
 * 返回值titleView,类型LSNavTitleView
 */
+ (BXNavTitleView *)setupTitleViewWithController:(UIViewController *)viewController title:(NSString *)title;

/**
 *  设置导航控制器标题、可点击
 *
 *  @param viewController VC
 *  @param title          标题
 *
 *  @return               UIButton
 */
+ (BXButton *)setupBtnTitleViewWithController:(UIViewController *)viewController title:(NSString *)title;

/**
 * 获得分享按钮
 */
+ (UIButton *)getShareItemButton;


/**
 * 获得设置按钮
 */
+ (UIButton *)getSettingItemButton;

/**
 * 设置分享按钮
 */
+ (UIButton *)setupShareButtonWithController:(UIViewController *)viewController;

/**
 *  设置右item为带右箭头的按钮，文字内容可自定义
 *
 *  @param viewController   调用这个按钮的页面
 *  @param title          文字内容
 *  @param color          文字颜色
 *
 *  @return     返回值为按钮本身
 */
+ (UIButton *)setupNextButtonWithController:(UIViewController *)viewController withTitle:(NSString *)title textColor:(UIColor *)color;

/**
 * 完成  带颜色
 */
+ (UIButton *)setupDoneButtonWitController:(UIViewController *)viewController textColor:(UIColor *)color;

+ (XLSlideSwitch *)setupNavTitleSelectBtnWitController:(NSArray *)viewControllers withTitleArray:(NSArray *)titleArray;

@end
