//
//  InsFollowCollectionViewCell.m
//  Instegram
//
//  Created by zhtt on 2018/7/5.
//  Copyright © 2018年 ZHTT. All rights reserved.
//

#import "InsFollowCollectionViewCell.h"

@interface InsFollowCollectionViewCell ()

@property (nonatomic, strong) UIImageView   * headIV;
@property (nonatomic, strong) UILabel       * nameLabel;

@end

@implementation InsFollowCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    [self.contentView addSubview:self.headIV];
    self.headIV.backgroundColor = [UIColor redColor];
    [self.headIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(60);
        make.top.offset(20);
        make.centerX.equalTo(self.mas_centerX);
    }];
    
    
    
    [self.contentView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.mas_equalTo(self.headIV.mas_bottom).offset(8);
        make.height.mas_equalTo(23);
    }];
    
    
    [self.contentView addSubview:self.followBtn];
    [self.followBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(10);
        make.width.mas_equalTo(75);
        make.height.mas_equalTo(32);
        make.centerX.equalTo(self.mas_centerX);
    }];
    
    
}

- (UIImageView *)headIV {
    
    if (!_headIV) {
        _headIV = [[UIImageView alloc] initWithImage:kImageWithName(@"WechatIMG9")];
        _headIV.layer.masksToBounds = YES;
        _headIV.layer.cornerRadius = 30;
    }
    return _headIV;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.text = @"赵某某";
        _nameLabel.font = kFontSystem(15);
        _nameLabel.textColor = kColor2E;
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLabel;
}

- (UIButton *)followBtn {
    
    if (!_followBtn) {
        _followBtn = [[UIButton alloc]init];
        [_followBtn setBackgroundImage:kImageWithName(@"Ins_unfollow_btn") forState:UIControlStateNormal];
    }
    return _followBtn;
}


@end
