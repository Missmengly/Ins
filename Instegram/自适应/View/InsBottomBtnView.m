//
//  InsBottomBtnView.m
//  HKPTimeLine
//
//  Created by zhtt on 2018/7/5.
//  Copyright © 2018年 YHSoft. All rights reserved.
//

#import "InsBottomBtnView.h"

@interface InsBottomBtnView ()


@property (nonatomic, strong) UIButton      * praiseBtn;
@property (nonatomic, strong) UIButton      * commentBtn;
@property (nonatomic, strong) UIButton      * collectBtn;
@property (nonatomic, strong) UIButton      * shareBtn;


@end
@implementation InsBottomBtnView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    [self addSubview:self.praiseBtn];
    [self addSubview:self.commentBtn];
    [self addSubview:self.collectBtn];
    [self addSubview:self.shareBtn];
    
    
    NSMutableArray * masonryArray = [NSMutableArray arrayWithObjects:self.praiseBtn,self.commentBtn,self.collectBtn,self.shareBtn, nil];
    [masonryArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:(1) leadSpacing:20 tailSpacing:20];
    [masonryArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
    }];
}

- (UIButton *)praiseBtn {
    
    if (!_praiseBtn) {
        _praiseBtn = [[UIButton alloc]init];
        [_praiseBtn setImage:kImageWithName(@"Ins_praise_btn") forState:UIControlStateNormal];
        [_praiseBtn setTitle:@"23" forState:UIControlStateNormal];
        [_praiseBtn setTitleColor:kColor9F forState:UIControlStateNormal];
        _praiseBtn.titleLabel.font = kFontSystem(14);
        _praiseBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _praiseBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0);
        
    }
    return _praiseBtn;
}

- (UIButton *)commentBtn {
    
    if (!_commentBtn) {
        _commentBtn = [[UIButton alloc]init];
        [_commentBtn setImage:kImageWithName(@"Ins_comment_btn") forState:UIControlStateNormal];
        [_commentBtn setTitle:@"23" forState:UIControlStateNormal];
        [_commentBtn setTitleColor:kColor9F forState:UIControlStateNormal];
        _commentBtn.titleLabel.font = kFontSystem(14);
        _commentBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _commentBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0);
        
    }
    return _commentBtn;
}

- (UIButton *)collectBtn {
    
    if (!_collectBtn) {
        _collectBtn = [[UIButton alloc]init];
        [_collectBtn setImage:kImageWithName(@"Ins_uncollect_btn") forState:UIControlStateNormal];
        [_collectBtn setTitle:@"收藏" forState:UIControlStateNormal];
        [_collectBtn setTitleColor:kColor9F forState:UIControlStateNormal];
        _collectBtn.titleLabel.font = kFontSystem(14);
        _collectBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _collectBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0);
        
    }
    return _collectBtn;
}

- (UIButton *)shareBtn {
    
    if (!_shareBtn) {
        _shareBtn = [[UIButton alloc]init];
        [_shareBtn setImage:kImageWithName(@"Ins_share_btn") forState:UIControlStateNormal];
        [_shareBtn setTitle:@"分享" forState:UIControlStateNormal];
        [_shareBtn setTitleColor:kColor9F forState:UIControlStateNormal];
        _shareBtn.titleLabel.font = kFontSystem(14);
        _shareBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        _shareBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -3);
        
    }
    return _shareBtn;
}
@end
