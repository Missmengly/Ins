//
//  BXNavigationItemHelper.m
//  IBoXiao_ios
//
//  Created by zhtt on 14-3-26.
//  Copyright (c) 2014年 ___boxiao___. All rights reserved.
//

#import "BXNavigationItemHelper.h"
//#define kFontSizeNavigationBtnTitle       kFontSystem(13.0f)

@implementation BXNavigationItemHelper

+ (XLSlideSwitch *)setupNavTitleSelectBtnWitController:(NSArray *)viewControllers withTitleArray:(NSArray *)titleArray{
    
    XLSlideSwitch *titleView  = [[XLSlideSwitch alloc] initWithFrame:CGRectMake(0, 0, 150, 44) Titles:titleArray viewControllers:viewControllers];
    
    //设置按钮选中和未选中状态的标题颜色
    titleView.itemSelectedColor = UIColorFromRGB(0xd0021b);
    titleView.itemNormalColor = [UIColor blackColor];
    //标题横向间距
    titleView.customTitleSpacing = 30;
    
    
    [viewControllers[0] navigationItem].titleView = titleView;
    [viewControllers[0] navigationController].navigationBar.barTintColor = [UIColor hexStringToColor:@"#FFFFFF" alpha:1.0f];
    
    
    return titleView;
}


