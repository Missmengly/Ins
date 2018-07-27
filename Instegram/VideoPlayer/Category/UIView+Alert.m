//
//  UIView+Alert.m
//  NiuPlayer
//
//  Created by hxiongan on 2018/3/1.
//  Copyright © 2018年 hxiongan. All rights reserved.
//

#import "UIView+Alert.h"

@implementation UIView (Alert)

#define loadingTag 999999
#define fullLoadingTag 888888
#define errorViewTag 666666
#define tipTag 47298749




#pragma mark--Alert



- (void)showFullLoading
{    [self showFullLoadingWithTip:@""];
}

-(void)showFullLoadingWithTip:(NSString *)tip{
    UIView *loadingView = [self viewWithTag:fullLoadingTag];
    if (loadingView) {
//        [loadingView removeFromSuperview];
//        loadingView = nil;
        return;
    }
    loadingView = [[UIView alloc] initWithFrame:self.bounds];
    loadingView.tag = fullLoadingTag;
    [self addSubview:loadingView];
    [loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    MMMaterialDesignSpinner *spinner = [[MMMaterialDesignSpinner alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    spinner.center = loadingView.center;
    spinner.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    spinner.tintColor = [UIColor whiteColor];// [YIMStyleManager blackColor:0.4];
    [loadingView addSubview:spinner];
    [self bringSubviewToFront:loadingView];
    [spinner startAnimating];
    
    if (tip.length) {
     
        UILabel * loadingLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 80, 150, 20)];
        loadingLabel.text=tip;
        loadingLabel.textColor= [UIColor colorWithRed:.2 green:.2 blue:.8 alpha:1];//[YIMStyleManager blackColor:0.4];
        loadingLabel.textAlignment=NSTextAlignmentCenter;
        loadingLabel.font=[UIFont systemFontOfSize:12];
        loadingLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        [loadingView addSubview:loadingLabel];
        [loadingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(spinner.mas_bottom).mas_offset(40);
            make.leading.trailing.mas_equalTo(loadingView);
            make.height.mas_equalTo(@20);
        }];
    }
}

- (void)hideFullLoading
{
    __block UIView *loadingView = [self viewWithTag:fullLoadingTag];
    if (loadingView) {
        [UIView transitionWithView:self duration:0.3f options:UIViewAnimationOptionTransitionCrossDissolve animations:^(void) {
            [loadingView removeFromSuperview];
        } completion:^(BOOL finished) {
            loadingView = nil;
        }];
    }
}

- (void)showRetryWithTip:(NSString *)tip retryAction:(void (^)(void))block
{
    [self showErrorWithTip:tip tipImage:@"bg_error" buttonTitle:NSLocalizedString(@"刷新", "刷新") retryAction:block];
}

- (void)showErrorWithTip:(NSString *)tip tipImage:(NSString *)imageName buttonTitle:(NSString *)title retryAction:(void (^)(void))block
{
    [self hideErroMsgView];
    
    UIView *errorView = [UIView new];
    errorView.backgroundColor = [UIColor whiteColor];
    errorView.tag = errorViewTag;
    [self addSubview:errorView];
    [errorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    UILabel *tipLabel = [UILabel new];
    tipLabel.text = tip;
    tipLabel.numberOfLines = 0;
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.font = [UIFont systemFontOfSize:15];
    tipLabel.textColor = [self subTitleColor];
    [errorView addSubview:tipLabel];
    [tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(errorView);
        make.left.mas_equalTo(errorView).mas_offset(10);
        make.right.mas_equalTo(errorView).mas_offset(-10);
        make.height.mas_equalTo(30);
    }];
    
    UIImage *image = [UIImage imageNamed:imageName];
    UIImageView *tipImageView = [UIImageView new];
    tipImageView.image = image;
    [errorView addSubview:tipImageView];
    [tipImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(tipLabel.mas_top).mas_equalTo(-30);
        make.centerX.mas_equalTo(errorView);
        make.width.mas_equalTo(image.size.width);
        make.height.mas_equalTo(image.size.height);
    }];
    
    UIButton *retryBtn = [UIButton new];
    [retryBtn setTitle:title forState:UIControlStateNormal];
    [retryBtn setTitleColor:[self subTitleColor] forState:UIControlStateNormal];
    retryBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    retryBtn.layer.borderColor = [self subTitleColor].CGColor;
    retryBtn.layer.borderWidth = 1.;
    retryBtn.layer.cornerRadius = 15.;
    [errorView addSubview:retryBtn];
    [retryBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(tipLabel.mas_bottom).mas_offset(8);
        make.centerX.mas_equalTo(tipLabel);
        make.size.mas_equalTo(CGSizeMake(120, 30));
    }];
    
    [self bringSubviewToFront:errorView];
}

- (void)hideErroMsgView
{
    UIView *errorView = [self viewWithTag:errorViewTag];
    if (errorView) {
        [errorView removeFromSuperview];
        errorView = nil;
    }
}

- (UIColor *)mainColor
{
    return [UIColor colorWithRed:0.160 green:0.736 blue:0.727 alpha:1.000];
}

- (UIColor *)titleColor
{
    return [UIColor colorWithRed:60./255. green:60./255. blue:60./255. alpha:1.];
}

- (UIColor *)subTitleColor
{
    return [UIColor colorWithRed:101./255. green:101./255. blue:101./255. alpha:1.];
}


@end
