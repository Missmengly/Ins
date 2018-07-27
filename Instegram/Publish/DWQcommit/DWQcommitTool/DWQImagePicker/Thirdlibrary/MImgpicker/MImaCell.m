//
//  MImaCell.m
//  QQImagePicker
//
//  Created by mark on 15/9/11.
//  Copyright (c) 2015年 mark. All rights reserved.
//

#import "MImaCell.h"
#import "BDTAlertView.h"

@implementation MImaCell
{

    MBoolBlock _boolBlock;
}
- (void)awakeFromNib {
    // Initialization code
    [self.btnCheckMark setImage:[UIImage imageNamed:@"ico_check_select@2x.png"] forState:UIControlStateSelected];
}

- (void)setBtnSelectedHandle:(MBoolBlock)block {

    _boolBlock = block;
}
/// 选择图片按钮
- (IBAction)actionBtn:(id)sender {
    if ([self.delegate arrayIsfulled] && !self.btnCheckMark.selected) {
        [BDTAlertView showInView:self.vc.view message:@"最多可以选择3张图片" animation:YES];
        return;
    }
    self.btnCheckMark.selected = !self.btnCheckMark.selected;
    (!_boolBlock) ?: _boolBlock(self.btnCheckMark.selected);
}

- (void)setBigImgViewWithImage:(UIImage *)img{
    if (_BigImgView) {
        return;
    }
    _BigImgView = [[UIImageView alloc]initWithImage:img];
    _BigImgView.frame = _imavHead.frame;
    [self insertSubview:_BigImgView atIndex:0];
}
@end
