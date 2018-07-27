//
//  CellForQAList.m
//  github:  https://github.com/samuelandkevin
//  CSDN:  http://blog.csdn.net/samuelandkevin
//  Created by samuelandkevin on 16/8/29.
//  Copyright © 2016年 HKP. All rights reserved.
//

#import "CellForWorkGroup.h"
#import "YHWorkGroupPhotoContainer.h"
#import "YHUserInfoManager.h"
#import "UITableViewCell+HYBMasonryAutoCellHeight.h"

const CGFloat contentLabelFontSize = 13.0;
CGFloat maxContentLabelHeight = 0;  //根据具体font而定
CGFloat kMarginContentLeft    = 10; //动态内容左边边距
CGFloat kMarginContentRight   = 10; //动态内容右边边边距
const CGFloat deleteBtnHeight = 30;
const CGFloat deleteBtnWidth  = 60;
const CGFloat moreBtnHeight   = 30;
const CGFloat moreBtnWidth    = 60;

@interface CellForWorkGroup() <HKPBotViewDelegate>

//@property (nonatomic,strong)UIImageView *imgvAvatar;
@property (nonatomic, strong) UIImageView   * headIV;
@property (nonatomic, strong) UILabel       * nameLabel;
@property (nonatomic, strong) UILabel       * timeLabel;



@property (nonatomic,strong)UILabel     *labelContent;
@property (nonatomic,strong)UILabel     *labelDelete;
@property (nonatomic,strong)UILabel     *labelMore;

@property (nonatomic,strong)YHWorkGroupPhotoContainer *picContainerView;
//@property (nonatomic,strong)UIView      *viewSeparator;

@property (nonatomic, strong) UILabel       * addressLabel;


//约束
@property (nonatomic,strong)NSLayoutConstraint *cstHeightlbMore;
@property (nonatomic,strong)NSLayoutConstraint *cstHeightlbDelete;
@property (nonatomic,strong)NSLayoutConstraint *cstCenterYlbDelete;
@property (nonatomic,strong)NSLayoutConstraint *cstLeftlbDelete;
@property (nonatomic,strong)NSLayoutConstraint *cstHeightlbContent;
@property (nonatomic,strong)NSLayoutConstraint *cstHeightPicContainer;
@property (nonatomic,strong)NSLayoutConstraint *cstTopPicContainer;
@property (nonatomic,strong)NSLayoutConstraint *cstTopViewBottom;


@property (nonatomic, strong) UIView * backgroundView;

@end

@implementation CellForWorkGroup

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setup{
    
    self.contentView.backgroundColor = RGBCOLOR(244, 244, 244);
    self.backgroundColor = RGBCOLOR(244, 244, 244);
    
    

    self.backgroundView = [[UIView alloc]init];
    self.backgroundView.backgroundColor = [UIColor whiteColor];
    self.backgroundView.layer.masksToBounds = YES;
    self.backgroundView.layer.cornerRadius = 13;
   
    
//    self.imgvAvatar = [UIImageView new];
//    self.imgvAvatar.layer.masksToBounds = YES;
//    self.imgvAvatar.userInteractionEnabled = YES;
//    UITapGestureRecognizer *tapGuesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onAvatar:)];
//    [self.imgvAvatar addGestureRecognizer:tapGuesture];

    
    
    self.labelContent = [UILabel new];
    self.labelContent.font = [UIFont systemFontOfSize:contentLabelFontSize];
    self.labelContent.numberOfLines = 0;
    
    
    self.labelDelete = [UILabel new];
    self.labelDelete.font = [UIFont systemFontOfSize:14.0f];
    self.labelDelete.textColor = RGBCOLOR(61, 95, 155);
    self.labelDelete.userInteractionEnabled = YES;
    UITapGestureRecognizer *deleteTap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(deleteTap)];
    [self.labelDelete addGestureRecognizer:deleteTap];
    
    
    self.labelMore = [UILabel new];
    self.labelMore.font = [UIFont systemFontOfSize:14.0f];
    self.labelMore.textColor = RGBCOLOR(0, 191, 143);
    self.labelMore.userInteractionEnabled = YES;
    UITapGestureRecognizer *moreTap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onMoreTap)];
    [self.labelMore addGestureRecognizer:moreTap];
    
    
    self.picContainerView = [[YHWorkGroupPhotoContainer alloc] initWithWidth:SCREEN_WIDTH-20-20-12];
    
    self.bottomBtnView = [[InsBottomBtnView alloc]init];
    
