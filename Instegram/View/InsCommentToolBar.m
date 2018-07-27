//
//  InsCommentToolBar.m
//  Instegram
//
//  Created by zhtt on 2018/7/4.
//  Copyright © 2018年 ZHTT. All rights reserved.
//

#import "InsCommentToolBar.h"

@interface InsCommentToolBar ()

@property (nonatomic, strong) UITextField    * searchTF;

@property (nonatomic, strong) UIButton      * praiseBtn;
@property (nonatomic, strong) UIButton      * shareBtn;


@end

@implementation InsCommentToolBar

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
    
    
    [self addSubview:self.searchTF];
    [self.searchTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(43);
        make.right.offset(-110);
        make.top.offset(12);
        make.height.mas_equalTo(38);
    }];
    
    
    [self addSubview:self.praiseBtn];
    [self.praiseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.searchTF.mas_right).offset(20);
        make.top.offset(16);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(30);
    }];
    
    
    [self addSubview:self.shareBtn];
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-20);
        make.top.offset(16);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(30);
    }];

}


- (UITextField *)searchTF {
    if (!_searchTF) {
        _searchTF = [[UITextField alloc]init];
        _searchTF.backgroundColor = [UIColor hexStringToColor:@"#F9F9F9" alpha:1.0f];
        _searchTF.placeholder = @"输入内容评论";
        _searchTF.font = kFontSystem(14);
        [_searchTF setValue:kColor9B forKeyPath:@"_placeholderLabel.textColor"];
        _searchTF.userInteractionEnabled = YES;
        _searchTF.layer.borderWidth = 0.5f;
        _searchTF.layer.borderColor  = [UIColor hexStringToColor:@"#979797" alpha:1.0f].CGColor;
        _searchTF.layer.cornerRadius = 19;
        _searchTF.layer.masksToBounds = YES;
        _searchTF.textAlignment = NSTextAlignmentCenter;
    }
    return _searchTF;
}


- (UIButton *)praiseBtn {
    
    if (!_praiseBtn) {
        _praiseBtn = [[UIButton alloc]init];
        [_praiseBtn setImage:kImageWithName(@"Ins_praise_btn") forState:UIControlStateNormal];
        _praiseBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return _praiseBtn;
}


- (UIButton *)shareBtn {
    
    if (!_shareBtn) {
        _shareBtn = [[UIButton alloc]init];
        [_shareBtn setImage:kImageWithName(@"Ins_share_btn") forState:UIControlStateNormal];
        _shareBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return _shareBtn;
}

@end
