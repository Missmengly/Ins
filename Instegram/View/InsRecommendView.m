//
//  InsRecommendView.m
//  Instegram
//
//  Created by zhtt on 2018/7/3.
//  Copyright © 2018年 ZHTT. All rights reserved.
//

#import "InsRecommendView.h"

@interface InsRecommendView () 

@end
@implementation InsRecommendView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}


- (void)setupUI {
    
    self.backgroundColor = [UIColor clearColor];
    
    
    UIView * backgroundView = [[UIView alloc]init];
    backgroundView.backgroundColor = [UIColor whiteColor];
    backgroundView.layer.masksToBounds = YES;
    backgroundView.layer.cornerRadius = 13;
    [self addSubview:backgroundView];
    [backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(6);
        make.right.offset(-6);
        make.top.bottom.offset(0);
    }];
    
    
    
    
    UIView * line = [[UIView alloc]init];
    line.backgroundColor = kCellSeparatorColor;
    [backgroundView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(19);
        make.right.offset(-19);
        make.top.offset(57);
        make.height.mas_equalTo(0.5);
    }];
    
    
    
    UILabel * nameLabel = [[UILabel alloc]init];
    nameLabel.font = kFontSystem(16);
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.text = @"推荐的人";
    [backgroundView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(18);
        make.right.offset(-19);
        make.top.offset(8);
        make.height.mas_equalTo(22);
    }];
    
    
    
    UILabel * subLabel = [[UILabel alloc]init];
    subLabel.font = kFontSystem(11);
    subLabel.textColor = [UIColor hexStringToColor:@"#9B9B9B" alpha:1.0f];
    subLabel.text = @"志趣相投，半熟也贴心～";
    [backgroundView addSubview:subLabel];
    [subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(18);
        make.right.offset(-19);
        make.top.offset(33);
        make.height.mas_equalTo(16);
    }];
    
    
    [self addSubview:self.moreBtn];
    [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-25);
        make.top.offset(13);
        make.height.mas_equalTo(16);
        make.width.mas_equalTo(80);

    }];
    
    
    /* ---------------- 推荐的人 ----------------- */
    UICollectionViewFlowLayout *friendLayout = [[UICollectionViewFlowLayout alloc] init];
    friendLayout.itemSize = CGSizeMake(44, 44);
    friendLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    friendLayout.minimumInteritemSpacing = 0;// 最小列间距
    friendLayout.minimumLineSpacing = 15;// 最小行间距
    friendLayout.sectionInset = UIEdgeInsetsMake( 0, 0, 0, 0); // 设置额外滚动区域
    
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:friendLayout]; /// 80*MY_HSC
    [backgroundView addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(line.mas_bottom).offset(0.5);
        make.right.offset(-20);
        make.left.offset(20);
        make.height.mas_equalTo(72);
    }];
    self.collectionView.backgroundColor = kColorWhite;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
}



- (UIButton *)moreBtn {
    
    if (!_moreBtn) {
        _moreBtn = [[UIButton alloc]init];
        [_moreBtn setImage:kImageWithName(@"Ins_more_btn") forState:UIControlStateNormal];
        [_moreBtn setTitle:@"更多" forState:UIControlStateNormal];
        [_moreBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _moreBtn.titleLabel.font = kFontSystem(14);
        _moreBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        _moreBtn.imageEdgeInsets = UIEdgeInsetsMake(0,30, 0, -30);
        _moreBtn.titleEdgeInsets = UIEdgeInsetsMake(0,-10, 0, 10);
    }
    return _moreBtn;
}

@end