//    self.viewSeparator = [UIView new];
//    self.viewSeparator.backgroundColor = RGBCOLOR(244, 244, 244);
    
    
    
    //    [self.contentView addSubview:self.headIV];
    //    [self.contentView addSubview:self.nameLabel];
    //    [self.contentView addSubview:self.followBtn];
    //    [self.contentView addSubview:self.timeLabel];
    //    [self.contentView addSubview:self.labelContent];
    //    [self.contentView addSubview:self.labelDelete];
    //    [self.contentView addSubview:self.labelMore];
    //    [self.contentView addSubview:self.picContainerView];
    //    [self.contentView addSubview:self.addressLabel];
    //    [self.contentView addSubview:self.bottomBtnView];
    //    [self.contentView addSubview:self.viewSeparator];

    
    
    [self.contentView addSubview:self.backgroundView];
    [self.backgroundView addSubview:self.headIV];
    [self.backgroundView addSubview:self.nameLabel];
    [self.backgroundView addSubview:self.followBtn];
    [self.backgroundView addSubview:self.timeLabel];
    [self.backgroundView addSubview:self.labelContent];
    [self.backgroundView addSubview:self.labelDelete];
    [self.backgroundView addSubview:self.labelMore];
    [self.backgroundView addSubview:self.picContainerView];
    [self.backgroundView addSubview:self.addressLabel];
    [self.backgroundView addSubview:self.bottomBtnView];
//    [self.backgroundView addSubview:self.viewSeparator];

    
    
    [self layoutUI];
}

- (void)layoutUI{
    
    __weak typeof(self)weakSelf = self;
    
    [self.headIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.contentView).offset(16);
        make.left.offset(19);
        make.width.height.mas_equalTo(42);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(19);
        make.left.equalTo(weakSelf.headIV.mas_right).offset(11);
        make.right.offset(-85);
    }];
    
    
    [self.followBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(21);
        make.width.mas_equalTo(75);
        make.height.mas_equalTo(32);
        make.right.offset(-18);
    }];
  

    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headIV.mas_right).offset(11);
        make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(-2);
        make.height.mas_equalTo(21);
        make.right.offset(-85);
    }];

    

    _cstHeightlbContent = [NSLayoutConstraint constraintWithItem:self.labelContent attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationLessThanOrEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    [self.contentView addConstraint:_cstHeightlbContent];
    [self.labelContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.headIV.mas_bottom).offset(14);
        make.left.offset(20);//equalTo(weakSelf.contentView).
        make.right.offset(-20);
        make.bottom.equalTo(weakSelf.labelMore.mas_top).offset(-11);
    }];
    
    
    
    // 不然在6/6plus上就不准确了
    self.labelContent.preferredMaxLayoutWidth = SCREEN_WIDTH - 20 - 20 - 12;
    
    _cstHeightlbMore = [NSLayoutConstraint constraintWithItem:self.labelMore attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    [self.contentView addConstraint:_cstHeightlbMore];
    [self.labelMore mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.labelContent.mas_bottom).offset(5);
        make.left.offset(20);
        make.width.mas_equalTo(80);
    }];
    
    
    _cstHeightlbDelete = [NSLayoutConstraint constraintWithItem:self.labelDelete attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    [self.contentView addConstraint:_cstHeightlbDelete];
    _cstCenterYlbDelete = [NSLayoutConstraint constraintWithItem:self.labelDelete attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.labelMore attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    [self.contentView addConstraint:_cstCenterYlbDelete];
    _cstLeftlbDelete    = [NSLayoutConstraint constraintWithItem:self.labelDelete attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.labelMore attribute:NSLayoutAttributeRight multiplier:1.0 constant:10];
    [self.contentView addConstraint:_cstLeftlbDelete];
    [self.labelDelete mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(80);
    }];
    
    _cstHeightPicContainer = [NSLayoutConstraint constraintWithItem:self.picContainerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    [self.contentView addConstraint:_cstHeightPicContainer];
    _cstTopPicContainer = [NSLayoutConstraint constraintWithItem:self.picContainerView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.labelMore attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10];
    [self.contentView addConstraint:_cstTopPicContainer];
    
    [self.picContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(18);
        make.right.mas_greaterThanOrEqualTo(weakSelf.contentView).offset(-24);
    }];
    [self.picContainerView setContentHuggingPriority:249 forAxis:UILayoutConstraintAxisVertical];
    [self.picContainerView setContentCompressionResistancePriority:749 forAxis:UILayoutConstraintAxisVertical];
    
    _cstTopViewBottom = [NSLayoutConstraint constraintWithItem:self.addressLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.picContainerView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    _cstTopViewBottom.priority = UILayoutPriorityDefaultLow;
    [self.contentView addConstraint:_cstTopViewBottom];

    
    
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(20);
        make.right.offset(-20);
        make.height.mas_equalTo(17);
    }];
    
    
    [self.bottomBtnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.addressLabel.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(48);
    }];
  
    
    
//    [self.viewSeparator mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(weakSelf.bottomBtnView.mas_bottom);
//        make.left.right.mas_equalTo(0);
//        make.height.mas_equalTo(15);
//    }];
    
    
    [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.contentView).offset(6);
        make.right.equalTo(weakSelf.contentView).offset(-6);
        make.top.equalTo(weakSelf.contentView).offset(0);
        make.bottom.equalTo(self.bottomBtnView.mas_bottom).offset(0);
    }];
    
    
//    self.hyb_lastViewInCell = self.viewSeparator;
}

