//
//  WLAlterView.m
//  BaoDuiTong
//
//  Created by apple on 2016/12/29.
//  Copyright © 2016年 BDT. All rights reserved.
//

#import "WLAlterView.h"
// 280*MY_WSC 宽
// 各个栏目之间的距离

@interface WLAlterView ()

/** 弹窗 */
@property(nonatomic,retain) UIView *alertView;
/** title */
@property(nonatomic,retain) UILabel *titleLbl;

/** 确认按钮 */
@property(nonatomic,retain) UIButton *sureBtn;
/** 取消按钮 */
@property(nonatomic,retain) UIButton *cancleBtn;
/** 横线 */
@property(nonatomic,retain) UIView *lineView;
/** 竖线 */
@property(nonatomic,retain) UIView *verLineView;

@end

@implementation WLAlterView

-(instancetype)initWithTitle:(NSString *)title message:(NSString *)message sureBtn:(NSString *)sureTitle cancleBtn:(NSString *)cancleTitle
{
    self = [super init];
    if(self){
        
        [self editTextTitle:title message:message sureBtn:sureTitle cancleBtn:cancleTitle];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}
- (void)setSubviewFrame{
    
    self.frame = [UIScreen mainScreen].bounds;
    self.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.6];
    self.alertView = [[UIView alloc]init];
    self.alertView.backgroundColor = [UIColor whiteColor];
    self.alertView.layer.cornerRadius = 5.0;
    self.alertView.frame = CGRectMake(0, 0, 280*MY_WSC, 100*MY_HSC);
    self.alertView.layer.position = self.center;

}

- (void)editTextTitle:(NSString *)title message:(NSString *)message sureBtn:(NSString *)sureTitle cancleBtn:(NSString *)cancleTitle{
    
    [self setSubviewFrame];

    if(title)
    {
        self.titleLbl = [self GetAdaptiveLable:CGRectMake(2*10*MY_WSC, 2*10*MY_WSC, 280*MY_WSC-4*10*MY_WSC, 20*MY_HSC) AndText:title andIsTitle:YES];
        self.titleLbl.textAlignment = NSTextAlignmentCenter;
        
        [self.alertView addSubview:self.titleLbl];
        
        CGFloat titleW = self.titleLbl.bounds.size.width;
        CGFloat titleH = self.titleLbl.bounds.size.height;
        
        self.titleLbl.frame = CGRectMake((280*MY_WSC-titleW)/2, 2*10*MY_WSC, titleW, titleH);
    }
    if (message) {
        
        self.msgLbl = [self GetAdaptiveLable:CGRectMake(10*MY_WSC, CGRectGetMaxY(self.titleLbl.frame)+10*MY_WSC, 280*MY_WSC-2*10*MY_WSC, 20*MY_HSC) AndText:message andIsTitle:NO];
        self.msgLbl.textAlignment = NSTextAlignmentCenter;
        
        [self.alertView addSubview:self.msgLbl];
        
        CGFloat msgW = self.msgLbl.bounds.size.width;
        CGFloat msgH = self.msgLbl.bounds.size.height;
        
        self.msgLbl.frame = self.titleLbl?CGRectMake((280*MY_WSC-msgW)/2, CGRectGetMaxY(self.titleLbl.frame)+10*MY_WSC, msgW, msgH):CGRectMake((280*MY_WSC-msgW)/2, 2*10*MY_WSC, msgW, msgH);
    }
    
    self.lineView = [[UIView alloc] init];
    self.lineView.frame = self.msgLbl?CGRectMake(0, CGRectGetMaxY(self.msgLbl.frame)+2*10*MY_WSC, 280*MY_WSC, 1):CGRectMake(0, CGRectGetMaxY(self.titleLbl.frame)+2*10*MY_WSC, 280*MY_WSC, 1);
    self.lineView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.6];
    [self.alertView addSubview:self.lineView];
    
    //两个按钮
    if (cancleTitle && sureTitle) {
        
        self.cancleBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        self.cancleBtn.frame = CGRectMake(0, CGRectGetMaxY(self.lineView.frame), (280*MY_WSC-1)/2, 40*MY_HSC);
        [self.cancleBtn setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.2]] forState:UIControlStateNormal];
        [self.cancleBtn setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.2]] forState:UIControlStateSelected];
        [self.cancleBtn setTitle:cancleTitle forState:UIControlStateNormal];
        //[self.cancleBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.cancleBtn.tag = 1;
        [self.cancleBtn addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
        
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.cancleBtn.bounds byRoundingCorners:UIRectCornerBottomLeft cornerRadii:CGSizeMake(5.0, 5.0)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = self.cancleBtn.bounds;
        maskLayer.path = maskPath.CGPath;
        self.cancleBtn.layer.mask = maskLayer;
        
        [self.alertView addSubview:self.cancleBtn];
    }
    
    if (cancleTitle && sureTitle) {
        self.verLineView = [[UIView alloc] init];
        self.verLineView.frame = CGRectMake(CGRectGetMaxX(self.cancleBtn.frame), CGRectGetMaxY(self.lineView.frame), 1, 40*MY_HSC);
        self.verLineView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.6];
        [self.alertView addSubview:self.verLineView];
    }
    
    if(sureTitle && cancleTitle){
        
        self.sureBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        self.sureBtn.frame = CGRectMake(CGRectGetMaxX(self.verLineView.frame), CGRectGetMaxY(self.lineView.frame), (280*MY_WSC-1)/2+1, 40*MY_HSC);
        [self.sureBtn setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:255/255.0 green:192/255.0 blue:203/255.0 alpha:0.2]] forState:UIControlStateSelected];
        [self.sureBtn setTitle:sureTitle forState:UIControlStateNormal];
        self.sureBtn.tag = 2;
        [self.sureBtn addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
        
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.sureBtn.bounds byRoundingCorners:UIRectCornerBottomRight cornerRadii:CGSizeMake(5.0, 5.0)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = self.sureBtn.bounds;
        maskLayer.path = maskPath.CGPath;
        self.sureBtn.layer.mask = maskLayer;
        
        [self.alertView addSubview:self.sureBtn];
        
    }
    
    //只有取消按钮
    if (cancleTitle && !sureTitle) {
        
        self.cancleBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        self.cancleBtn.frame = CGRectMake(0, CGRectGetMaxY(self.lineView.frame), 280*MY_WSC, 40*MY_HSC);
        [self.cancleBtn setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.2]] forState:UIControlStateNormal];
        [self.cancleBtn setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.2]] forState:UIControlStateSelected];
        [self.cancleBtn setTitle:cancleTitle forState:UIControlStateNormal];
        //[self.cancleBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.cancleBtn.tag = 1;
        [self.cancleBtn addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
        
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.cancleBtn.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(5.0, 5.0)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = self.cancleBtn.bounds;
        maskLayer.path = maskPath.CGPath;
        self.cancleBtn.layer.mask = maskLayer;
        
        [self.alertView addSubview:self.cancleBtn];
    }
    
    //只有确定按钮
    if(sureTitle && !cancleTitle){
        
        self.sureBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        self.sureBtn.frame = CGRectMake(0, CGRectGetMaxY(self.lineView.frame), 280*MY_WSC, 40*MY_HSC);
        [self.sureBtn setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.2]] forState:UIControlStateNormal];
        [self.sureBtn setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.2]] forState:UIControlStateSelected];
        [self.sureBtn setTitle:sureTitle forState:UIControlStateNormal];
        //[self.sureBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.sureBtn.tag = 2;
        [self.sureBtn addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
        
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.sureBtn.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(5.0, 5.0)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = self.sureBtn.bounds;
        maskLayer.path = maskPath.CGPath;
        self.sureBtn.layer.mask = maskLayer;
        
        [self.alertView addSubview:self.sureBtn];
        
    }
    
    //计算高度
    CGFloat alertHeight = cancleTitle?CGRectGetMaxY(self.cancleBtn.frame):CGRectGetMaxY(self.sureBtn.frame);
    self.alertView.frame = CGRectMake(0, 0, 280*MY_WSC, alertHeight);
    self.alertView.layer.position = self.center;
    
    [self addSubview:self.alertView];

}