+ (UIButton *)setupCancleButtonWithController:(UIViewController *)viewController
{
    
    CGSize returnSize;
    //    if (iOS_7_Vesion) {
    //        returnSize = [NSLocalizedString(@"返回", @"") sizeWithAttributes:@{NSFontAttributeName: kFontSizeNavigationBtnTitle}];
    //    } else {
    //
    //        returnSize = [NSLocalizedString(@"返回", @"") sizeWithFont:kFontSizeNavigationBtnTitle constrainedToSize:CGSizeMake(300, MAXFLOAT) lineBreakMode:NSLineBreakByCharWrapping];
    //    }
    UIImage *returnImage = [UIImage imageNamed:@"buttonItem_back"];
    UIButton *returnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [returnBtn setImage:returnImage forState:UIControlStateNormal];
    [returnBtn setImage:returnImage forState:UIControlStateHighlighted];
    if (iOS_7_Vesion_More) {
        [returnBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
        [returnBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
    }
    //    [returnBtn setTitle:NSLocalizedString(@"返回", @"") forState:UIControlStateNormal];
    //    [returnBtn setTitleColor:kColorWhite forState:UIControlStateNormal];
    //    [returnBtn.titleLabel setFont:kFontSizeNavigationBtnTitle];
    [returnBtn setFrame:CGRectMake(0, 0, returnSize.width + returnImage.size.width, 44)];
    [returnBtn setBackgroundColor:[UIColor clearColor]];
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:returnBtn];
    viewController.navigationItem.leftBarButtonItem = buttonItem;
    
    return returnBtn;
}

+ (UIButton *)setupReturnButtonWithController:(UIViewController *)viewController
{
    
    CGSize returnSize;
    if (iOS_7_Vesion_More) {
        returnSize = [NSLocalizedString(@"返回", @"") sizeWithAttributes:@{NSFontAttributeName: kFontSizeNavigationBtnTitle}];
    } else {
        
        returnSize = [NSLocalizedString(@"返回", @"") sizeWithFont:kFontSizeNavigationBtnTitle constrainedToSize:CGSizeMake(300, MAXFLOAT) lineBreakMode:NSLineBreakByCharWrapping];
    }//导航条按钮文字大小
    

    UIImage *returnImage = [UIImage imageNamed:@"sp_nav_return"];
    UIButton *returnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [returnBtn setImage:returnImage forState:UIControlStateNormal];
    [returnBtn setImage:returnImage forState:UIControlStateHighlighted];
    if (iOS_7_Vesion_More) {
        [returnBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
        [returnBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
    }
    [returnBtn setTitle:NSLocalizedString(@"返回", @"") forState:UIControlStateNormal];
    [returnBtn setTitleColor:kColorWhite forState:UIControlStateNormal];
    [returnBtn.titleLabel setFont:kFontSizeNavigationBtnTitle];
    [returnBtn setFrame:CGRectMake(0, 0, returnSize.width + returnImage.size.width, 44)];
    [returnBtn setBackgroundColor:[UIColor clearColor]];
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:returnBtn];
    viewController.navigationItem.leftBarButtonItem = buttonItem;
    
    return returnBtn;
}

+ (UIButton *)setupLeftBtnItemWitController:(UIViewController *)viewController backImage:(UIImage *)image {
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:image forState:UIControlStateNormal];
    
    
    
    if (iOS_7_Vesion_More)
        [leftBtn setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    else{
        [leftBtn setFrame:CGRectMake(0, 0, image.size.width + 10, image.size.height)];
        [leftBtn  setImageEdgeInsets : UIEdgeInsetsMake ( 0 , 5 , 0 , 0 )];
    }
    
    [leftBtn setAdjustsImageWhenHighlighted:NO];
    UIBarButtonItem *btn_left = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    UIBarButtonItem *negativeleft = [[UIBarButtonItem alloc]
                                     initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                     target:nil action:nil];
    /**
     *  width为负数时，相当于btn向右移动width数值个像素，由于按钮本身和边界间距为5pix，所以width设为-5时，间距正好调整
     *  为0；width为正数时，正好相反，相当于往左移动width数值个像素
     */
    negativeleft.width = -8;
    viewController.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeleft, btn_left, nil];
    
    
    return leftBtn;
}

+ (UIButton *)setLeftBtnTitle:(NSString *)title withController:(UIViewController *)viewController {
    
    UIButton *returnBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [returnBtn setTitle:NSLocalizedString(title, @"") forState:UIControlStateNormal];
    [returnBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [returnBtn.titleLabel setFont:kFontSizeNavigationBtnTitle];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:returnBtn];
    viewController.navigationItem.leftBarButtonItem = buttonItem;
    
    return returnBtn;
}

+ (UIButton *)setupCloseButton {
    
    CGSize returnSize;
    if (iOS_7_Vesion_More) {
        returnSize = [NSLocalizedString(@"关闭", @"") sizeWithAttributes:@{NSFontAttributeName: kFontSizeNavigationBtnTitle}];
    } else {
        
        returnSize = [NSLocalizedString(@"关闭", @"") sizeWithFont:kFontSizeNavigationBtnTitle constrainedToSize:CGSizeMake(300, MAXFLOAT) lineBreakMode:NSLineBreakByCharWrapping];
    }
    UIButton *returnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [returnBtn setTitle:NSLocalizedString(@"关闭", @"") forState:UIControlStateNormal];
    [returnBtn setTitleColor:kColorWhite forState:UIControlStateNormal];
    [returnBtn.titleLabel setFont:kFontSizeNavigationBtnTitle];
    
    if (iOS_7_Vesion_More)
    {
        [returnBtn setFrame:CGRectMake(0, 0, returnSize.width - 3, 44)];
        [returnBtn setTitleEdgeInsets: UIEdgeInsetsMake ( 0 , -3 , 0 , 0 )];
    }
    else{
        [returnBtn setFrame:CGRectMake(0, 0, returnSize.width + 7, 44)];
        //        [leftBtn setFrame:CGRectMake(0, 0, image.size.width + 10, image.size.height)];
        [returnBtn setTitleEdgeInsets: UIEdgeInsetsMake ( 0 , 7 , 0 , 0 )];
    }
    [returnBtn setBackgroundColor:[UIColor clearColor]];
    return returnBtn;
}


+ (UIButton *)setupCancelButtonWithController:(UIViewController *)viewController {
    
    CGSize returnSize;
    if (iOS_7_Vesion_More) {
        returnSize = [NSLocalizedString(@"取消", @"") sizeWithAttributes:@{NSFontAttributeName: kFontSizeNavigationBtnTitle}];
    } else {
        
        returnSize = [NSLocalizedString(@"取消", @"") sizeWithFont:kFontSizeNavigationBtnTitle constrainedToSize:CGSizeMake(300, MAXFLOAT) lineBreakMode:NSLineBreakByCharWrapping];
    }
    UIButton *returnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [returnBtn setTitle:NSLocalizedString(@"取消", @"") forState:UIControlStateNormal];
    [returnBtn setTitleColor:kColorWhite forState:UIControlStateNormal];
    [returnBtn.titleLabel setFont:kFontSizeNavigationBtnTitle];
    
    if (iOS_7_Vesion_More)
    {
        [returnBtn setFrame:CGRectMake(0, 0, returnSize.width - 3, 44)];
        [returnBtn setTitleEdgeInsets: UIEdgeInsetsMake ( 0 , -3 , 0 , 0 )];
    }
    else{
        [returnBtn setFrame:CGRectMake(0, 0, returnSize.width + 7, 44)];
//        [leftBtn setFrame:CGRectMake(0, 0, image.size.width + 10, image.size.height)];
        [returnBtn setTitleEdgeInsets: UIEdgeInsetsMake ( 0 , 7 , 0 , 0 )];
    }
    [returnBtn setBackgroundColor:[UIColor clearColor]];
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:returnBtn];
    viewController.navigationItem.leftBarButtonItem = buttonItem;
    
    return returnBtn;
}

