//
//  InsDoubleLabelButton.m
//  Instegram
//
//  Created by zhtt on 2018/7/6.
//  Copyright © 2018年 ZHTT. All rights reserved.
//

#import "InsDoubleLabelButton.h"

@implementation InsDoubleLabelButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    self.backgroundColor = kColorWhite;
    [self addSubview:self.numLabel];
    [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.offset(0);
        make.height.mas_equalTo(30);
    }];
    
    [self addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.height.mas_equalTo(20);
    }];
    
}

- (UILabel *)numLabel {
    if (!_numLabel) {
        _numLabel = [[UILabel alloc]init];
//        _numLabel.text = @"赵某某";
        _numLabel.font = kFontSystem(20);
        _numLabel.textColor = kColor4A;
        _numLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _numLabel;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
//        _nameLabel.text = @"赵某某";
        _nameLabel.font = kFontSystem(12);
        _nameLabel.textColor = kColor9B;
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLabel;
}

@end
