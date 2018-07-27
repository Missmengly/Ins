//
//  WLAlterView.h
//  BaoDuiTong
//
//  Created by apple on 2016/12/29.
//  Copyright © 2016年 BDT. All rights reserved.
//  alterView

#import <UIKit/UIKit.h>

typedef void(^AlertResult)(NSInteger index);
typedef void(^ZhttResult)(NSInteger index);
@interface WLAlterView : UIView

@property(nonatomic,copy) AlertResult resultIndex;
@property(nonatomic,copy) ZhttResult  resIndex;
/** 内容 */
@property(nonatomic,retain) UILabel *msgLbl;

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message sureBtn:(NSString *)sureTitle cancleBtn:(NSString *)cancleTitle;

- (instancetype)init ;

-(void)showWLAlertView;

- (void)editTextTitle:(NSString *)title message:(NSString *)message sureBtn:(NSString *)sureTitle cancleBtn:(NSString *)cancleTitle ;

@end