+ (UIButton *)setupNextButtonWithController:(UIViewController *)viewController withTitle:(NSString *)title{
    
    CGSize returnSize;
    if (iOS_7_Vesion_More) {
        returnSize = [NSLocalizedString(title, @"") sizeWithAttributes:@{NSFontAttributeName: kFontSizeNavigationBtnTitle}];
    } else {
        
        returnSize = [NSLocalizedString(title, @"") sizeWithFont:kFontSizeNavigationBtnTitle constrainedToSize:CGSizeMake(300, MAXFLOAT) lineBreakMode:NSLineBreakByCharWrapping];
    }
    
    UIImage *returnImage = [UIImage imageNamed:@"return_btn_r.png"];
    UIButton *returnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [returnBtn setImage:returnImage forState:UIControlStateNormal];
    [returnBtn setImage:returnImage forState:UIControlStateHighlighted];
    if (iOS_7_Vesion_More) {
        [returnBtn setImageEdgeInsets:UIEdgeInsetsMake(0, returnSize.width, 0, 0)];
        [returnBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -returnImage.size.width, 0, 0)];
    }
    [returnBtn setTitle:NSLocalizedString(title, @"") forState:UIControlStateNormal];
    [returnBtn setTitleColor:kColorWhite forState:UIControlStateNormal];
    [returnBtn.titleLabel setFont:kFontSizeNavigationBtnTitle];
//    [returnBtn setFrame:CGRectMake(0, 0, returnSize.width + returnImage.size.width, 44)];
    [returnBtn setBackgroundColor:[UIColor clearColor]];
    
    if (iOS_7_Vesion_More)
        [returnBtn setFrame:CGRectMake(0, 0, returnSize.width + returnImage.size.width, 44)];
    else
    {
        [returnBtn setFrame:CGRectMake(0, 0, returnSize.width + returnImage.size.width + 10, 44)];
        [returnBtn  setImageEdgeInsets : UIEdgeInsetsMake ( 0 , -10 , 0 , 0 )];
    }

    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:returnBtn];
    viewController.navigationItem.rightBarButtonItem = buttonItem;
    
    return returnBtn;
}

