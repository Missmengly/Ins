//
//  BXButton.m
//  IBoXiao_ios
//
//  Created by zhtt on 14/9/29.
//  Copyright (c) 2014年 ___boxiao___. All rights reserved.
//

#import "BXButton.h"

@implementation BXButton

- (void)setTitle:(NSString *)title forState:(UIControlState)state {

    [super setTitle:title forState:state];
    
    //重新计算偏移量
#if  __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
    __unused CGFloat stringWidth = [title sizeWithAttributes:@{NSFontAttributeName: self.titleLabel.font}].width;
#else
    __unused CGFloat stringWidth = [title sizeWithFont:self.titleLabel.font].width;
#endif
    
    UIImage *image = self.imageView.image;
    CGFloat btnWidth = ceil(stringWidth) + image.size.width + 20 >= 160 ? 160 : ceil(stringWidth) + image.size.width + 20;
    
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, btnWidth, 44.0f)];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, ceil(stringWidth)+20, 0, 0)];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, image.size.width)];
}

@end
