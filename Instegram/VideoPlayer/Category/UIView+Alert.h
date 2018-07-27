//
//  UIView+Alert.h
//  NiuPlayer
//
//  Created by hxiongan on 2018/3/1.
//  Copyright © 2018年 hxiongan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MMMaterialDesignSpinner/MMMaterialDesignSpinner.h>

@interface UIView (Alert)

//! 撑满view加载{}
- (void)showFullLoading;
- (void)hideFullLoading;
- (void)showFullLoadingWithTip:(NSString *)tip;

//!错误信息view{}
- (void)showErrorWithTip:(NSString *)tip tipImage:(NSString *)imageName buttonTitle:(NSString *)title retryAction:(void (^)(void))block;
//!刷新重试view{}
- (void)showRetryWithTip:(NSString *)tip retryAction:(void (^)(void))block;
- (void)hideErroMsgView;






@end
