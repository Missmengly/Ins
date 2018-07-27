//
//  InsMyPageViewController.m
//  Instegram
//
//  Created by zhtt on 2018/7/6.
//  Copyright © 2018年 ZHTT. All rights reserved.
//

#import "InsMyPageViewController.h"
#import "InsPersonPageHeadView.h"

#import "CellForWorkGroup.h"
#import "YHRefreshTableView.h"
#import "YHWorkGroup.h"
#import "YHUserInfoManager.h"
#import "YHUtils.h"
#import "YHSharePresentView.h"
#import "UITableViewCell+HYBMasonryAutoCellHeight.h"




#import "InsDynamicDetailsViewController.h"
#import "InsFollowSuccessViewController.h"
#import "InsFollowViewController.h"

@interface InsMyPageViewController ()<UITableViewDelegate,UITableViewDataSource,CellForWorkGroupDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>{
    
    int _currentRequestPage; //当前请求页面
    BOOL _reCalculate;
}
@property (nonatomic, strong) InsPersonPageHeadView    * headView;
@property (nonatomic,strong) YHRefreshTableView  * tableView;
@property (nonatomic,strong) NSMutableArray      * dataArray;
@property (nonatomic,strong) NSMutableDictionary * heightDict;


@property (nonatomic, strong) UIView        * btnBgView;
@property (nonatomic, strong) UIButton      * postBtn;
@property (nonatomic, strong) UIButton      * collectBtn;
@property (nonatomic, strong) UIButton      * interactBtn;
@property (nonatomic, strong) UIView        * blueLineView;

@end

@implementation InsMyPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self requestDataLoadNew:YES];
    
    //设置UserId
    [YHUserInfoManager sharedInstance].userInfo.uid = @"1";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)setupNav {
    self.view.backgroundColor = RGBCOLOR(244, 244, 244);
}

- (void)setupUI {
    
    WEAKSELF
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.top.offset(-20);
    }];
    
    [self.tableView setEnableLoadNew:YES];
    [self.tableView setEnableLoadMore:YES];
    [self.tableView registerClass:[CellForWorkGroup class] forCellReuseIdentifier:NSStringFromClass([CellForWorkGroup class])];
    
    
    
    [self.view addSubview:self.headView];
    [self.headView.backBtn handleControlEvent:UIControlEventTouchUpInside withBlock:^{
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
    
    
    
    [self.headView.followNumBtn handleControlEvent:UIControlEventTouchUpInside withBlock:^{
        InsFollowViewController * vc = [[InsFollowViewController alloc]init];
        vc.isFollow = YES;
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    
    [self.headView.fansNumBtn handleControlEvent:UIControlEventTouchUpInside withBlock:^{
        InsFollowViewController * vc = [[InsFollowViewController alloc]init];
        vc.isFollow = NO;
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    
    [self.headView.postNumBtn handleControlEvent:UIControlEventTouchUpInside withBlock:^{
        
    }];
    
    
    
    [self btnClick:self.postBtn];
    
    
    [self.postBtn handleControlEvent:UIControlEventTouchUpInside withBlock:^{
        [weakSelf btnClick:weakSelf.postBtn];
        [weakSelf btnUnClick:weakSelf.collectBtn];
        [weakSelf btnUnClick:weakSelf.interactBtn];
        
        
        [weakSelf.blueLineView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.btnBgView.mas_centerX).offset(-(bdtScreenWidth-40)*0.33);
            make.bottom.offset(-8);
            make.width.mas_equalTo(25);
            make.height.mas_equalTo(3);
        }];
    } ];
    
    [self.collectBtn handleControlEvent:UIControlEventTouchUpInside withBlock:^{
        [weakSelf btnUnClick:weakSelf.postBtn];
        [weakSelf btnClick:weakSelf.collectBtn];
        [weakSelf btnUnClick:weakSelf.interactBtn];
        
        [weakSelf.blueLineView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.btnBgView.mas_centerX).offset(0);
            make.bottom.offset(-8);
            make.width.mas_equalTo(25);
            make.height.mas_equalTo(3);
        }];
    } ];
    
    [self.interactBtn handleControlEvent:UIControlEventTouchUpInside withBlock:^{
        [weakSelf btnUnClick:weakSelf.postBtn];
        [weakSelf btnUnClick:weakSelf.collectBtn];
        [weakSelf btnClick:weakSelf.interactBtn];
        
        [weakSelf.blueLineView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.btnBgView.mas_centerX).offset((bdtScreenWidth-40)*0.33);
            make.bottom.offset(-8);
            make.width.mas_equalTo(25);
            make.height.mas_equalTo(3);
        }];
    } ];
}

