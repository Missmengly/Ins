//
//  BDTAlertView.m
//  BaoDuiTong
//
//  Created by zhtt on 2017/2/13.
//  Copyright © 2017年 BDT. All rights reserved.
//

#import "BDTAlertView.h"

@implementation BDTAlertView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithMessage:(NSString *)message backView:(UIView *)view {
    
    self = [super initWithFrame:view.bounds];
    if (self) {
        _hideAfterSecond = 2;
        _backView = view;
        
        UILabel *alertLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 300, 0)];
        alertLabel.backgroundColor = [UIColor clearColor];
        alertLabel.textAlignment = NSTextAlignmentCenter;
        alertLabel.numberOfLines = 0;
        alertLabel.font = [UIFont boldSystemFontOfSize:16.0f];
        alertLabel.textColor = [UIColor whiteColor];
        alertLabel.text = message;
        [alertLabel sizeToFit];
        
        _alertView = [[UIView alloc] initWithFrame:CGRectMake((view.frame.size.width - alertLabel.frame.size.width - 54) / 2,
                                                              (view.frame.size.height - alertLabel.frame.size.height - 50) / 3 * 1,
                                                              alertLabel.frame.size.width + 54,
                                                              alertLabel.frame.size.height + 50)];
        //		_alertView.layer.borderColor = [[UIColor clearColor] CGColor];
        //		_alertView.layer.borderWidth = 2.0f;
        _alertView.layer.cornerRadius = 10.0f;
        _alertView.backgroundColor = [UIColor hexStringToColor:@"#000000" alpha:0.8];
        alertLabel.frame = CGRectMake(27, 25, _alertView.frame.size.width - 54, _alertView.frame.size.height - 50);
        [_alertView addSubview:alertLabel];
        
        _center = _alertView.center;
        
    }
    return self;
    
}

- (void)showAlert
{
    [_backView addSubview:_alertView];
    [_backView bringSubviewToFront:_alertView];
    
    [self performSelector:@selector(hideAfterView) withObject:nil afterDelay:_hideAfterSecond];
}

- (void)showAlertWithAnimation
{
    [_backView addSubview:_alertView];
    [_backView bringSubviewToFront:_alertView];
    
    [self performSelector:@selector(changeFrame) withObject:nil afterDelay:_hideAfterSecond];
    
}

+ (void)showInView:(UIView *)view message:(NSString *)message animation:(BOOL)animation
{
    
//    if([NSString isBlankString:message]){
//        return;
//    }
    
    BDTAlertView *alertView = [[BDTAlertView alloc] initWithMessage:message backView:view];
    if (animation) {
        [alertView showAlertWithAnimation];
    }
    else {
        [alertView showAlert];
    }
}

+ (void)showInView:(UIView *)view message:(NSString *)message animation:(BOOL)animation hideAfterSecond:(NSInteger)time hideFinishBlock:(void (^)())hideFinishBlock {
    
//    if([NSString isBlankString:message]){
//        return;
//    }
    
    BDTAlertView *alertView = [[BDTAlertView alloc] initWithMessage:message backView:view];
    alertView.hideFinishBlock = hideFinishBlock;
    alertView.hideAfterSecond = time;
    if (animation) {
        [alertView showAlertWithAnimation];
    }
    else {
        [alertView showAlert];
    }
}

#pragma mark - Private
- (void)changeFrame
{
    float dismissTime = 0.2;
    [UIView beginAnimations:@"alertView" context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:dismissTime];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [_alertView setFrame:CGRectMake(_alertView.center.x, _alertView.center.y, 0, 0)];
    [[_alertView.subviews lastObject] setFrame:_alertView.bounds];
    [UIView commitAnimations];
    
    [self performSelector:@selector(hideAfterView) withObject:nil afterDelay:dismissTime];
}

- (void)hideAfterView
{
    [_alertView removeFromSuperview];
    if (self.hideFinishBlock) {
        self.hideFinishBlock();
    }
}
@end