+ (UIButton *)setupRightButtonWithController:(UIViewController *)viewController withTitle:(NSString *)title{
    
    CGSize returnSize;
    if (iOS_7_Vesion_More) {
        returnSize = [NSLocalizedString(title, @"") sizeWithAttributes:@{NSFontAttributeName: kFontSizeNavigationBtnTitle}];
    } else {
        returnSize = [NSLocalizedString(title, @"") sizeWithFont:kFontSizeNavigationBtnTitle constrainedToSize:CGSizeMake(300, MAXFLOAT) lineBreakMode:NSLineBreakByCharWrapping];
    }
    
    UIButton *returnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [returnBtn setTitle:NSLocalizedString(title, @"") forState:UIControlStateNormal];
    [returnBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [returnBtn.titleLabel setFont:kFontSizeNavigationBtnTitle];
    [returnBtn setBackgroundColor:[UIColor clearColor]];
    
    if (iOS_7_Vesion_More)
        [returnBtn setFrame:CGRectMake(0, 0, returnSize.width, 44)];
    else
    {
        [returnBtn setFrame:CGRectMake(0, 0, returnSize.width + 10, 44)];
        [returnBtn  setImageEdgeInsets : UIEdgeInsetsMake ( 0 , -10 , 0 , 0 )];
    }
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:returnBtn];
    viewController.navigationItem.rightBarButtonItem = buttonItem;
    
    return returnBtn;
}

+ (UIButton *)setupRightButtonWithController:(UIViewController *)viewController withTitle:(NSString *)title withImage:(UIImage *)image{

    CGSize returnSize = [NSLocalizedString(title, @"") sizeWithAttributes:@{NSFontAttributeName: kFontSizeNavigationBtnTitle}];
  
    UIButton *returnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [returnBtn setTitle:NSLocalizedString(title, @"") forState:UIControlStateNormal];
    [returnBtn setTitleColor:kColor5A forState:UIControlStateNormal];
    [returnBtn.titleLabel setFont:kFontSizeNavigationBtnTitle];
    [returnBtn setBackgroundColor:[UIColor clearColor]];
    [returnBtn setImage:image forState:UIControlStateNormal];
    [returnBtn setFrame:CGRectMake(0, 0, returnSize.width, 44)];

    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:returnBtn];
    viewController.navigationItem.rightBarButtonItem = buttonItem;
    
    return returnBtn;
}


+ (UIButton *)setupDoneButtonWitController:(UIViewController *)viewController
{
    
    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [doneButton setTitle:NSLocalizedString(@"完成", @"") forState:UIControlStateNormal];
    [doneButton setTitleColor:kColorWhite forState:UIControlStateNormal];
    [doneButton.titleLabel setFont:kFontSizeNavigationBtnTitle];
    if (iOS_7_Vesion_More)
        [doneButton setFrame:CGRectMake(0, 0, 50, 44)];
    else
    {
        [doneButton setFrame:CGRectMake(0, 0, 50 + 10, 44)];
        [doneButton  setImageEdgeInsets : UIEdgeInsetsMake ( 0 , -10 , 0 , 0 )];
    }
    [doneButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -20)];
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:doneButton];
    viewController.navigationItem.rightBarButtonItem = buttonItem;
    
    return doneButton;
}

+ (UIButton *)setupSendButtonWitController:(UIViewController *)viewController
{
    
    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [doneButton setTitle:NSLocalizedString(@"发送", @"") forState:UIControlStateNormal];
    [doneButton setTitleColor:kColorWhite forState:UIControlStateNormal];
    [doneButton.titleLabel setFont:kFontSizeNavigationBtnTitle];
    [doneButton setFrame:CGRectMake(0, 0, 50, 44)];
    if (iOS_7_Vesion_More)
        [doneButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0,-20)];
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:doneButton];
    viewController.navigationItem.rightBarButtonItem = buttonItem;
    
    return doneButton;
}