- (void)btnClick:(UIButton *)btn {
    btn.titleLabel.font = kFontSystem(17);
    btn.selected = YES;
}

- (void)btnUnClick:(UIButton *)btn {
    btn.titleLabel.font = kFontSystem(14);
    btn.selected = NO;
}

#pragma mark - 表格代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1 ;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section < self.dataArray.count) {
        
        CGFloat height = 0.0;
        //原创cell
        YHWorkGroup *model  = self.dataArray[indexPath.section];
        
        //取缓存高度
        NSDictionary *dict =  self.heightDict[model.dynamicId];
        if (dict) {
            if (model.isOpening) {
                height = [dict[@"open"] floatValue];
            }else{
                height = [dict[@"normal"] floatValue];
            }
            if (height) {
                return height;
            }
        }
        
        height = [CellForWorkGroup hyb_heightForTableView:tableView config:^(UITableViewCell *sourceCell) {
            CellForWorkGroup *cell = (CellForWorkGroup *)sourceCell;
            cell.model = model;
        }];
        
        //缓存高度
        if (model.dynamicId) {
            NSMutableDictionary *aDict = [NSMutableDictionary new];
            if (model.isOpening) {
                [aDict setObject:@(height) forKey:@"open"];
            }else{
                [aDict setObject:@(height) forKey:@"normal"];
            }
            [self.heightDict setObject:aDict forKey:model.dynamicId];
        }
        return height;
    }
    else{
        return 44.0f;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YHWorkGroup *model  = self.dataArray[indexPath.section];
    
    //原创cell
    CellForWorkGroup *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CellForWorkGroup class])];
    if (!cell) {
        cell = [[CellForWorkGroup alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([CellForWorkGroup class])];
    }
    cell.indexPath = indexPath;
    cell.model = model;
    cell.delegate = self;
    
    cell.followBtn.hidden = YES;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return 370;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        UIView * view = [[UIView alloc]init];
        [view addSubview:self.headView];
        [view addSubview:self.btnBgView];
        
        [_btnBgView addSubview:self.postBtn];
        [_btnBgView addSubview:self.collectBtn];
        [_btnBgView addSubview:self.interactBtn];
        
        NSMutableArray * masonryArray = [NSMutableArray arrayWithObjects:self.postBtn,self.collectBtn,self.interactBtn, nil];
        [masonryArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:(1) leadSpacing:20 tailSpacing:20];
        [masonryArray mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(10);
            make.bottom.offset(-15);
        }];
        
        [_btnBgView addSubview:self.blueLineView];
        [self.blueLineView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.btnBgView.mas_centerX).offset(-(bdtScreenWidth-40)*0.33);
            make.bottom.offset(-8);
            make.width.mas_equalTo(25);
            make.height.mas_equalTo(3);
        }];
        
        return view;
    }
    
    UIView * view = [[UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];//kTableViewBackground;
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - 网络请求
- (void)requestDataLoadNew:(BOOL)loadNew{
    YHRefreshType refreshType;
    if (loadNew) {
        _currentRequestPage = 1;
        refreshType = YHRefreshType_LoadNew;
        [self.tableView setNoMoreData:NO];
    }
    else{
        _currentRequestPage ++;
        refreshType = YHRefreshType_LoadMore;
    }
    
    [self.tableView loadBegin:refreshType];
    if (loadNew) {
        [self.dataArray removeAllObjects];
        [self.heightDict removeAllObjects];
    }
    
    int totalCount = 10;
    
    NSUInteger lastDynamicID = 0;
    if (!loadNew && self.dataArray.count) {
        YHWorkGroup *model = self.dataArray.lastObject;
        lastDynamicID = [model.dynamicId integerValue];
    }
    for (int i=0; i<totalCount; i++) {
        YHWorkGroup *model = [YHWorkGroup new];
        model.dynamicId = [NSString stringWithFormat:@"%lu", lastDynamicID + i+1];
        [self randomModel:model totalCount:totalCount];
        [self.dataArray addObject:model];
    }
    
    [self.tableView loadFinish:refreshType];
    [self.tableView reloadData];
    
}

#pragma mark - 模拟产生数据源
- (void)randomModel:(YHWorkGroup *)model totalCount:(int)totalCount{
    
    model.type = arc4random()%totalCount %2? DynType_Forward:DynType_Original;//动态类型
    if (model.type == DynType_Forward) {
        model.forwardModel = [YHWorkGroup new];
        [self creatOriModel:model.forwardModel totalCount:totalCount];
    }
    [self creatOriModel:model totalCount:totalCount];
}

- (void)creatOriModel:(YHWorkGroup *)model totalCount:(int)totalCount{
    YHUserInfo *userInfo = [YHUserInfo new];
    model.userInfo = userInfo;
    
    
    NSArray *avtarArray = @[
                            @"http://testapp.gtax.cn/images/2016/11/05/812eb442b6a645a99be476d139174d3c.png!m90x90.png",
                            @"http://testapp.gtax.cn/images/2016/11/09/64a62eaaff7b466bb8fab12a89fe5f2f.png!m90x90.png",
                            @"https://testapp.gtax.cn/images/2016/09/30/ad0d18a937b248f88d29c2f259c14b5e.jpg!m90x90.jpg",
                            @"https://testapp.gtax.cn/images/2016/09/14/c6ab40b1bc0e4bf19e54107ee2299523.jpg!m90x90.jpg",
                            @"http://testapp.gtax.cn/images/2016/11/14/8d4ee23d9f5243f98c79b9ce0c699bd9.png!m90x90.png",
                            @"https://testapp.gtax.cn/images/2016/09/14/8cfa9bd12e6844eea0a2e940257e1186.jpg!m90x90.jpg"];
    int avtarIndex = arc4random() % avtarArray.count;
    if (avtarIndex < avtarArray.count) {
        model.userInfo.avatarUrl = [NSURL URLWithString:avtarArray[avtarIndex]];
    }
    
    
    CGFloat myIdLength = arc4random() % totalCount;
    int result = (int)myIdLength % 2;
    model.userInfo.uid = result ?   [YHUserInfoManager sharedInstance].userInfo.uid:@"2";
    
    CGFloat nLength = arc4random() % 3 + 1;
    NSMutableString *nStr = [NSMutableString new];
    for (int i = 0; i < nLength; i++) {
        [nStr appendString: @"测试名字"];
    }
    model.userInfo.userName = nStr;
    
    CGFloat iLength = arc4random() % 3 + 1;
    NSMutableString *iStr = [NSMutableString new];
    for (int i = 0; i < iLength; i++) {
        [iStr appendString: @"测试行业"];
    }
    model.userInfo.industry = iStr;
    
    
    CGFloat cLength = arc4random() % 8 + 1;
    NSMutableString *cStr = [NSMutableString new];
    for (int i = 0; i < cLength; i++) {
        [cStr appendString: @"测试公司"];
    }
    model.userInfo.company  = cStr;
    
    
    CGFloat jLength = arc4random() % 8 + 1;
    NSMutableString *jStr = [NSMutableString new];
    for (int i = 0; i < jLength; i++) {
        [jStr appendString: @"随机职位"];
    }
    model.userInfo.job = jStr;
    
    CGFloat qlength = arc4random() % totalCount + 5;
    NSMutableString *qStr = [[NSMutableString alloc] init];
    for (NSUInteger i = 0; i < qlength; ++i) {
        [qStr appendString:@"测试数据很长，测试数据很长."];
    }
    model.msgContent = qStr;
    model.publishTime = @"2013-04-17";
    
    
    CGFloat picLength = arc4random() % 9;
    
    //原图
    NSArray *oriPName = @[
                          @"https://testapp.gtax.cn/images/2016/08/25/2241c4b32b8445da87532d6044888f3d.jpg",
                          @"https://testapp.gtax.cn/images/2016/08/25/0abd8670e96e4357961fab47ba3a1652.jpg",
                          @"https://testapp.gtax.cn/images/2016/08/25/5cd8aa1f1b1f4b2db25c51410f473e60.jpg",
                          @"https://testapp.gtax.cn/images/2016/08/25/5e8b978854ef4a028d284f6ddc7512e0.jpg",
                          @"https://testapp.gtax.cn/images/2016/08/25/03c58da45900428796fafcb3d77b6fad.jpg",
                          @"https://testapp.gtax.cn/images/2016/08/25/dbee521788da494683ef336432028d48.jpg",
                          @"https://testapp.gtax.cn/images/2016/08/25/4cd95742b6744114ac8fa41a72f83257.jpg",
                          @"https://testapp.gtax.cn/images/2016/08/25/4d49888355a941cab921c9f1ad118721.jpg",
                          @"https://testapp.gtax.cn/images/2016/08/25/ea6a22e8b4794b9ba63fd6ee587be4d1.jpg"];
    
    NSMutableArray *oriPArr = [NSMutableArray new];
    for (NSString *pName in oriPName) {
        [oriPArr addObject:[NSURL URLWithString:pName]];
    }
    
    //小图
    NSArray *thumbPName = @[
                            @"https://testapp.gtax.cn/images/2016/08/25/2241c4b32b8445da87532d6044888f3d.jpg!t300x300.jpg",
                            @"https://testapp.gtax.cn/images/2016/08/25/0abd8670e96e4357961fab47ba3a1652.jpg!t300x300.jpg",
                            @"https://testapp.gtax.cn/images/2016/08/25/5cd8aa1f1b1f4b2db25c51410f473e60.jpg!t300x300.jpg",
                            @"https://testapp.gtax.cn/images/2016/08/25/5e8b978854ef4a028d284f6ddc7512e0.jpg!t300x300.jpg",
                            @"https://testapp.gtax.cn/images/2016/08/25/03c58da45900428796fafcb3d77b6fad.jpg!t300x300.jpg",
                            @"https://testapp.gtax.cn/images/2016/08/25/dbee521788da494683ef336432028d48.jpg!t300x300.jpg",
                            @"https://testapp.gtax.cn/images/2016/08/25/4cd95742b6744114ac8fa41a72f83257.jpg!t300x300.jpg",
                            @"https://testapp.gtax.cn/images/2016/08/25/4d49888355a941cab921c9f1ad118721.jpg!t300x300.jpg",
                            @"https://testapp.gtax.cn/images/2016/08/25/ea6a22e8b4794b9ba63fd6ee587be4d1.jpg!t300x300.jpg"];
    
    NSMutableArray *thumbPArr = [NSMutableArray new];
    for (NSString *pName in thumbPName) {
        [thumbPArr addObject:[NSURL URLWithString:pName]];
    }
    
    model.originalPicUrls = [oriPArr subarrayWithRange:NSMakeRange(0, picLength)];
    model.thumbnailPicUrls = [thumbPArr subarrayWithRange:NSMakeRange(0, picLength)];
}

#pragma mark - YHRefreshTableViewDelegate
- (void)refreshTableViewLoadNew:(YHRefreshTableView*)view{
    [self requestDataLoadNew:YES];
}

- (void)refreshTableViewLoadmore:(YHRefreshTableView*)view{
    [self requestDataLoadNew:NO];
}

#pragma mark - CellForWorkGroupDelegate
- (void)onAvatarInCell:(CellForWorkGroup *)cell{
    
}

- (void)onMoreInCell:(CellForWorkGroup *)cell{
    DDLog(@"查看详情");
    if (cell.indexPath.section < [self.dataArray count]) {
        YHWorkGroup *model = self.dataArray[cell.indexPath.section];
        model.isOpening = !model.isOpening;
        [self.tableView reloadRowsAtIndexPaths:@[cell.indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)onCommentInCell:(CellForWorkGroup *)cell{
    
}

- (void)onLikeInCell:(CellForWorkGroup *)cell{
    if (cell.indexPath.section < [self.dataArray count]) {
        YHWorkGroup *model = self.dataArray[cell.indexPath.section];
        
        BOOL isLike = !model.isLike;
        
        model.isLike = isLike;
        if (isLike) {
            model.likeCount += 1;
        }else{
            model.likeCount -= 1;
        }
        
        [self.tableView reloadRowsAtIndexPaths:@[cell.indexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
}

- (void)onShareInCell:(CellForWorkGroup *)cell{
    if (cell.indexPath.section < [self.dataArray count]){
        [self _shareWithCell:cell];
    }
}

- (void)onDeleteInCell:(CellForWorkGroup *)cell{
    if (cell.indexPath.section < [self.dataArray count]) {
        [self _deleteDynAtIndexPath:cell.indexPath dynamicId:cell.model.dynamicId];
    }
}

#pragma mark - private
- (void)_deleteDynAtIndexPath:(NSIndexPath *)indexPath dynamicId:(NSString *)dynamicId{
    
    WeakSelf
    [YHUtils showAlertWithTitle:@"删除动态" message:@"您确定要删除此动态?" okTitle:@"确定" cancelTitle:@"取消" inViewController:self dismiss:^(BOOL resultYes) {
        
        if (resultYes) {
            
            DDLog(@"delete row is %ld",(long)indexPath.section);
            
            [weakSelf.dataArray removeObjectAtIndex:indexPath.row];
            [weakSelf.heightDict removeObjectForKey:dynamicId];
            [weakSelf.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        }
    }];
}

- (void)_shareWithCell:(UITableViewCell *)cell{
    
    CellForWorkGroup *cellOri = (CellForWorkGroup *)cell;
    YHWorkGroup *model = [YHWorkGroup new];
    model = cellOri.model;
    
    YHSharePresentView *shareView = [[YHSharePresentView alloc] init];
    shareView.shareType = ShareType_WorkGroup;
    [shareView show];
    [shareView dismissHandler:^(BOOL isCanceled, NSInteger index) {
        if (!isCanceled) {
            switch (index)
            {
                case 2: {
                    DDLog(@"动态");
                }
                    break;
                case 3: {
                }
                    break;
                case 0: {
                    //朋友圈
                    DDLog(@"朋友圈");
                }
                    break;
                case 1: {
                    //微信好友
                    DDLog(@"微信好友");
                }
                    break;
                default:
                    break;
            }
        }
    }];
}

#pragma mark - lazy
- (InsPersonPageHeadView *)headView {
    
    if (!_headView) {
        _headView = [[InsPersonPageHeadView alloc]initWithFrame:CGRectMake(0, 0, bdtScreenWidth, 310)];
    }
    return _headView;
}

- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[YHRefreshTableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
        _tableView.delegate        = self;
        _tableView.dataSource      = self;
        _tableView.userInteractionEnabled = YES;
        _tableView.backgroundColor = kTableViewBackground;
        _tableView.tableFooterView = [[UIView alloc]init];
    }
    return _tableView;
}

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (NSMutableDictionary *)heightDict{
    if (!_heightDict) {
        _heightDict = [NSMutableDictionary new];
    }
    return _heightDict;
}

- (UIButton *)postBtn {
    
    if (!_postBtn) {
        _postBtn = [[UIButton alloc]init];
        [_postBtn setTitle:@"我的发布" forState:UIControlStateNormal];
        [_postBtn setTitleColor:kColor4A forState:UIControlStateNormal];
        [_postBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        _postBtn.titleLabel.font = kFontSystem(14);
        _postBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return _postBtn;
}

- (UIButton *)collectBtn {
    
    if (!_collectBtn) {
        _collectBtn = [[UIButton alloc]init];
        [_collectBtn setTitle:@"我的收藏" forState:UIControlStateNormal];
        [_collectBtn setTitleColor:kColor4A forState:UIControlStateNormal];
        [_collectBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        _collectBtn.titleLabel.font = kFontSystem(14);
        _collectBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return _collectBtn;
}

- (UIButton *)interactBtn {
    
    if (!_interactBtn) {
        _interactBtn = [[UIButton alloc]init];
        [_interactBtn setTitle:@"我的互动" forState:UIControlStateNormal];
        [_interactBtn setTitleColor:kColor4A forState:UIControlStateNormal];
        [_interactBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        _interactBtn.titleLabel.font = kFontSystem(14);
        _interactBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return _interactBtn;
}

- (UIView *)blueLineView {
    
    if (!_blueLineView) {
        _blueLineView = [[UIView alloc]init];
        _blueLineView.backgroundColor = [UIColor hexStringToColor:@"#0C85EE" alpha:1.0f];
        _blueLineView.layer.cornerRadius = 2;
    }
    return _blueLineView;
}

- (UIView *)btnBgView {
    
    if (!_btnBgView) {
        _btnBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 310, bdtScreenWidth, 50)];
        _btnBgView.backgroundColor = kColorWhite;
    }
    return _btnBgView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
