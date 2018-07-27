//
//  UIButton+UIButtonSetEdgeInsets.h
//  UIButtonSetEdgeInsets
//
//  Created by  wJn on 04/18/16.
//  Copyright (c) 2016 wJn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CenterImageAndTitle)

//上下居中，图片在上，文字在下
- (void)verticalCenterImageAndTitle:(CGFloat)spacing;

- (void)custom:(CGFloat)spa; //默认6.0

- (void)customlu:(CGFloat)lu;//默认6.0
//左右居中，文字在左，图片在右
- (void)horizontalCenterTitleAndImage:(CGFloat)spacing;
- (void)horizontalCenterTitleAndImage; //默认6.0

//左右居中，图片在左，文字在右
- (void)horizontalCenterImageAndTitle:(CGFloat)spacing;
- (void)horizontalCenterImageAndTitle; //默认6.0

//文字居中，图片在左边
- (void)horizontalCenterTitleAndImageLeft:(CGFloat)spacing;
- (void)horizontalCenterTitleAndImageLeft; //默认6.0

//文字居中，图片在右边
- (void)horizontalCenterTitleAndImageRight:(CGFloat)spacing;
- (void)horizontalCenterTitleAndImageRight; //默认6.0

@end
