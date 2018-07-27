//
//  InsDynamicDetailsTableViewCell.m
//  Instegram
//
//  Created by zhtt on 2018/7/4.
//  Copyright © 2018年 ZHTT. All rights reserved.
//

#import "InsDynamicDetailsTableViewCell.h"

@interface InsDynamicDetailsTableViewCell () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@property (nonatomic, strong) UIImageView   * headIV;
@property (nonatomic, strong) UILabel       * nameLabel;
@property (nonatomic, strong) UILabel       * timeLabel;
@property (nonatomic, strong) UILabel       * detailLabel;

@property (nonatomic, strong) UILabel       * addressLabel;

@property (nonatomic, strong) UICollectionView    * collectionView;

@end


@implementation InsDynamicDetailsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    self.backgroundColor = [UIColor whiteColor];
    
    
    /* ------------------头部------------------------*/
    
    [self addSubview:self.headIV];
    self.headIV.backgroundColor = [UIColor redColor];
    [self.headIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(19);
        make.width.height.mas_equalTo(42);
        make.top.offset(16);
    }];
    
    
    
    [self addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headIV.mas_right).offset(11);
        make.top.offset(19);
        make.height.mas_equalTo(21);
        make.right.offset(-85);
    }];
    
    
    
    [self addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headIV.mas_right).offset(11);
        make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(-2);
        make.height.mas_equalTo(21);
        make.right.offset(-85);
    }];
    
    
    
    
    [self addSubview:self.followBtn];
    [self.followBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(21);
        make.width.mas_equalTo(75);
        make.height.mas_equalTo(32);
        make.right.offset(-18);
    }];
    
    
    
    
    /* ------------------内容------------------------*/
    
    [self addSubview:self.detailLabel];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(20);
        make.right.offset(-20);
        make.top.offset(72);
        make.height.mas_equalTo(50);
    }];
    
    
    /* ------------------地址------------------------*/
    [self addSubview:self.addressLabel];
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(18);
        make.right.offset(-20);
        make.bottom.offset(-48);
        make.height.mas_equalTo(17);
    }];
    
    /* ------------------点赞------------------------*/
    
    UILabel * praiseLabel = [[UILabel alloc]init];
    praiseLabel.textColor = kColor9F;
    praiseLabel.font = kFontSystem(14);
    praiseLabel.text = @"点赞";
    [self addSubview:praiseLabel];
    [praiseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(18);
        make.bottom.offset(0);
        //        make.height.mas_equalTo(20);
        make.top.mas_equalTo(self.addressLabel.mas_bottom).offset(0);
        make.width.mas_equalTo(30);
    }];
    
    
    
    /* ---------------- 推荐的人 ----------------- */
    UICollectionViewFlowLayout *friendLayout = [[UICollectionViewFlowLayout alloc] init];
    friendLayout.itemSize = CGSizeMake(30, 30);
    friendLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    friendLayout.minimumInteritemSpacing = 0;// 最小列间距
    friendLayout.minimumLineSpacing = 10;// 最小行间距
    friendLayout.sectionInset = UIEdgeInsetsMake( 0, 0, 0, 0); // 设置额外滚动区域
    
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:friendLayout]; /// 80*MY_HSC
    self.collectionView.backgroundColor = [UIColor redColor];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.addressLabel.mas_bottom).offset(10);
        make.right.offset(-25);
        make.left.mas_equalTo(praiseLabel.mas_right).offset(15);
        make.height.mas_equalTo(30);
    }];
    self.collectionView.backgroundColor = kColorWhite;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
}


#pragma mark - - - collectionView Delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section  {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor cyanColor];
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 15;
    
    UIImageView * iv = [[UIImageView alloc]initWithImage:kImageWithName(@"5")];
    [cell.contentView addSubview:iv];
    [iv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.with.insets(UIEdgeInsetsZero);
    }];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
}


- (UIImageView *)headIV {
    
    if (!_headIV) {
        _headIV = [[UIImageView alloc] initWithImage:kImageWithName(@"2")];
        _headIV.layer.masksToBounds = YES;
        _headIV.layer.cornerRadius = 21;
    }
    return _headIV;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.text = @"赵某某";
        _nameLabel.font = kFontSystem(15);
        _nameLabel.textColor = kColor2E;
        _nameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _nameLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.text = @"10分钟前";
        _timeLabel.font = kFontSystem(11);
        _timeLabel.textColor = kColor9B;
        _timeLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _timeLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.text = @"像一棵海草海草，海草海草，随波飘摇，海草海草海草海草浪花里舞蹈～";
        _detailLabel.font = kFontSystem(14);
        //        _detailLabel.textColor = [];
        _detailLabel.textAlignment = NSTextAlignmentLeft;
        _detailLabel.numberOfLines = 0;
    }
    return _detailLabel;
}

- (UIButton *)followBtn {
    
    if (!_followBtn) {
        _followBtn = [[UIButton alloc]init];
        [_followBtn setBackgroundImage:kImageWithName(@"Ins_unfollow_btn") forState:UIControlStateNormal];
    }
    return _followBtn;
}


- (UILabel *)addressLabel {
    if (!_addressLabel) {
        _addressLabel = [[UILabel alloc]init];
        _addressLabel.text = @"北京市朝阳区百子湾沿海赛洛城";
        _addressLabel.font = kFontSystem(12);
        _addressLabel.textColor = kColor9B;
        _addressLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _addressLabel;
}

@end