-(UILabel *)GetAdaptiveLable:(CGRect)rect AndText:(NSString *)contentStr andIsTitle:(BOOL)isTitle
{
    UILabel *contentLbl = [[UILabel alloc] initWithFrame:rect];
    contentLbl.numberOfLines = 0;
    contentLbl.text = contentStr;
    contentLbl.textAlignment = NSTextAlignmentCenter;
    if (isTitle) {
        contentLbl.font = [UIFont boldSystemFontOfSize:16.0];
    }else{
        contentLbl.font = [UIFont systemFontOfSize:14.0];
    }
    
    NSMutableAttributedString *mAttrStr = [[NSMutableAttributedString alloc] initWithString:contentStr];
    NSMutableParagraphStyle *mParaStyle = [[NSMutableParagraphStyle alloc] init];
    mParaStyle.lineBreakMode = NSLineBreakByCharWrapping;
    [mParaStyle setLineSpacing:3.0];
    [mAttrStr addAttribute:NSParagraphStyleAttributeName value:mParaStyle range:NSMakeRange(0,[contentStr length])];
    [contentLbl setAttributedText:mAttrStr];
    [contentLbl sizeToFit];
    
    return contentLbl;
}

-(UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

#pragma mark - 弹出
-(void)showWLAlertView
{
    UIWindow *rootWindow = [UIApplication sharedApplication].keyWindow;
    [rootWindow addSubview:self];
    [self creatShowAnimation];
}

-(void)creatShowAnimation
{
    self.alertView.layer.position = self.center;
    self.alertView.transform = CGAffineTransformMakeScale(0.90, 0.90);
    [UIView animateWithDuration:0.25 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1 options:UIViewAnimationOptionCurveLinear animations:^{
        self.alertView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    } completion:^(BOOL finished) {
        
    }];
    
}

#pragma mark - 回调 只设置2 -- > 确定才回调
- (void)buttonEvent:(UIButton *)sender
{
    if(self.resIndex) {
        self.resIndex(sender.tag);
    }
        
    if (sender.tag == 2 || sender.tag == 1) {
        if (self.resultIndex) {
            self.resultIndex(sender.tag);
        }
    }
    [self removeFromSuperview];
}


@end
