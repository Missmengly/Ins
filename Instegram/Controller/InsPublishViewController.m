//
//  InsPublishViewController.m
//  Instegram
//
//  Created by zhtt on 2018/7/9.
//  Copyright © 2018年 ZHTT. All rights reserved.
//

#import "InsPublishViewController.h"
#import "InsEditViewController.h"

@interface InsPublishViewController ()

@property (nonatomic, strong) UIButton    * closeBtn;
@property (nonatomic, strong) UIButton    * wordBtn;
@property (nonatomic, strong) UIButton    * picBtn;
@property (nonatomic, strong) UIButton    * videoBtn;
@property (nonatomic, strong) UIButton    * cameraBtn;

@end

@implementation InsPublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel * nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"宝 行 圈  发布";
    nameLabel.font = kFontBoldSystem(30);
    nameLabel.textColor = [UIColor hexStringToColor:@"#030303" alpha:1.0f];
    nameLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(75);
        make.left.offset(45);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(45);
    }];
    
    
    UILabel * detailLabel = [[UILabel alloc]init];
    detailLabel.text = @"圈 行 天 下";
    detailLabel.font = kFontSystem(16);
    detailLabel.textColor = [UIColor hexStringToColor:@"#A8A8A8" alpha:1.0f];
    detailLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:detailLabel];
    [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nameLabel.mas_bottom).offset(10);
        make.left.offset(45);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(18);
    }];
    
    
    [self.view addSubview:self.closeBtn];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(33);
        make.bottom.offset(-40);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    [self.closeBtn handleControlEvent:UIControlEventTouchUpInside withBlock:^{
        [self dismissViewControllerAnimated:YES completion:^{ }];
    }];
   
    
    
    [self.view addSubview:self.wordBtn];
    [self.view addSubview:self.picBtn];
    [self.view addSubview:self.videoBtn];
    [self.view addSubview:self.cameraBtn];

    
    
    NSMutableArray * masonryArray = [NSMutableArray arrayWithObjects:self.wordBtn,self.picBtn,self.videoBtn,self.cameraBtn, nil];
    [masonryArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:(1) leadSpacing:20 tailSpacing:20];
    [masonryArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(120);
        make.bottom.offset(-150);
    }];
    

    [self.wordBtn handleControlEvent:UIControlEventTouchUpInside withBlock:^{
        InsEditViewController * vc = [[InsEditViewController alloc]init];
        [self presentViewController:vc animated:YES completion:^{
            
        }];
    }];
    
}

#pragma mark - lazy
- (UIButton *)closeBtn {
    
    if (!_closeBtn) {
        _closeBtn = [[UIButton alloc]init];
        [_closeBtn setImage:kImageWithName(@"Ins_publish_close_btn") forState:UIControlStateNormal];
    }
    return _closeBtn;
}

- (UIButton *)wordBtn {
    
    if (!_wordBtn) {
        _wordBtn = [[UIButton alloc]init];
        [_wordBtn setImage:kImageWithName(@"Ins_publish_word_btn") forState:UIControlStateNormal];
        [_wordBtn setTitle:@"文字" forState:UIControlStateNormal];
        [_wordBtn setTitleColor:kColor4A forState:UIControlStateNormal];
        _wordBtn.titleLabel.font = kFontBoldSystem(13);
        _wordBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        
        
        CGFloat titleWidth = 30;
        CGFloat titleHeight = 18;

        CGFloat imageWidth = 60;
        CGFloat imageHeight = 60;
        
        _wordBtn.titleEdgeInsets = UIEdgeInsetsMake(imageHeight+10, -imageWidth, 0,0);
        _wordBtn.imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth/2, titleHeight+5, -titleWidth/2);
    }
    return _wordBtn;
}

- (UIButton *)picBtn {
    
    if (!_picBtn) {
        _picBtn = [[UIButton alloc]init];
        [_picBtn setImage:kImageWithName(@"Ins_publish_pic_btn") forState:UIControlStateNormal];
        [_picBtn setTitle:@"照片" forState:UIControlStateNormal];
        [_picBtn setTitleColor:kColor4A forState:UIControlStateNormal];
        _picBtn.titleLabel.font = kFontBoldSystem(13);
        _picBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        
        
        CGFloat titleWidth = 30;
        CGFloat titleHeight = 18;
        
        CGFloat imageWidth = 60;
        CGFloat imageHeight = 60;
        
        _picBtn.titleEdgeInsets = UIEdgeInsetsMake(imageHeight+10, -imageWidth, 0,0);
        _picBtn.imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth/2, titleHeight+5, -titleWidth/2);
    }
    return _picBtn;
}


- (UIButton *)videoBtn {
    
    if (!_videoBtn) {
        _videoBtn = [[UIButton alloc]init];
        [_videoBtn setImage:kImageWithName(@"Ins_publish_video_btn") forState:UIControlStateNormal];
        [_videoBtn setTitle:@"视频" forState:UIControlStateNormal];
        [_videoBtn setTitleColor:kColor4A forState:UIControlStateNormal];
        _videoBtn.titleLabel.font = kFontBoldSystem(13);
        _videoBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        
        
        CGFloat titleWidth = 30;
        CGFloat titleHeight = 18;
        
        CGFloat imageWidth = 60;
        CGFloat imageHeight = 60;
        
        _videoBtn.titleEdgeInsets = UIEdgeInsetsMake(imageHeight+10, -imageWidth, 0,0);
        _videoBtn.imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth/2, titleHeight+5, -titleWidth/2);
    }
    return _videoBtn;
}


- (UIButton *)cameraBtn {
    
    if (!_cameraBtn) {
        _cameraBtn = [[UIButton alloc]init];
        [_cameraBtn setImage:kImageWithName(@"Ins_publish_camera_btn") forState:UIControlStateNormal];
        [_cameraBtn setTitle:@"拍摄" forState:UIControlStateNormal];
        [_cameraBtn setTitleColor:kColor4A forState:UIControlStateNormal];
        _cameraBtn.titleLabel.font = kFontBoldSystem(13);
        _cameraBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        
        
        CGFloat titleWidth = 30;
        CGFloat titleHeight = 18;
        
        CGFloat imageWidth = 60;
        CGFloat imageHeight = 60;
        
        _cameraBtn.titleEdgeInsets = UIEdgeInsetsMake(imageHeight+10, -imageWidth, 0,0);
        _cameraBtn.imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth/2, titleHeight+5, -titleWidth/2);
    }
    return _cameraBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
