//
//  BXNavTitleView.m
//  IBoXiao_ios
//
//  Created by zhtt on 14-3-26.
//  Copyright (c) 2014年 ___boxiao___. All rights reserved.
//

#import "BXNavTitleView.h"

@implementation BXNavTitleView

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {

        self.opaque = NO;
        self.backgroundColor = [UIColor clearColor];
        self.titleColor = kColor5A;
        self.titleFont = kFontSystem(16);
        
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    [self.titleColor set];

    CGSize size = [self.title sizeWithAttributes:@{NSFontAttributeName:self.titleFont}];

//   [self.title drawInRect:CGRectMake(0, (rect.size.height - size.height) / 2.0f, rect.size.width, size.height) withFont:self.titleFont lineBreakMode:NSLineBreakByWordWrapping | NSLineBreakByTruncatingTail  alignment:NSTextAlignmentCenter];
    
    NSMutableParagraphStyle* paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping | NSLineBreakByTruncatingTail;
    paragraphStyle.alignment = NSTextAlignmentCenter;

    NSDictionary*attribute = @{NSFontAttributeName:self.titleFont,NSParagraphStyleAttributeName:paragraphStyle};
    
    [self.title drawInRect:CGRectMake(0, (rect.size.height - size.height) / 2.0f, rect.size.width, size.height) withAttributes:attribute];
    
}

- (void)setTitle:(NSString *)title {
    if (_title != title) {
        _title = title;
        [self setNeedsDisplay];
    }
}


@end
