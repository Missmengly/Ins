//
//  InsFollowViewController.m
//  Instegram
//
//  Created by zhtt on 2018/7/5.
//  Copyright © 2018年 ZHTT. All rights reserved.
//

#import "InsFollowViewController.h"
#import "InsSearchView.h"
#import "InsFollowCollectionViewCell.h"
#import "InsFollowSuccessViewController.h"

@interface InsFollowCollectionHeadView ()

@property (nonatomic, strong) InsSearchView            * searchView;
@property (nonatomic, strong) UIButton                 * followBtn;
@property (nonatomic, strong) UIButton                 * recommendBtn;
@property (nonatomic, strong) UIView                   * blueLineView;

@end

@implementation InsFollowCollectionHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    self.backgroundColor = kTableViewBackground;
    [self addSubview:self.searchView];
    
    
    UIView * backgroundView = [[UIView alloc]init];
    backgroundView.backgroundColor = [UIColor whiteColor];
    [self addSubview:backgroundView];
    [backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.top.offset(60);
    }];
    
    
    [backgroundView addSubview:self.followBtn];
    [self.followBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(20);
        make.bottom.offset(0);
        make.top.offset(0);
        make.width.mas_equalTo(bdtScreenWidth*0.5);
    }];
    
    
    [backgroundView addSubview:self.recommendBtn];
    [self.recommendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-20);
        make.bottom.offset(0);
        make.top.offset(0);
        make.width.mas_equalTo(bdtScreenWidth*0.5);
    }];
    
    
    [backgroundView addSubview:self.blueLineView];
    [self.blueLineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(backgroundView.mas_centerX).offset(-(bdtScreenWidth-40)*0.25);
        make.bottom.offset(0);
        make.width.mas_equalTo(25);
        make.height.mas_equalTo(3);
    }];
    
}

#pragma mark - lazy
- (InsSearchView *)searchView {
    
    if (!_searchView) {
        _searchView = [[InsSearchView alloc]initWithFrame:CGRectMake(0, 0, bdtScreenWidth, 60)];
    }
    return _searchView;
}


- (UIButton *)followBtn {
    
    if (!_followBtn) {
        _followBtn = [[UIButton alloc]init];
        [_followBtn setTitle:@"已关注的人" forState:UIControlStateNormal];
        [_followBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _followBtn.titleLabel.font = kFontSystem(15);
        _followBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return _followBtn;
}

- (UIButton *)recommendBtn {
    
    if (!_recommendBtn) {
        _recommendBtn = [[UIButton alloc]init];
        [_recommendBtn setTitle:@"推荐的人" forState:UIControlStateNormal];
        [_recommendBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _recommendBtn.titleLabel.font = kFontSystem(15);
        _recommendBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return _recommendBtn;
}

- (UIView *)blueLineView {
    
    if (!_blueLineView) {
        _blueLineView = [[UIView alloc]init];
        _blueLineView.backgroundColor = [UIColor hexStringToColor:@"#0C85EE" alpha:1.0f];
        _blueLineView.layer.cornerRadius = 2;
    }
    return _blueLineView;
}

@end

@interface InsFollowViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView         * collectionView;

@end

@implementation InsFollowViewController

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
}

- (void)setupUI {
    
    /* ---------------- 推荐的人 ----------------- */
    UICollectionViewFlowLayout *friendLayout = [[UICollectionViewFlowLayout alloc] init];
    friendLayout.itemSize = CGSizeMake(bdtScreenWidth *0.5-2.5, 150);
    friendLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    friendLayout.minimumInteritemSpacing = 5;// 最小列间距
    friendLayout.minimumLineSpacing = 10;// 最小行间距
    friendLayout.sectionInset = UIEdgeInsetsMake( 0, 0, 0, 0); // 设置额外滚动区域
    
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:friendLayout]; /// 80*MY_HSC
    self.collectionView.backgroundColor = [UIColor redColor];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.with.insets(UIEdgeInsetsZero);
    }];
    
    self.collectionView.backgroundColor = kColorWhite;
    [self.collectionView registerClass:[InsFollowCollectionViewCell class] forCellWithReuseIdentifier:@"InsFollowCollectionViewCell"];
    
    [self.collectionView registerClass:[InsFollowCollectionHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"InsFollowCollectionHeadView"];

}


#pragma mark - - - collectionView Delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section  {
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    InsFollowCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"InsFollowCollectionViewCell" forIndexPath:indexPath];
    [cell.followBtn handleControlEvent:UIControlEventTouchUpInside withBlock:^{
       
        InsFollowSuccessViewController * vc = [[InsFollowSuccessViewController alloc]init];
        
        if (indexPath.row%2 == 0) {
            vc.isSuccess = YES;
        }else{
            vc.isSuccess = NO;

        }
        
        
        UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
        nav.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        
        [self presentViewController:nav animated:NO completion:^{
            vc.view.superview.backgroundColor = [UIColor hexStringToColor:@"#7B7B7B" alpha:0.265];
        }];
        
    }];
    return cell;
}

//  返回头视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView =nil;
    //返回段头段尾视图
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        InsFollowCollectionHeadView *header=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"InsFollowCollectionHeadView" forIndexPath:indexPath];
        
        //添加头视图的内容
        reusableView = header;
        
        
        WeakSelf
        
        [weakSelf btnClick:header.followBtn];

        
        if (self.isFollow) {
            header.followBtn.selected = YES;
            header.recommendBtn.selected = NO;
        }else{
            header.followBtn.selected = NO;
            header.recommendBtn.selected = YES;
        }
        
        
        [header.followBtn handleControlEvent:UIControlEventTouchUpInside withBlock:^{
            [weakSelf btnClick:header.followBtn];
            [weakSelf btnUnClick:header.recommendBtn];
            
            [header.blueLineView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(header.mas_centerX).offset(-(bdtScreenWidth-40)*0.25);
                make.bottom.offset(0);
                make.width.mas_equalTo(25);
                make.height.mas_equalTo(3);
            }];

        }];
        
        [header.recommendBtn handleControlEvent:UIControlEventTouchUpInside withBlock:^{
            [weakSelf btnUnClick:header.followBtn];
            [weakSelf btnClick:header.recommendBtn];
            
            [header.blueLineView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(header.mas_centerX).offset((bdtScreenWidth-40)*0.25);
                make.bottom.offset(0);
                make.width.mas_equalTo(25);
                make.height.mas_equalTo(3);
            }];

        }];
        
    }
    return reusableView;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
   
    return CGSizeMake(bdtScreenWidth, 100);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
}

- (void)btnClick:(UIButton *)btn {
    btn.titleLabel.font = kFontSystem(17);
    btn.selected = YES;
}

- (void)btnUnClick:(UIButton *)btn {
    btn.titleLabel.font = kFontSystem(14);
    btn.selected = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
