//
//  InsPersonPageHeadView.m
//  Instegram
//
//  Created by zhtt on 2018/7/6.
//  Copyright © 2018年 ZHTT. All rights reserved.
//

#import "InsPersonPageHeadView.h"

@interface InsPersonPageHeadView ()

@property (nonatomic, strong) UIImageView   * headIV;
@property (nonatomic, strong) UILabel       * nameLabel;
@property (nonatomic, strong) UILabel       * detailLabel;

@end
@implementation InsPersonPageHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    self.backgroundColor = [UIColor whiteColor];
    
    UIImageView * bgIV = [[UIImageView alloc]init];
    bgIV.image = kImageWithName(@"Ins_PersonPage_Head");
    [self addSubview:bgIV];
    [bgIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.offset(0);
        make.height.offset(128);
    }];
    
    
    [self addSubview:self.backBtn];
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(30);
        make.left.offset(15);
        make.height.offset(30);
        make.width.offset(20);
    }];
    

    [self addSubview:self.headIV];
    [self.headIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.centerY.equalTo(bgIV.mas_bottom).offset(0);
        make.width.height.offset(84);
    }];
    

    
    [self addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headIV.mas_bottom).offset(10);
        make.left.right.offset(0);
        make.height.offset(28);
    }];
    
    //*

    
    [self addSubview:self.detailLabel];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(3);
        make.left.right.offset(0);
        make.height.offset(18);
    }];
    
    
    
    [self addSubview:self.followNumBtn];
    [self addSubview:self.fansNumBtn];
    [self addSubview:self.postNumBtn];
    
    
    
    
    /**
     *  多个控件固定间隔的等间隔排列，变化的是控件的长度或者宽度值
     *
     *  @param axisType        轴线方向
     *  @param fixedSpacing    间隔大小
     *  @param leadSpacing     头部间隔
     *  @param tailSpacing     尾部间隔
     */
    NSMutableArray * masonryArray = [NSMutableArray arrayWithObjects:self.followNumBtn,self.fansNumBtn,self.postNumBtn, nil];
    [masonryArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:(1) leadSpacing:20 tailSpacing:20];

    
    [masonryArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.detailLabel.mas_bottom).offset(15);
        make.bottom.offset(-20);
    }];
    
    
    self.followNumBtn.numLabel.text = @"20";
    self.followNumBtn.nameLabel.text = @"关注";

    self.fansNumBtn.numLabel.text = @"200";
    self.fansNumBtn.nameLabel.text = @"粉丝";
    
    self.postNumBtn.numLabel.text = @"56";
    self.postNumBtn.nameLabel.text = @"发帖";
    
    
    UIView * line = [[UIView alloc]init];
    line.backgroundColor = [UIColor hexStringToColor:@"#DCDCDC" alpha:1.0f];
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.followNumBtn.mas_top).offset(10);
        make.left.equalTo(self.followNumBtn.mas_right).offset(0);
        make.width.mas_equalTo(1);
        make.height.mas_equalTo(25);

    }];
    
    
    UIView * line1 = [[UIView alloc]init];
    line1.backgroundColor = [UIColor hexStringToColor:@"#DCDCDC" alpha:1.0f];
    [self addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fansNumBtn.mas_top).offset(10);
        make.left.equalTo(self.fansNumBtn.mas_right).offset(0);
        make.width.mas_equalTo(1);
        make.height.mas_equalTo(25);
        
    }];

}


- (UIButton *)backBtn {
    
    if (!_backBtn) {
        _backBtn = [[UIButton alloc]init];
        [_backBtn setImage:kImageWithName(@"Ins_nav_back_btn") forState:UIControlStateNormal];
    }
    return _backBtn;
}


- (UIImageView *)headIV {
    
    if (!_headIV) {
        _headIV = [[UIImageView alloc] initWithImage:kImageWithName(@"WechatIMG9")];
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
//        _nameLabel.textColor = kColor2E;
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLabel;
}


- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.text = @"鸭子太嚣张兔子太多嘴我是猪我很乖～";
        _detailLabel.font = kFontSystem(12);
        _detailLabel.textColor = kColor4A;
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        _detailLabel.numberOfLines = 0;
    }
    return _detailLabel;
}

- (InsDoubleLabelButton *)followNumBtn {
    
    if (!_followNumBtn) {
        _followNumBtn = [[InsDoubleLabelButton alloc]init];
    }
    return _followNumBtn;
}

- (InsDoubleLabelButton *)fansNumBtn {
    
    if (!_fansNumBtn) {
        _fansNumBtn = [[InsDoubleLabelButton alloc]init];
    }
    return _fansNumBtn;
}

- (InsDoubleLabelButton *)postNumBtn {
    
    if (!_postNumBtn) {
        _postNumBtn = [[InsDoubleLabelButton alloc]init];
    }
    return _postNumBtn;
}
@end
