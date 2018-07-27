//
//  InsShowTableViewCell.m
//  Instegram
//
//  Created by zhtt on 2018/7/2.
//  Copyright © 2018年 ZHTT. All rights reserved.
//

#import "InsShowTableViewCell.h"

//#import <PLPlayerKit/PLPlayerKit.h>


@interface InsRecommendContentView ()


@end

@implementation InsRecommendContentView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    self.backgroundColor = [UIColor clearColor];

    
    
    UIView * line = [[UIView alloc]init];
    line.backgroundColor = kCellSeparatorColor;
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(19);
        make.right.offset(-19);
        make.bottom.offset(0);
        make.height.mas_equalTo(0.5);
    }];
    
    
    
    UILabel * nameLabel = [[UILabel alloc]init];
    nameLabel.font = kFontSystem(16);
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.text = @"推荐的贴子";
    [self addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(18);
        make.right.offset(-19);
        make.top.offset(13);
        make.height.mas_equalTo(22);
    }];
    
    
    
    UILabel * subLabel = [[UILabel alloc]init];
    subLabel.font = kFontSystem(11);
    subLabel.textColor = [UIColor hexStringToColor:@"#9B9B9B" alpha:1.0f];
    subLabel.text = @"掐指一算，又有新鲜～";
    [self addSubview:subLabel];
    [subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(18);
        make.right.offset(-19);
        make.top.offset(38);
        make.height.mas_equalTo(16);
    }];
    
}

@end


#pragma mark -------------------------- InsShowTableViewCell -------------------------------------

@interface InsShowTableViewCell () ///<PLPlayerDelegate>

//@property (nonatomic, strong) PLPlayer  *player;

@property (nonatomic, strong) UIImageView   * headIV;
@property (nonatomic, strong) UILabel       * nameLabel;
@property (nonatomic, strong) UILabel       * timeLabel;
@property (nonatomic, strong) UIButton      * followBtn;
@property (nonatomic, strong) UILabel       * detailLabel;

@property (nonatomic, strong) UILabel       * addressLabel;

/// 视频  1张图片  多张图片

//@property (nonatomic, strong) PLMediaInfo *media;
///**
// 视频播放器
// */
//@property (nonatomic, strong) PLPlayerView *playerView;



@property (nonatomic, strong) UIButton      * praiseBtn;
@property (nonatomic, strong) UIButton      * commentBtn;
@property (nonatomic, strong) UIButton      * collectBtn;
@property (nonatomic, strong) UIButton      * shareBtn;


@end

#define  kHeight    62

@implementation InsShowTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];

    
    UIView * backgroundView = [[UIView alloc]init];
    backgroundView.backgroundColor = [UIColor whiteColor];
    backgroundView.layer.masksToBounds = YES;
    backgroundView.layer.cornerRadius = 13;
    [self.contentView addSubview:backgroundView];
    [backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(6);
        make.right.offset(-6);
        make.top.bottom.offset(0);
    }];
    
    
    InsRecommendContentView * recommendView = [[InsRecommendContentView alloc]init];
    [backgroundView addSubview:recommendView];
    [recommendView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.height.mas_equalTo(kHeight);
        make.top.offset(0);
    }];
    
    
    /* ------------------头部------------------------*/
    
    [backgroundView addSubview:self.headIV];
    self.headIV.backgroundColor = [UIColor redColor];
    [self.headIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(19);
        make.width.height.mas_equalTo(42);
        make.top.offset(16 + kHeight);
    }];
    
    
    
    [backgroundView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headIV.mas_right).offset(11);
        make.top.offset(19 + kHeight);
        make.height.mas_equalTo(21);
        make.right.offset(-85);
    }];
    
    
    
    [backgroundView addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headIV.mas_right).offset(11);
        make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(-2);
        make.height.mas_equalTo(21);
        make.right.offset(-85);
    }];
    
    
    
    
    [backgroundView addSubview:self.followBtn];
    [self.followBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(21+kHeight);
        make.width.mas_equalTo(75);
        make.height.mas_equalTo(32);
        make.right.offset(-18);
    }];
    
    
    
    
    /* ------------------内容------------------------*/
    
    [backgroundView addSubview:self.detailLabel];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(20);
        make.right.offset(-20);
        make.top.offset(72 + kHeight);
        make.height.mas_equalTo(50);
    }];
    
    
//    self.playerView = [[PLPlayerView alloc] init];
//    self.playerView.delegate = self;
//    [self addSubview:self.playerView];
//    [self.playerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.offset(125 + kHeight);
//        make.left.offset(18);
//        make.right.offset(-18);
//        make.height.mas_equalTo(213);
//    }];
//
    /*
    
    PLPlayerOption *option = [PLPlayerOption defaultOption];
    [option setOptionValue:@15 forKey:PLPlayerOptionKeyTimeoutIntervalForMediaPackets];
    NSURL *url = [NSURL URLWithString:@"http://test-10.qiniudn.com/20160818172321video"];
    self.player = [PLPlayer playerWithURL:url option:option];
    self.player.delegate = self;
    self.player.backgroundPlayEnable = YES;
    [backgroundView addSubview:self.player.playerView];
    [self.player.playerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(125 + kHeight);
        make.left.offset(18);
        make.right.offset(-18);
        make.height.mas_equalTo(213);
    }];
    
 */
    
    /* ------------------地址------------------------*/
    [backgroundView addSubview:self.addressLabel];
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(18);
        make.right.offset(-20);
        make.bottom.offset(-48);
        make.height.mas_equalTo(17);
    }];
    
    
    /* ------------------按钮------------------------*/
    UIView * btnBgView = [[UIView alloc]init];
    btnBgView.backgroundColor = [UIColor clearColor];
    [backgroundView addSubview:btnBgView];
    [btnBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.height.mas_equalTo(48);
    }];
    
    
    

    [btnBgView addSubview:self.praiseBtn];
    [btnBgView addSubview:self.commentBtn];
    [btnBgView addSubview:self.collectBtn];
    [btnBgView addSubview:self.shareBtn];
    
    
//    UIView * blankView = [[UIView alloc]init];
//    [btnBgView addSubview:blankView];


    NSMutableArray * masonryArray = [NSMutableArray arrayWithObjects:self.praiseBtn,self.commentBtn,self.collectBtn,self.shareBtn, nil];
    [masonryArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:(1) leadSpacing:20 tailSpacing:20];
    [masonryArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
    }];
    
   
    [self.shareBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClick {
    
    NSLog(@" ------------------- 播放 ----------------------");

//    [self.player play];
}

- (UIImageView *)headIV {
    
    if (!_headIV) {
        _headIV = [[UIImageView alloc] initWithImage:kImageWithName(@"WechatIMG9")];
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
