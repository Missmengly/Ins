//
//  MHConstant.h
//  MHDevelopExample
//
//  Created by CoderMikeHe on 17/2/7.
//  Copyright © 2017年 CoderMikeHe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/**
 *  通知中心
 */
#define MHNotificationCenter [NSNotificationCenter defaultCenter]


/**
 * 设置颜色
 */
#define MHColorFromHexString(__hexString__) [UIColor colorFromHexString:__hexString__]

/**
 *  全局灰色色字体颜色 + placeHolder字体颜色
 */
#define MHGlobalGrayTextColor       [UIColor hexStringToColor:@"#999999" alpha:1.0]

/**
 *  全局白色字体
 */
#define MHGlobalWhiteTextColor      [UIColor hexStringToColor:@"#ffffff" alpha:1.0]

/**
 *  全局黑色字体
 */
#define MHGlobalBlackTextColor      [UIColor hexStringToColor:@"#323232" alpha:1.0]
/**
 *  全局浅黑色字体
 */
#define MHGlobalShadowBlackTextColor      [UIColor hexStringToColor:@"#646464" alpha:1.0]

/**
 *  全局灰色 背景
 */
#define MHGlobalGrayBackgroundColor [UIColor hexStringToColor:@"#f8f8f8" alpha:1.0]

/**
 *  全局细下滑线颜色 以及分割线颜色
 */
#define MHGlobalBottomLineColor     [UIColor hexStringToColor:@"#d6d7dc" alpha:1.0]

/**
 *  全局橙色
 */
#define MHGlobalOrangeTextColor     [UIColor hexStringToColor:@"#FF9500" alpha:1.0]// [UIColor colorFromHexString:@"#FF9500"]

/**
 *  全局细线高度 .75f
 */
UIKIT_EXTERN CGFloat const MHGlobalBottomLineHeight;

/**
 *  UIView 动画时长
 */
UIKIT_EXTERN NSTimeInterval const MHAnimateDuration ;

/**
 *  全局控制器顶部间距 10
 */
UIKIT_EXTERN CGFloat const MHGlobalViewTopInset;

/**
 *  全局控制器左边间距 12
 */
UIKIT_EXTERN CGFloat const MHGlobalViewLeftInset;

/**
 *  全局控制器中间间距 10
 */
UIKIT_EXTERN CGFloat const MHGlobalViewInterInset;


/**
 *  全局默认头像
 */
#define MHGlobalUserDefaultAvatar [UIImage imageNamed:@"mh_defaultAvatar"]



//// 字体
/// 苹方常规字体 12
#define MHRegularFont_12 MHRegularFont(12.0f)
/// 苹方常规字体 13
#define MHRegularFont_13 MHRegularFont(13.0f)
/** 苹方常规字体 14 */
#define MHRegularFont_14 MHRegularFont(14.0f)
/// 苹方常规字体 15
#define MHRegularFont_15 MHRegularFont(15.0f)
/// 苹方常规字体 16
#define MHRegularFont_16 MHRegularFont(16.0f)
/// 苹方常规字体 17
#define MHRegularFont_17 MHRegularFont(17.0f)
/// 苹方常规字体 18
#define MHRegularFont_18 MHRegularFont(18.0f)








// 父子控制器
/** 百思不得姐 -顶部标题的高度 */
UIKIT_EXTERN CGFloat const MHTitilesViewH;
/** 百思不得姐-顶部标题的Y */
UIKIT_EXTERN CGFloat const MHTitilesViewY;

/** 网易新闻-颜色 R、G、B、A*/
UIKIT_EXTERN CGFloat const MHTopicLabelRed;
UIKIT_EXTERN CGFloat const MHTopicLabelGreen;
UIKIT_EXTERN CGFloat const MHTopicLabelBlue;
UIKIT_EXTERN CGFloat const MHTopicLabelAlpha;



// 仿微信朋友圈评论和回复
// 段头+cell+表头
/**  话题头像宽高 */
UIKIT_EXTERN CGFloat const MHTopicAvatarWH ;
/**  话题水平方向间隙 */
UIKIT_EXTERN CGFloat const MHTopicHorizontalSpace;
/**  话题垂直方向间隙 */
UIKIT_EXTERN CGFloat const MHTopicVerticalSpace ;
/**  话题更多按钮宽 */
UIKIT_EXTERN CGFloat const MHTopicMoreButtonW ;


/**  话题内容字体大小 */
#define MHTopicTextFont MHMediumFont(12.0f)
/**  话题昵称字体大小 */
#define MHTopicNicknameFont MHMediumFont(10.0f)
/**  话题点赞字体大小 */
#define MHTopicThumbFont MHMediumFont(10.0f)
/**  话题时间字体大小 */
#define MHTopicCreateTimeFont MHMediumFont(10.0f)




/**  评论水平方向间隙 */
UIKIT_EXTERN CGFloat const MHCommentHorizontalSpace ;
/**  评论垂直方向间隙 */
UIKIT_EXTERN CGFloat const MHCommentVerticalSpace;

/**  评论内容字体大小 */
#define MHCommentTextFont MHMediumFont(12.0f)

/** 文本行高 */
UIKIT_EXTERN CGFloat const  MHCommentContentLineSpacing;


/** 评论假数据 */
UIKIT_EXTERN NSString * const MHAllCommentsId ;


/** 评论用户的key */
UIKIT_EXTERN NSString * const MHCommentUserKey ;


/** 评论高度 */
UIKIT_EXTERN CGFloat const MHCommentHeaderViewHeight;

/** 评论工具高度 */
UIKIT_EXTERN CGFloat const MHCommentToolBarHeight    ;

/** 最大字数 */
UIKIT_EXTERN NSInteger const MHCommentMaxWords    ;

/** 每页数据 */
UIKIT_EXTERN NSUInteger const MHCommentMaxCount ;

/** 弹出评论框View最小距离 */
UIKIT_EXTERN CGFloat const MHTopicCommentToolBarMinHeight ;

/** 弹出评论框View的除了编辑框的高度 */
UIKIT_EXTERN CGFloat const MHTopicCommentToolBarWithNoTextViewHeight ;


/** 视频评论成功的通知 */
UIKIT_EXTERN NSString * const MHCommentSuccessNotification ;
/** 视频评论成功Key */
UIKIT_EXTERN NSString * const MHCommentSuccessKey ;

/** 视频点赞成功的通知 */
UIKIT_EXTERN NSString * const MHThumbSuccessNotification ;



/** 视频评论回复成功的通知 */
UIKIT_EXTERN NSString * const MHCommentReplySuccessNotification ;
/** 视频评论回复成功Key */
UIKIT_EXTERN NSString * const MHCommentReplySuccessKey ;

/** 视频评论获取成功的事件 */
UIKIT_EXTERN NSString * const MHCommentRequestDataSuccessNotification  ;
/** 视频评论获取成功的事件 */
UIKIT_EXTERN NSString * const MHCommentRequestDataSuccessKey  ;


/** 弹出评论框View距离顶部的最小高度 */
#define MHTopicCommentToolBarMinTopInset (MHMainScreenWidth * 9.0f/16.0f + 20)


/** titleView高度 */
UIKIT_EXTERN CGFloat const MHRecommendTitleViewHeight;
/** 选集view高度 */
UIKIT_EXTERN CGFloat const MHRecommendAnthologyViewHeight;
/** 选集纯文本HeaderView高度 */
UIKIT_EXTERN CGFloat const MHRecommendAnthologyHeaderViewHeight;

/** 评论高度 */
UIKIT_EXTERN CGFloat const MHRecommendCommentHeaderViewHeight;