- (void)setModel:(YHWorkGroup *)model{
    
    _model = model;
    
    [self.headIV sd_setImageWithURL:_model.userInfo.avatarUrl placeholderImage:[UIImage imageNamed:@"WechatIMG9"]];
    self.nameLabel.text = _model.userInfo.userName;
    self.timeLabel.text = _model.publishTime;
//    self.labelCompany.text  = _model.userInfo.company;
    
    /*************动态内容*************/
    maxContentLabelHeight   = _labelContent.font.pointSize * 6;
    self.labelContent.text  = _model.msgContent;
    
    //查看详情按钮
    self.labelMore.text     = @"查看全部";
    CGFloat moreBtnH = 0;
    if (_model.shouldShowMoreButton) { // 如果文字高度超过60
        moreBtnH = moreBtnHeight;
        
        if (_model.isOpening) { // 如果需要展开
            
            _labelMore.text = @"收起";
            _cstHeightlbContent.constant = HUGE;
        } else {
            _labelMore.text = @"查看全部";
            _cstHeightlbContent.constant = maxContentLabelHeight;
        }
    }else{
            _cstHeightlbContent.constant = maxContentLabelHeight;
    }
    
    //删除按钮
    self.labelDelete.text   = @"删除";
    CGFloat delBtnH = 0;
    if ([_model.userInfo.uid isEqualToString:[YHUserInfoManager sharedInstance].userInfo.uid]) {
        delBtnH = deleteBtnHeight;
    }
    
    //更新“查看详情”和“删除按钮”的约束
    _cstHeightlbMore.constant   = moreBtnH;
    _cstHeightlbDelete.constant = delBtnH;
    
    if (moreBtnH) {
        _cstLeftlbDelete.constant    = 10;
        _cstCenterYlbDelete.constant = 0;
    }else{
        _cstLeftlbDelete.constant    = -80;
        _cstCenterYlbDelete.constant = 11;
    }
    
    
    
    CGFloat picTop = 0;
    if (moreBtnH) {
        picTop = 10;
    }else if(delBtnH && !moreBtnH){
        picTop = 30;
    }else{
        picTop = 0;
    }
    
    _cstTopPicContainer.constant    = picTop;
    
    
    CGFloat picContainerH = [self.picContainerView setupPicUrlArray:_model.thumbnailPicUrls];
    self.picContainerView.picOriArray = _model.originalPicUrls;
    
    _cstHeightPicContainer.constant = picContainerH;
    
    CGFloat viewBottomTop = 0;
    if(_model.thumbnailPicUrls.count){
        viewBottomTop = 15;
    }
    _cstTopViewBottom.constant = viewBottomTop;
    
    
    /*
    _viewBottom.btnLike.selected = _model.isLike? YES: NO;
    [_viewBottom.btnComment setTitle:[NSString stringWithFormat:@"%d",_model.commentCount] forState:UIControlStateNormal];//评论数
    [_viewBottom.btnLike setTitle:[NSString stringWithFormat:@"%d",_model.likeCount] forState:UIControlStateNormal];          //点赞数
     */
}

#pragma mark - Action
- (void)onMoreTap {
    
    if (_delegate && [_delegate respondsToSelector:@selector(onMoreInCell:)]) {
        [_delegate onMoreInCell:self];
    }
}

- (void)deleteTap {
    
    if (_delegate && [_delegate respondsToSelector:@selector(onDeleteInCell:)]) {
        [_delegate onDeleteInCell:self];
    }
}

#pragma mark - Gesture

- (void)onAvatar:(UITapGestureRecognizer *)recognizer{
    
    if(recognizer.state == UIGestureRecognizerStateEnded){
        if (_delegate && [_delegate respondsToSelector:@selector(onAvatarInCell:)]) {
            [_delegate onAvatarInCell:self];
        }
    }
}

#pragma mark - HKPBotViewDelegate
- (void)onAvatar{
    
}

- (void)onMore{
    
}

- (void)onComment{
    if (_delegate && [_delegate respondsToSelector:@selector(onCommentInCell:)]) {
        [_delegate onCommentInCell:self];
    }
}

- (void)onLike{
    if (_delegate && [_delegate respondsToSelector:@selector(onLikeInCell:)]) {
        [_delegate onLikeInCell:self];
    }
}

- (void)onShare{
    if (_delegate && [_delegate respondsToSelector:@selector(onShareInCell:)]) {
        [_delegate onShareInCell:self];
    }
}

#pragma mark - lazy
- (UIImageView *)headIV {
    
    if (!_headIV) {
        _headIV = [[UIImageView alloc] initWithImage:kImageWithName(@"WechatIMG9")];
        _headIV.layer.masksToBounds = YES;
        _headIV.layer.cornerRadius = 21;
        _headIV.backgroundColor = [UIColor cyanColor];
    }
    return _headIV;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.text = @"赵某某";
        _nameLabel.font = [UIFont systemFontOfSize:14];
//        _nameLabel.textColor = kColor2E;
        _nameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _nameLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.text = @"10分钟前";
        _timeLabel.font = [UIFont systemFontOfSize:11];
//        _timeLabel.textColor = kColor9B;
        _timeLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _timeLabel;
}

- (UIButton *)followBtn {
    
    if (!_followBtn) {
        _followBtn = [[UIButton alloc]init];
        [_followBtn setBackgroundImage:[UIImage imageNamed:@"Ins_unfollow_btn"] forState:UIControlStateNormal];
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
