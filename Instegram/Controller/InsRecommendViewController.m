//
//  InsRecommendViewController.m
//  Instegram
//
//  Created by zhtt on 2018/7/9.
//  Copyright © 2018年 ZHTT. All rights reserved.
//

#import "InsRecommendViewController.h"
#import "KYTilePhotoLayout.h"
#import "InsRecommendView.h"
#import "InsSearchView.h"
#import "InsFollowViewController.h"
#import "InsOtherPageViewController.h"

@implementation InsRecommendCollectionHeadView

@end

@interface InsRecommendCollectionViewCell ()
@property (nonatomic, strong) UIImageView    * im;
@end
@implementation InsRecommendCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    [self addSubview:self.im];
    [self.im mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.with.insets(UIEdgeInsetsZero);
    }];
    
}

- (UIImageView *)im {
    
    if (!_im) {
        _im = [[UIImageView alloc] init];
    }
    return _im;
}

@end



@interface InsRecommendViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) InsSearchView            * searchView;
@property (nonatomic, strong) InsRecommendView         * recommendView ;
@property (strong, nonatomic) UICollectionView *collectionView;

@end

@implementation InsRecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.translucent = NO;
}

- (void)setupUI {
    
    self.view.backgroundColor = kTableViewBackground;
    
    
    
    
    [self.view addSubview:self.searchView];
    [self.view addSubview:self.recommendView];
    
    
    
    [self.recommendView.moreBtn handleControlEvent:UIControlEventTouchUpInside withBlock:^{
        InsFollowViewController * vc = [[InsFollowViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }];
    
    
    self.recommendView.collectionView.delegate = self;
    self.recommendView.collectionView.dataSource = self;
 
    
    KYTilePhotoLayout *layout = [[KYTilePhotoLayout alloc]init];
    layout.LayoutDirection = Vertical;
    layout.DoubleColumnThreshold = 50;
    layout.ColOfPortrait = 3;
    layout.ColOfLandscape = 3;
//    layout.headerReferenceSize=CGSizeMake(200, 200);

    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout]; /// 80*MY_HSC
    self.collectionView.backgroundColor = [UIColor redColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        
//        make.edges.with.insets(UIEdgeInsetsZero);
        make.top.offset(202);
        make.bottom.left.right.offset(0);
    }];
    
    self.collectionView.backgroundColor = kColorWhite;
    [self.collectionView registerClass:[InsRecommendCollectionViewCell class] forCellWithReuseIdentifier:@"InsRecommendCollectionViewCell"];
    
//    [self.collectionView registerClass:[InsRecommendCollectionHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"InsRecommendCollectionHeadView"];
}

#pragma mark -- RotateToReLayout
-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    KYTilePhotoLayout *layout = (KYTilePhotoLayout *)self.collectionView.collectionViewLayout;
    [layout invalidateLayout];
}


#pragma mark -- UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 15;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if(collectionView == self.recommendView.collectionView){
        UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor cyanColor];
        cell.layer.masksToBounds = YES;
        cell.layer.cornerRadius = 22;
        
        
        NSString * name = [NSString stringWithFormat:@"%ld",indexPath.row%4+1];
        UIImageView * iv = [[UIImageView alloc]initWithImage:kImageWithName(name)];
        [cell.contentView addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.with.insets(UIEdgeInsetsZero);
        }];
        return cell;
    }
    
    InsRecommendCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"InsRecommendCollectionViewCell" forIndexPath:indexPath];
    NSString * name = [NSString stringWithFormat:@"%ld",indexPath.row%9];
    cell.im.image = kImageWithName(name);
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if(collectionView == self.recommendView.collectionView){
        InsOtherPageViewController * vc = [[InsOtherPageViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

/*
//  返回头视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView = nil;
  
    //返回段头段尾视图
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        InsRecommendCollectionHeadView * head =[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"InsRecommendCollectionHeadView" forIndexPath:indexPath];
        [head addSubview:self.searchView];
        [head addSubview:self.recommendView];
        
        reusableView = head;
    }
    return reusableView;
}

*/
#pragma mark - lazy
- (InsSearchView *)searchView {
    
    if (!_searchView) {
        _searchView = [[InsSearchView alloc]initWithFrame:CGRectMake(0, 0, bdtScreenWidth, 60)];
    }
    return _searchView;
}

- (InsRecommendView *)recommendView {
    
    if (!_recommendView) {
        _recommendView = [[InsRecommendView alloc]initWithFrame:CGRectMake(0, 60, bdtScreenWidth, 132)];
    }
    return _recommendView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
