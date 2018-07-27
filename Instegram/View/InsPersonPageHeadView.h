//
//  InsPersonPageHeadView.h
//  Instegram
//
//  Created by zhtt on 2018/7/6.
//  Copyright © 2018年 ZHTT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InsDoubleLabelButton.h"

@interface InsPersonPageHeadView : UIView

@property (nonatomic, strong) UIButton      * backBtn;
@property (nonatomic, strong) InsDoubleLabelButton      * followNumBtn;
@property (nonatomic, strong) InsDoubleLabelButton      * fansNumBtn;
@property (nonatomic, strong) InsDoubleLabelButton      * postNumBtn;

@end
