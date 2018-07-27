//
//  InsNearViewController.m
//  Instegram
//
//  Created by zhtt on 2018/7/4.
//  Copyright © 2018年 ZHTT. All rights reserved.
//

#import "InsNearViewController.h"
#import "InsNearDetailView.h"
#import "InsMyPageViewController.h"
#import "InsFollowSuccessViewController.h"

@interface InsNearViewController ()<BMKMapViewDelegate,BMKLocationServiceDelegate>
{
    BMKLocationService* _locService;
}
@property (nonatomic, strong) InsNearDetailView    * nearDetailView;
@property (nonatomic, strong) BMKMapView           * mapView;

@end

@implementation InsNearViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];

}

- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:YES];
    [_mapView viewWillAppear];

    self.navigationController.navigationBar.translucent = NO;
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    _locService.delegate = self;
    [_locService startUserLocationService];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
//    [super viewWillDisappear:animated];
    _mapView.delegate = nil; // 不用时，置nil
    _locService.delegate = nil;
    [_locService stopUserLocationService];

}

- (void)setupUI {
    
    self.view.backgroundColor = kTableViewBackground;

    
    self.mapView = [[BMKMapView alloc]initWithFrame:self.view.bounds];
    _mapView.showsUserLocation = YES;//先关闭显示的定位图层
    _mapView.userTrackingMode = BMKUserTrackingModeNone;//设置定位的状态
    [self.view addSubview:self.mapView];

    
    [self.view addSubview:self.nearDetailView];
    [self.nearDetailView.headIV  handleControlEvent:UIControlEventTouchUpInside withBlock:^{
        InsMyPageViewController * vc  = [[InsMyPageViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }];
    
    [self.nearDetailView.followBtn  handleControlEvent:UIControlEventTouchUpInside withBlock:^{
        InsFollowSuccessViewController * vc = [[InsFollowSuccessViewController alloc]init];
        vc.isSuccess = YES;
        
        
        UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
        nav.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        
        [self presentViewController:nav animated:NO completion:^{
            vc.view.superview.backgroundColor = [UIColor hexStringToColor:@"#7B7B7B" alpha:0.265];
        }];
    }];

}

- (void)willStartLocatingUser
{
    NSLog(@"start locate");
}

- (void)didStopLocatingUser
{
    NSLog(@"stop locate");
}

- (void)didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"地图定位失败======%@",error);
}

//处理位置坐标更新
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,
          userLocation.location.coordinate.longitude);
    
    //关闭坐标更新
    [_locService stopUserLocationService];
}

#pragma mark - lazy
- (InsNearDetailView *)nearDetailView {
    
    if (!_nearDetailView) {
        _nearDetailView = [[InsNearDetailView alloc]initWithFrame:CGRectMake(0, bdtScreenHeight-235-kNavHeight, bdtScreenWidth, 235)];
    }
    return _nearDetailView;
}


- (BMKLocationService *)locService {
    if (!_locService) {
        _locService = [[BMKLocationService alloc] init];
        _locService.delegate = self;
    }
    return _locService;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
