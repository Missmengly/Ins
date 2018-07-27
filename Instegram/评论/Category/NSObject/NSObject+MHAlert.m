//
//  NSObject+MHAlert.m
//  WeChat
//
//  Created by CoderMikeHe on 2017/8/14.
//  Copyright © 2017年 CoderMikeHe. All rights reserved.
//

#import "NSObject+MHAlert.h"
//#import "CMHControllerHelper.h"

@implementation NSObject (MHAlert)

+ (void)mh_showAlertViewWithTitle:(NSString *)title message:(NSString *)message confirmTitle:(NSString *)confirmTitle {
    
    [self mh_showAlertViewWithTitle:title message:message confirmTitle:confirmTitle confirmAction:NULL];
}

+ (void)mh_showAlertViewWithTitle:(NSString *)title message:(NSString *)message confirmTitle:(NSString *)confirmTitle confirmAction:(void(^)())confirmAction {
    
    [self mh_showAlertViewWithTitle:title message:message confirmTitle:confirmTitle cancelTitle:nil confirmAction:confirmAction cancelAction:NULL];
}

+ (void)mh_showAlertViewWithTitle:(NSString *)title message:(NSString *)message confirmTitle:(NSString *)confirmTitle cancelTitle:(NSString *)cancelTitle confirmAction:(void(^)())confirmAction cancelAction:(void(^)())cancelAction {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    /// 配置alertController
    alertController.titleColor =  [UIColor hexStringToColor:@"#3C3E44" alpha:1.0f];//MHColorFromHexString(@"#3C3E44");
    alertController.messageColor =  [UIColor hexStringToColor:@"#9A9A9C" alpha:1.0f];//MHColorFromHexString(@"#9A9A9C");
    
    /// 左边按钮
    if(cancelTitle.length>0){
        UIAlertAction *cancel= [UIAlertAction actionWithTitle:cancelTitle?cancelTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) { !cancelAction?:cancelAction(); }];
        cancel.textColor =  [UIColor hexStringToColor:@"#8E929D" alpha:1.0f];// MHColorFromHexString(@"#8E929D");
        [alertController addAction:cancel];
    }
    
    
    if (confirmTitle.length>0) {
        UIAlertAction *confirm = [UIAlertAction actionWithTitle:confirmTitle?confirmTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) { !confirmAction?:confirmAction();}];
        confirm.textColor = CMH_MAIN_TINTCOLOR;
        [alertController addAction:confirm];
    }
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [[CMHControllerHelper currentViewController] presentViewController:alertController animated:YES completion:NULL];
//    });
}

@end
