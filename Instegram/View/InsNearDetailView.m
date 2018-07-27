//
//  InsNearDetailView.m
//  Instegram
//
//  Created by zhtt on 2018/7/4.
//  Copyright © 2018年 ZHTT. All rights reserved.
//

#import "InsNearDetailView.h"


@implementation InsNearDetailView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    UIView * backgroundView = [[UIView alloc]init];
    backgroundView.backgroundColor = [UIColor whiteColor];
    backgroundView.layer.masksToBounds = YES;
    backgroundView.layer.cornerRadius = 13;
    [self addSubview:backgroundView];
    [backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(8);
        make.right.offset(-8);
        make.height.mas_equalTo(193);
        make.bottom.offset(0);
    }];
    
    
    
    [self addSubview:self.headIV];
    self.headIV.backgroundColor = [UIColor redColor];
    [self.headIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(29);
        make.width.height.mas_equalTo(84);
        make.top.offset(0);
    }];
    
    
    
    [backgroundView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headIV.mas_right).offset(40);
        make.top.offset(12);
        make.height.mas_equalTo(28);
        make.right.offset(-75);
    }];
    
    
    
    [backgroundView addSubview:self.distanceLabel];
    [self.distanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headIV.mas_right).offset(40);
        make.top.offset(15);
        make.height.mas_equalTo(28);
        make.right.offset(-15);
    }];
    
    
    
    [backgroundView addSubview:self.detailLabel];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.offset(60);
        make.height.mas_equalTo(22);
    }];
    
    
    
    [backgroundView addSubview:self.followBtn];
    [self.followBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(90);
        make.bottom.offset(-20);
        make.height.mas_equalTo(32);
        make.right.offset(-90);
    }];
    
    
    
    [backgroundView addSubview:self.signLabel];
    [self.signLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.bottom.offset(-80);
        make.height.mas_equalTo(20);
    }];
    
}

- (UIButton *)headIV {
    
    if (!_headIV) {
        _headIV = [[UIButton alloc] init];
        [_headIV setImage:kImageWithName(@"WechatIMG9") forState:UIControlStateNormal];
        _headIV.layer.masksToBounds = YES;
        _headIV.layer.cornerRadius = 42;
    }
    return _headIV;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.text = @"赵某某";
        _nameLabel.font = kFontSystem(20);
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _nameLabel;
}

- (UILabel *)distanceLabel {
    if (!_distanceLabel) {
        _distanceLabel = [[UILabel alloc]init];
        _distanceLabel.text = @"12km";
        _distanceLabel.font = kFontSystem(14);
        _distanceLabel.textColor = kColor4A;
        _distanceLabel.textAlignment = NSTextAlignmentRight;
    }
    return _distanceLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.text = @"20关注   |   30粉丝  |    0发帖  ";
        _detailLabel.font = kFontSystem(16);
        _detailLabel.textColor = kColor4A;
        _detailLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _detailLabel;
}

- (UILabel *)signLabel {
    if (!_signLabel) {
        _signLabel = [[UILabel alloc]init];
        _signLabel.text = @"签名：暂未设置";
        _signLabel.font = kFontSystem(14);
        _signLabel.textColor = kColor4A;
        _signLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _signLabel;
}

- (UIButton *)followBtn {
    
    if (!_followBtn) {
        _followBtn = [[UIButton alloc]init];
        [_followBtn setTitle:@"加关注" forState:UIControlStateNormal];
        [_followBtn setTitleColor:kColorWhite forState:UIControlStateNormal];
        _followBtn.layer.cornerRadius = 16;
        _followBtn.layer.masksToBounds = YES;
        _followBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        _followBtn.titleLabel.font = kFontSystem(14);
        _followBtn.backgroundColor = [UIColor hexStringToColor:@"#0C85EE" alpha:1.0f];
    }
    return _followBtn;
}



@end
