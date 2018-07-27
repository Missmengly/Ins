//
//  InsSearchView.m
//  Instegram
//
//  Created by zhtt on 2018/7/2.
//  Copyright © 2018年 ZHTT. All rights reserved.
//

#import "InsSearchView.h"

@implementation InsSearchView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
//    self.backgroundColor = [UIColor redColor];
    
    UIView * backgroundView = [[UIView alloc]init];
    backgroundView.backgroundColor = [UIColor whiteColor];
    backgroundView.layer.masksToBounds = YES;
    backgroundView.layer.cornerRadius = 17;
    [self addSubview:backgroundView];
    [backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(8);
        make.right.offset(-8);
        make.top.offset(13);
        make.bottom.offset(-13);
    }];
    
    UIImageView *searchIV = [[UIImageView alloc] initWithFrame:CGRectMake(13, 7, 19, 19)];
    searchIV.image = kImageWithName(@"Ins_search");
    [backgroundView addSubview:searchIV];
    [searchIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.offset(7);
        make.width.height.mas_equalTo(19);
    }];
    
    
    
    
    [backgroundView addSubview:self.searchTF];
    [self.searchTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(46);
        make.right.offset(-13);
        make.top.bottom.offset(0);
    }];
    
}

- (UITextField *)searchTF {
    if (!_searchTF) {
        _searchTF = [[UITextField alloc]init];
        _searchTF.backgroundColor = [UIColor whiteColor];
        _searchTF.placeholder = @"搜索用户名";
        _searchTF.font = kFontSystem(14);
//        _searchTF.delegate = self;
//        _searchTF.layer.masksToBounds = YES;
//        _searchTF.layer.cornerRadius = 22;
        [_searchTF setValue:kColor96 forKeyPath:@"_placeholderLabel.textColor"];
        _searchTF.userInteractionEnabled = YES;
    }
    return _searchTF;
}


@end
