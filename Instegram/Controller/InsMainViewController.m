//
//  InsMainViewController.m
//  Instegram
//
//  Created by zhtt on 2018/7/2.
//  Copyright © 2018年 ZHTT. All rights reserved.
//

#import "InsMainViewController.h"

#import "XLSlideSwitch.h"

#import "InsNearViewController.h"
#import "InsDynamicDetailsViewController.h"
#import "YHTimeLineListController.h"
#import "InsFollowViewController.h"
#import "InsRecommendViewController.h"

#import "InsPublishViewController.h"

@interface InsMainViewController ()<XLSlideSwitchDelegate>
{
    XLSlideSwitch *_slideSwitch;
}
@end

@implementation InsMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
    [self setupUI];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.translucent = NO;
}


- (void)setupNav {
    self.view.backgroundColor = kTableViewBackground;

    
    [[BXNavigationItemHelper setupRightBtnItemWitController:self backImage:kImageWithName(@"Ins_nav_camera_btn")] handleControlEvent:UIControlEventTouchUpInside withBlock:^{
        InsPublishViewController * vc = [[InsPublishViewController alloc]init];
        [self presentViewController:vc animated:YES completion:^{ }];
    }];
    
//    [[BXNavigationItemHelper setupRightBtnItemWitController:self backImage:kImageWithName(@"Ins_nav_person_btn")] handleControlEvent:UIControlEventTouchUpInside withBlock:^{
//        InsPublishViewController * vc = [[InsPublishViewController alloc]init];
//        [self presentViewController:vc animated:YES completion:^{ }];
//    }];
    
}

- (void)setupUI {
    
    NSMutableArray *viewControllers = [NSMutableArray new];
    NSArray *titles = @[@"关注",@"推荐",@"附近"];
    
    YHTimeLineListController *vc = [YHTimeLineListController new];
    vc.title = titles[0];
    [viewControllers addObject:vc];
    
    InsRecommendViewController *vc1 = [InsRecommendViewController new];
    vc1.title = titles[1];
    [viewControllers addObject:vc1];
    
    InsNearViewController *vc2 = [InsNearViewController new];
    vc2.title = titles[2];
    [viewControllers addObject:vc2];

    
    _slideSwitch = [[XLSlideSwitch alloc] initWithFrame:CGRectMake(0, 0, bdtScreenWidth, bdtScreenHeight-kNavHeight) Titles:titles viewControllers:viewControllers];
    _slideSwitch.delegate = self;
    _slideSwitch.backgroundColor = kColorWhite;
    _slideSwitch.itemSelectedColor = UIColorFromRGB(0xd0021b);
    _slideSwitch.itemNormalColor = [UIColor blackColor];
    _slideSwitch.customTitleSpacing = 30;
    _slideSwitch.segment.bottomLine.hidden = YES;
    [_slideSwitch showInNavigationController:self.navigationController];
}

#pragma mark - XLSlideSwitchDelegate
- (void)slideSwitchDidselectAtIndex:(NSInteger)index {
    
    UIViewController * vc = [self viewControllerOfIndex:index];
    [vc viewWillAppear:YES];
}

- (UIViewController *)viewControllerOfIndex:(NSInteger)index {
    UIViewController *vc;
    switch (index%2) {
        case 0:
            vc = [[YHTimeLineListController alloc] init];
            break;
        case 1:
            vc = [[InsRecommendViewController alloc] init];
            break;
        case 2:
            vc = [[InsNearViewController alloc] init];
            break;
        default:
            break;
    }
    return vc;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
