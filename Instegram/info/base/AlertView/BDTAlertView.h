//
//  BDTAlertView.h
//  BaoDuiTong
//
//  Created by zhtt on 2017/2/13.
//  Copyright © 2017年 BDT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface BDTAlertView : UIView{
    UIView		*_backView;
    UIView		*_alertView;
    CGPoint		_center;
    NSInteger	_hideAfterSecond;
}

@property (nonatomic, assign) NSInteger hideAfterSecond;
@property (nonatomic, copy)   void (^hideFinishBlock) (void);

- (id)initWithMessage:(NSString *)message backView:(UIView *)view;
- (void)showAlert;
- (void)showAlertWithAnimation;

+ (void)showInView:(UIView *)view message:(NSString *)message animation:(BOOL)animation;
+ (void)showInView:(UIView *)view message:(NSString *)message animation:(BOOL)animation hideAfterSecond:(NSInteger)time hideFinishBlock:(void (^)())hideFinishBlock;


@end
