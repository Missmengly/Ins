//
//  InsEditViewController.m
//  Instegram
//
//  Created by zhtt on 2018/7/9.
//  Copyright © 2018年 ZHTT. All rights reserved.
//

#import "InsEditViewController.h"

@interface InsEditViewController ()<UITextViewDelegate>

@property (nonatomic, strong) UIButton              * closeBtn;
@property (nonatomic, strong) UIButton              * publishBtn;
@property (nonatomic, strong) UITextView            * addressTV;
@property (nonatomic, strong) UILabel               * addressLabel;

@end

@implementation InsEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UILabel * nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"发布动态";
    nameLabel.font = kFontSystem(17);
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(20);
        make.left.offset(80);
        make.right.offset(-80);
        make.height.mas_equalTo(44);
    }];
    
    
    [self.view addSubview:self.closeBtn];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(20);
        make.left.offset(20);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(44);
    }];
    
    [self.closeBtn handleControlEvent:UIControlEventTouchUpInside withBlock:^{
        [self dismissViewControllerAnimated:YES completion:^{ }];
    }];
    
    

    [self.view addSubview:self.publishBtn];
    [self.publishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(20);
        make.right.offset(-20);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(44);
    }];
    
    
    self.addressTV = [[UITextView alloc]init];
    self.addressTV.text = @"输入文字…";
    self.addressTV.font = kFontSystem(14);
    self.addressTV.textColor = [UIColor hexStringToColor:@"#BFBFBF" alpha:1.0f];
    self.addressTV.delegate = self;
    [self.view addSubview:self.addressTV];
    [self.addressTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(20);
        make.right.offset(-20);
        make.top.mas_equalTo(nameLabel.mas_bottom).offset(10);
        make.height.mas_equalTo(80);
    }];
    

    
    [self initPickerView];
    
    
    UIImageView * addressIV = [[UIImageView alloc]initWithImage:kImageWithName(@"Ins_location_btn")];
    addressIV.contentMode = UIViewContentModeCenter;
    [self.view addSubview:addressIV];
    [addressIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(305);
        make.left.offset(24);
//        make.width.mas_equalTo(15*1.1);
//        make.height.mas_equalTo(18*1.1);
        make.width.height.mas_equalTo(20);
    }];
    
    
    [self.view addSubview:self.addressLabel];
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(addressIV.mas_right).offset(5);
        make.right.offset(-20);
        make.top.offset(305);
        make.height.mas_equalTo(20);
    }];
    
    

}


#pragma mark - UITextViewDelegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    if ([textView.text isEqualToString:@"输入文字…"]) {
        textView.text = @"";
    }
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    return YES;
}

-(void)textViewDidEndEditing:(UITextView *)textView {
    if (textView.text.length <1) {
        textView.text = @"输入文字…";
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if (range.location < 130) {
        return  YES;
    } else  if ([textView.text isEqualToString:@"\n"]) {
        //这里写按了ReturnKey 按钮后的代码
        return NO;
    }
    
    if (textView.text.length == 130) {
        return NO;
    }
    
    return YES;
}


#pragma mark - lazy
- (UIButton *)closeBtn {
    
    if (!_closeBtn) {
        _closeBtn = [[UIButton alloc]init];
        [_closeBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_closeBtn setTitleColor:[UIColor hexStringToColor:@"#9B9B9B" alpha:1.0f] forState:UIControlStateNormal];
        _closeBtn.titleLabel.font = kFontSystem(15);
    }
    return _closeBtn;
}

- (UIButton *)publishBtn {
    
    if (!_publishBtn) {
        _publishBtn = [[UIButton alloc]init];
        [_publishBtn setTitle:@"发布" forState:UIControlStateNormal];
        [_publishBtn setTitleColor:[UIColor hexStringToColor:@"#0C85EE" alpha:1.0f] forState:UIControlStateNormal];
        _publishBtn.titleLabel.font = kFontSystem(15);
    }
    return _publishBtn;
}

- (UILabel *)addressLabel {
    
    if (!_addressLabel) {
        _addressLabel = [[UILabel alloc]init];
        _addressLabel.font = kFontSystem(15);
        _addressLabel.text = @"当前位置";
    }
    return _addressLabel;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