+ (UIButton *)setupOperationButtonWitController:(UIViewController *)viewController
{
    
    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [doneButton setTitle:NSLocalizedString(@"操作", @"") forState:UIControlStateNormal];
    [doneButton setTitleColor:kColorWhite forState:UIControlStateNormal];
    [doneButton.titleLabel setFont:kFontSizeNavigationBtnTitle];
    [doneButton setFrame:CGRectMake(0, 0, 50, 44)];
    if (iOS_7_Vesion_More)
        [doneButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0,-20)];
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:doneButton];
    viewController.navigationItem.rightBarButtonItem = buttonItem;
    
    return doneButton;
}


+ (UIButton *)setupReleaseButtonWitController:(UIViewController *)viewController
{
    
    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [doneButton setTitle:NSLocalizedString(@"发布", @"") forState:UIControlStateNormal];
    [doneButton setTitleColor:kColorWhite forState:UIControlStateNormal];
    [doneButton.titleLabel setFont:kFontSizeNavigationBtnTitle];
    [doneButton setFrame:CGRectMake(0, 0, 50, 44)];
    if (iOS_7_Vesion_More)
        [doneButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0,-20)];
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:doneButton];
    viewController.navigationItem.rightBarButtonItem = buttonItem;
    
    return doneButton;
}

+ (UIButton *)setupRightBtnItemWitController:(UIViewController *)viewController backImage:(UIImage *)image {
    
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setImage :image forState:UIControlStateNormal];
    if (iOS_7_Vesion_More)
        [rightBtn setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    else
    {
        [rightBtn setFrame:CGRectMake(0, 0, image.size.width + 10, image.size.height)];
        [rightBtn  setImageEdgeInsets : UIEdgeInsetsMake ( 0 , -10 , 0 , 0 )];
    }
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    viewController.navigationItem.rightBarButtonItem = buttonItem;
    
    return rightBtn;
}

+ (UIButton *)setupRightBtnItemWitController:(UIViewController *)viewController backImage:(UIImage *)image highlightImage:(UIImage*)lightImage{
    
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setImage :image forState:UIControlStateNormal];
    [rightBtn setImage :lightImage forState:UIControlStateHighlighted];
    if (iOS_7_Vesion_More)
        [rightBtn setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    else
    {
        [rightBtn setFrame:CGRectMake(0, 0, image.size.width + 10, image.size.height)];
        [rightBtn  setImageEdgeInsets : UIEdgeInsetsMake ( 0 , -10 , 0 , 0 )];
    }
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    viewController.navigationItem.rightBarButtonItem = buttonItem;
    
    return rightBtn;
}


+ (BXNavTitleView *)setupTitleViewWithController:(UIViewController *)viewController title:(NSString *)title
{
    
    BXNavTitleView *titleView = [[BXNavTitleView alloc] initWithFrame:CGRectMake(0, 0, 150, 44.0f)];
    titleView.title = title;
    viewController.navigationItem.titleView = titleView;
    viewController.navigationController.navigationBar.barTintColor = [UIColor hexStringToColor:@"#FFFFFF" alpha:1.0f];

    return titleView;
    
}

+ (BXButton *)setupBtnTitleViewWithController:(UIViewController *)viewController title:(NSString *)title {

#if  __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
    __unused CGFloat stringWidth = [title sizeWithAttributes:@{NSFontAttributeName: kFontSizeNavigationTitle}].width;
#else
    __unused CGFloat stringWidth = [title sizeWithFont:kFontSizeNavigationTitle].width;
#endif
    
    UIImage *image = kImageWithName(@"arrow_down");
    CGFloat btnWidth = ceil(stringWidth) + image.size.width + 20 >= 160 ? 160 : ceil(stringWidth) + image.size.width + 20;
    
    BXButton *navBtn = [BXButton buttonWithType:UIButtonTypeCustom];
    navBtn.frame = CGRectMake(0, 0, btnWidth, 44.0f);
    [navBtn setImage:kImageWithName(@"arrow_down") forState:UIControlStateNormal];
    [navBtn setImage:kImageWithName(@"arrow_up") forState:UIControlStateSelected];
    [navBtn setImageEdgeInsets:UIEdgeInsetsMake(0, ceil(stringWidth)+20, 0, 0)];
    [navBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, image.size.width)];
    [navBtn setTitle:title forState:UIControlStateNormal];
    [navBtn setTitleColor:kColorWhite forState:UIControlStateNormal];
    [navBtn.titleLabel setFont:kFontSizeNavigationTitle];
        
    viewController.navigationItem.titleView = navBtn;
    
    return navBtn;
}

