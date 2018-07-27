//
//  InsFollowSuccessViewController.m
//  Instegram
//
//  Created by zhtt on 2018/7/5.
//  Copyright © 2018年 ZHTT. All rights reserved.
//

#import "InsFollowSuccessViewController.h"

@interface InsFollowSuccessViewController ()

@property (nonatomic, strong) UIImageView      * backgroundView;
@property (nonatomic, strong) UIButton          * sureBtn;     /// 确认
@property (nonatomic, strong) UIButton      * followBtn;
@property (nonatomic, strong) UIButton      * cancleBtn;

@end

@implementation InsFollowSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];

}

- (void)setupUI {
    
    [self.view addSubview:self.backgroundView];
    self.backgroundView.userInteractionEnabled = YES;
    [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.width.mas_equalTo(273);
        make.height.mas_equalTo(196);
    }];
    
    
    UILabel * nameLabel = [[UILabel alloc]init];
    nameLabel.font = kFontSystem(18);
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [self.backgroundView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.offset(20);
        make.height.mas_equalTo(25);
    }];
    
    
    UILabel * subLabel = [[UILabel alloc]init];
    subLabel.font = kFontSystem(14);
    subLabel.textColor = kColor4A;
    subLabel.textAlignment = NSTextAlignmentCenter;
    subLabel.numberOfLines = 0;
    [self.backgroundView addSubview:subLabel];
    [subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.offset(80);
        make.height.mas_equalTo(46);
    }];
    
    /// 我知道了
    [self.backgroundView addSubview:self.sureBtn];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(144);
        make.height.mas_equalTo(26);
        make.bottom.offset(-24);
    }];
    [self.sureBtn handleControlEvent:UIControlEventTouchUpInside withBlock:^{
        [self.navigationController dismissViewControllerAnimated:NO completion:^{}];
    }];
    
    
    /// 我心软了
    [self.backgroundView addSubview:self.followBtn];
    [self.followBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(34);
        make.width.mas_equalTo(95);
        make.height.mas_equalTo(26);
        make.bottom.offset(-24);
    }];
    [self.followBtn handleControlEvent:UIControlEventTouchUpInside withBlock:^{
        [self.navigationController dismissViewControllerAnimated:NO completion:^{}];
    }];
    
    
    /// 坚决取消
    [self.backgroundView addSubview:self.cancleBtn];
    [self.cancleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-34);
        make.width.mas_equalTo(95);
        make.height.mas_equalTo(26);
        make.bottom.offset(-24);
    }];
    [self.cancleBtn handleControlEvent:UIControlEventTouchUpInside withBlock:^{
        [self.navigationController dismissViewControllerAnimated:NO completion:^{}];
    }];
    
    
    
    
    if (self.isSuccess) {
        nameLabel.text = @"关注成功！";
        subLabel.text = @"您已成功关注该卡友\n 不可以变心哦～拉钩！";
        self.sureBtn.hidden = NO;
        self.followBtn.hidden = YES;
        self.cancleBtn.hidden = YES;
    }else{
        nameLabel.text = @"取消关注";
        subLabel.text = @"你变心了～\n不过我会在这里等你重新关注的";
        self.sureBtn.hidden = YES;
        self.followBtn.hidden = NO;
        self.cancleBtn.hidden = NO;
    }
    
    
}

#pragma mark - lazy
- (UIImageView *)backgroundView {
    
    if (!_backgroundView) {
        _backgroundView = [[UIImageView alloc] initWithImage:kImageWithName(@"Ins_followSuccess_head")];
        _backgroundView.layer.masksToBounds = YES;
        _backgroundView.layer.cornerRadius = 21;
    }
    return _backgroundView;
}


- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [[UIButton alloc]init];
        [_sureBtn setBackgroundImage:kImageWithName(@"") forState:UIControlStateNormal];
        [_sureBtn setBackgroundColor:[UIColor hexStringToColor:@"#1CBBF8" alpha:1.0f]];
        [_sureBtn setTitle:@"我已了解" forState:UIControlStateNormal];
        [_sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _sureBtn.titleLabel.font = kFontSystem(14);
        _sureBtn.layer.masksToBounds = YES;
        _sureBtn.layer.cornerRadius = 13;
    }
    return _sureBtn;
}

- (UIButton *)followBtn {
    if (!_followBtn) {
        _followBtn = [[UIButton alloc]init];
        [_followBtn setBackgroundImage:kImageWithName(@"") forState:UIControlStateNormal];
        [_followBtn setBackgroundColor:[UIColor hexStringToColor:@"#E5E5E5" alpha:1.0f]];
        [_followBtn setTitle:@"我心软了" forState:UIControlStateNormal];
        [_followBtn setTitleColor:kColor4A forState:UIControlStateNormal];
        _followBtn.titleLabel.font = kFontSystem(14);
        _followBtn.layer.masksToBounds = YES;
        _followBtn.layer.cornerRadius = 13;
    }
    return _followBtn;
}

- (UIButton *)cancleBtn {
    if (!_cancleBtn) {
        _cancleBtn = [[UIButton alloc]init];
        [_cancleBtn setBackgroundImage:kImageWithName(@"") forState:UIControlStateNormal];
        [_cancleBtn setBackgroundColor:[UIColor hexStringToColor:@"#1CBBF8" alpha:1.0f]];
        [_cancleBtn setTitle:@"坚决取消" forState:UIControlStateNormal];
        [_cancleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _cancleBtn.titleLabel.font = kFontSystem(14);
        _cancleBtn.layer.masksToBounds = YES;
        _cancleBtn.layer.cornerRadius = 13;
    }
    return _cancleBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