+ (UIButton *)getShareItemButton
{
    UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [shareButton setImage:[UIImage imageNamed:@"sd_share_btn.png"] forState:UIControlStateNormal];
    shareButton.backgroundColor = [UIColor clearColor];
    shareButton.frame = CGRectMake(0, 0, 22, 26);
    return shareButton;
}

+ (UIButton *)getSettingItemButton
{
    UIButton *settingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [settingButton setImage:[UIImage imageNamed:@"sd_sz_btn.png"] forState:UIControlStateNormal];
    
    settingButton.backgroundColor = [UIColor clearColor];
    settingButton.frame = CGRectMake(0, 0, 22, 26);
    return settingButton;
}

+ (UIButton *)setupShareButtonWithController:(UIViewController *)viewController
{
    UIButton *shareButton = [self getShareItemButton];
    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:shareButton];
    return shareButton;
}

#pragma mark -
#pragma mark 文字颜色

+ (UIButton *)setupNextButtonWithController:(UIViewController *)viewController withTitle:(NSString *)title textColor:(UIColor *)color{
    
    CGSize returnSize;
    if (iOS_7_Vesion_More) {
        returnSize = [NSLocalizedString(title, @"") sizeWithAttributes:@{NSFontAttributeName: kFontSizeNavigationBtnTitle}];
    } else {
        
        returnSize = [NSLocalizedString(title, @"") sizeWithFont:kFontSizeNavigationBtnTitle constrainedToSize:CGSizeMake(300, MAXFLOAT) lineBreakMode:NSLineBreakByCharWrapping];
    }
    
    NSLog(@"returnSize====%@",NSStringFromCGSize(returnSize));
    UIImage *returnImage = [UIImage imageNamed:@"return_btn_r.png"];
    UIButton *returnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [returnBtn setImage:returnImage forState:UIControlStateNormal];
    [returnBtn setImage:returnImage forState:UIControlStateHighlighted];
    if (iOS_7_Vesion_More) {
        [returnBtn setImageEdgeInsets:UIEdgeInsetsMake(0, returnSize.width, 0, 0)];
        [returnBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -returnImage.size.width, 0, 0)];
    }
    [returnBtn setTitle:NSLocalizedString(title, @"") forState:UIControlStateNormal];
    [returnBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];  //此处设置所有按钮为白色，使传进来的color不生效
    [returnBtn.titleLabel setFont:kFontSizeNavigationBtnTitle];
    [returnBtn setFrame:CGRectMake(0, 0, returnSize.width + returnImage.size.width, 44)];
    [returnBtn setBackgroundColor:[UIColor clearColor]];
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:returnBtn];
    viewController.navigationItem.rightBarButtonItem = buttonItem;
    
    return returnBtn;
}

+ (UIButton *)setupDoneButtonWitController:(UIViewController *)viewController textColor:(UIColor *)color
{
    
    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [doneButton setTitle:NSLocalizedString(@"完成", @"") forState:UIControlStateNormal];
    [doneButton setTitleColor:color forState:UIControlStateNormal];
    [doneButton.titleLabel setFont:kFontSizeNavigationBtnTitle];
    [doneButton setFrame:CGRectMake(0, 0, 50, 44)];
    [doneButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -20)];
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:doneButton];
    viewController.navigationItem.rightBarButtonItem = buttonItem;
    
    return doneButton;
}
@end
