//
//  InsDynamicDetailsViewController.m
//  Instegram
//
//  Created by zhtt on 2018/7/4.
//  Copyright © 2018年 ZHTT. All rights reserved.
//

#import "InsDynamicDetailsViewController.h"
#import "InsCommentToolBar.h"
#import "InsDynamicDetailsView.h"
#import "InsDynamicDetailsTableViewCell.h"
#import "InsFollowSuccessViewController.h"


#import "SDTimeLineCellCommentView.h"
#import "UIView+SDAutoLayout.h"
#import "SDTimeLineCellModel.h"



#import "MHUser.h"
#import "MHTopicCell.h"
#import "MHTopic.h"
#import "NSObject+MH.h"
#import "MHTopicFrame.h"
#import "NSDateFormatter+Extension.h"

@interface InsDynamicDetailsViewController ()<UITableViewDelegate,UITableViewDataSource,MHTopicCellDelegate>{
    SDTimeLineCellCommentView *_commentView;

}

@property (nonatomic, strong) UITableView              * tableView;

@property (nonatomic, strong) InsDynamicDetailsView    * dynamicDetailsView;
@property (nonatomic, strong) InsCommentToolBar        * commentToolBar;



/** MHTopicFrame 模型 */
@property (nonatomic , strong) NSMutableArray *topicFrames;
@property (nonatomic , strong) NSMutableArray *users;
@property (nonatomic , copy)   NSString       *textString;


@end

@implementation InsDynamicDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    
    // 初始化
    [self _setup];
    
    // 初始化数据
    [self _setupData];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.translucent = NO;
}

- (void)setupUI {
    
    self.view.backgroundColor = kTableViewBackground;
//    [self.view addSubview:self.dynamicDetailsView];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.bottom.offset(-62);
    }];
    
    [self.view addSubview:self.commentToolBar];
    
    
    /*
    CGFloat margin = 10;
    _commentView = [SDTimeLineCellCommentView new];
    [self.view addSubview:_commentView];
//    _commentView.backgroundColor = [UIColor cyanColor];
    [_commentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.height.mas_equalTo(100);
        make.bottom.offset(-62);
    }];
    
    [self setModel];
     */
}

- (void)setModel {
    
    NSArray * array = [self creatModelsWithCount:10];
    SDTimeLineCellModel * model = array[0];
    
    [_commentView setupWithCommentItemsArray:model.commentItemsArray];
}


- (NSArray *)creatModelsWithCount:(NSInteger)count
{
    NSArray *iconImageNamesArray = @[@"icon0.jpg",
                                     @"icon1.jpg",
                                     @"icon2.jpg",
                                     @"icon3.jpg",
                                     @"icon4.jpg",
                                     ];
    
    NSArray *namesArray = @[@"GSD_iOS",
                            @"风口上的猪",
                            @"当今世界网名都不好起了",
                            @"我叫郭德纲",
                            @"Hello Kitty"];
    
    NSArray *commentsArray = @[@"社会主义好！👌👌👌👌",
                               @"正宗好凉茶，正宗好声音。。。",
                               @"你好，我好，大家好才是真的好",
                               @"有意思",
                               @"你瞅啥？",
                               @"瞅你咋地？？？！！！",
                               @"hello，看我",
                               @"曾经在幽幽暗暗反反复复中追问，才知道平平淡淡从从容容才是真",
                               @"人艰不拆",
                               @"咯咯哒",
                               @"呵呵~~~~~~~~",
                               @"我勒个去，啥世道啊",
                               @"真有意思啊你💢💢💢"];
    
 
    NSMutableArray *resArr = [NSMutableArray new];
    
        int iconRandomIndex = arc4random_uniform(5);
        int nameRandomIndex = arc4random_uniform(5);
        
        SDTimeLineCellModel *model = [SDTimeLineCellModel new];
        model.iconName = iconImageNamesArray[iconRandomIndex];
        model.name = namesArray[nameRandomIndex];
        
        
        // 模拟随机评论数据
        NSMutableArray *tempComments = [NSMutableArray new];
        for (int i = 0; i < 2; i++) {
            SDTimeLineCellCommentItemModel *commentItemModel = [SDTimeLineCellCommentItemModel new];
            int index = arc4random_uniform((int)namesArray.count);
            commentItemModel.firstUserName = namesArray[index];
            commentItemModel.firstUserId = @"666";
            if (arc4random_uniform(10) < 5) {
                commentItemModel.secondUserName = namesArray[arc4random_uniform((int)namesArray.count)];
                commentItemModel.secondUserId = @"888";
            }
            commentItemModel.commentString = commentsArray[arc4random_uniform((int)commentsArray.count)];
            [tempComments addObject:commentItemModel];
        }
        model.commentItemsArray = [tempComments copy];
    
    
        // 模拟随机点赞数据
        NSMutableArray *tempLikes = [NSMutableArray new];
        for (int i = 0; i < 2; i++) {
            SDTimeLineCellLikeItemModel *model = [SDTimeLineCellLikeItemModel new];
            int index = arc4random_uniform((int)namesArray.count);
            model.userName = namesArray[index];
            model.userId = namesArray[index];
            [tempLikes addObject:model];
        }
        
        model.likeItemsArray = [tempLikes copy];
        
        [resArr addObject:model];
    
    return [resArr copy];
}

#pragma mark - 表格代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (!section) {
        return 1 ;
    }
    return self.topicFrames.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2 ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (!indexPath.section) {
        return 470;
    }

    MHTopicFrame *topicFrame = self.topicFrames[indexPath.row];
    
    if (topicFrame.tableViewFrame.size.height==0) {
        return topicFrame.height+topicFrame.tableViewFrame.size.height;
    }else{
        return topicFrame.height+topicFrame.tableViewFrame.size.height+MHTopicVerticalSpace;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (!indexPath.section) {
    
        InsDynamicDetailsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"InsDynamicDetailsTableViewCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
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
        
    }else{
        
        MHTopicCell *cell = [MHTopicCell cellWithTableView:tableView];
        cell.backgroundColor = [UIColor cyanColor];//MHRandomColor;
        MHTopicFrame *topicFrame = self.topicFrames[indexPath.row];
        cell.topicFrame = topicFrame;
        cell.delegate = self;
        return cell;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section==0) {
        return nil;
    }
    UIView * view  = [[UIView alloc]init];
    view.backgroundColor = kTableViewBackground;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
   
    return section?15:0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


#pragma mark - lazy
- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];//WithFrame:CGRectZero style:UITableViewStyleGrouped
        _tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[InsDynamicDetailsTableViewCell   class] forCellReuseIdentifier:@"InsDynamicDetailsTableViewCell"];
        
        [_tableView registerClass:[MHTopicCell   class] forCellReuseIdentifier:@"MHTopicCell"];

        _tableView.delegate        = self;
        _tableView.dataSource      = self;
        _tableView.userInteractionEnabled = YES;
        _tableView.backgroundColor = kTableViewBackground;
        _tableView.tableFooterView = [[UIView alloc]init];
    }
    return _tableView;
}

- (InsDynamicDetailsView *)dynamicDetailsView {
    
    if (!_dynamicDetailsView) {
        _dynamicDetailsView = [[InsDynamicDetailsView alloc]initWithFrame:CGRectMake(0, 0, bdtScreenWidth, 470)];
    }
    return _dynamicDetailsView;
}

- (InsCommentToolBar *)commentToolBar {
    
    if (!_commentToolBar) {
        _commentToolBar = [[InsCommentToolBar alloc]initWithFrame:CGRectMake(0, bdtScreenHeight-62-kNavHeight, bdtScreenWidth, 62)];
    }
    return _commentToolBar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 评论
- (NSMutableArray *)topicFrames
{
    if (_topicFrames == nil) {
        _topicFrames = [[NSMutableArray alloc] init];
    }
    return _topicFrames;
}

- (NSMutableArray *)users {
    if (_users == nil) {
        _users = [[NSMutableArray alloc] init];
        
        MHUser *user0 = [[MHUser alloc] init];
        user0.userId = @"1000";
        user0.nickname = @"CoderMikeHe";
        user0.avatarUrl = @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1206211006,1884625258&fm=58";
        [_users addObject:user0];
        
        
        MHUser *user1 = [[MHUser alloc] init];
        user1.userId = @"1001";
        user1.nickname = @"吴亦凡";
        user1.avatarUrl = @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2625917416,3846475495&fm=58";
        [_users addObject:user1];
        
        
        MHUser *user2 = [[MHUser alloc] init];
        user2.userId = @"1002";
        user2.nickname = @"杨洋";
        user2.avatarUrl = @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=413353707,3948222604&fm=58";
        [_users addObject:user2];
        
        
        MHUser *user3 = [[MHUser alloc] init];
        user3.userId = @"1003";
        user3.nickname = @"陈伟霆";
        user3.avatarUrl = @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=3937650650,3185640398&fm=58";
        [_users addObject:user3];
        
        
        MHUser *user4 = [[MHUser alloc] init];
        user4.userId = @"1004";
        user4.nickname = @"张艺兴";
        user4.avatarUrl = @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1691925636,1723246683&fm=58";
        [_users addObject:user4];
        
        
        MHUser *user5 = [[MHUser alloc] init];
        user5.userId = @"1005";
        user5.nickname = @"鹿晗";
        user5.avatarUrl = @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=437161406,3838120455&fm=58";
        [_users addObject:user5];
        
        
        MHUser *user6 = [[MHUser alloc] init];
        user6.userId = @"1006";
        user6.nickname = @"杨幂";
        user6.avatarUrl = @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1663450221,575161902&fm=58";
        [_users addObject:user6];
        
        
        MHUser *user7 = [[MHUser alloc] init];
        user7.userId = @"1007";
        user7.nickname = @"唐嫣";
        user7.avatarUrl = @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1655233011,1466773944&fm=58";
        [_users addObject:user7];
        
        
        MHUser *user8 = [[MHUser alloc] init];
        user8.userId = @"1008";
        user8.nickname = @"刘亦菲";
        user8.avatarUrl = @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3932899473,3078920054&fm=58";
        [_users addObject:user8];
        
        
        MHUser *user9 = [[MHUser alloc] init];
        user9.userId = @"1009";
        user9.nickname = @"林允儿";
        user9.avatarUrl = @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2961367360,923857578&fm=58";
        [_users addObject:user9];
        
    }
    return _users;
}

- (MHTopicFrame *)_topicFrameWithTopic:(MHTopic *)topic {
    MHTopicFrame *topicFrame = [[MHTopicFrame alloc] init];
    // 传递微博模型数据，计算所有子控件的frame
    topicFrame.topic = topic;
    
    return topicFrame;
}

#pragma mark - 初始化
- (void)_setup {
    
    _textString = @"孤独之前是迷茫，孤独之后是成长；孤独没有不好，不接受孤独才不好；不合群是表面的孤独，合群了才是内心的孤独。那一天，在图书馆闲逛，书从中，这本书吸引了我，从那以后，睡前总会翻上几页。或许与初到一个陌生城市有关，或许因为近三十却未立而惆怅。孤独这个字眼对我而言，有着异常的吸引力。书中，作者以33段成长故事，描述了33种孤独，也带给了我们33次感怀。什么是孤独？孤独不仅仅是一个人，一间房，一张床。对未来迷茫，找不到前进的方向，是一种孤独；明知即将失去，徒留无奈，是一种孤独；回首来时的路，很多曾经在一起人与物，变得陌生而不识，这是一种孤独；即使心中很伤痛，却还笑着对身边人说，没事我很好，这也是一种孤独——第一次真正意识到，孤独与青春同在，与生活同在！孤独可怕吗？以前很害怕孤独，于是不断改变自己，去适应不同的人不同的事。却不曾想到，孤独也是需要去体验的。正如书中所说，孤独是你终将学会的相处方式。孤独，带给自己的是平静，是思考，而后是成长。于是开始懂得，去学会接受孤独，也接受内心中的自己，成长过程中的自己。我希望将来有一天，回首曾经过往时，可以对自己说，我的孤独，虽败犹荣！";
}

#pragma mark -  初始化数据，假数据
- (void)_setupData {
    
    NSDate *date = [NSDate date];
    // 初始化100条数据
    for (NSInteger i = 20; i>0; i--) {
        
        // 话题
        MHTopic *topic = [[MHTopic alloc] init];
        topic.topicId = [NSString stringWithFormat:@"%zd",i];
        topic.thumbNums = [NSObject mh_randomNumber:1000 to:100000];
        topic.thumb = [NSObject mh_randomNumber:0 to:1];
        
        // 构建时间假数据
        NSTimeInterval t = date.timeIntervalSince1970 - 1000 *(30-i) - 60;
        NSDate *d = [NSDate dateWithTimeIntervalSince1970:t];
        NSDateFormatter *formatter = [NSDateFormatter mh_defaultDateFormatter];
        NSString *creatTime = [formatter stringFromDate:d];
        topic.creatTime = creatTime;
        
        topic.text = [self.textString substringFromIndex:[NSObject mh_randomNumber:0 to:self.textString.length-1]];
        topic.user = self.users[[NSObject mh_randomNumber:0 to:9]];
        
        NSInteger commentsCount = [NSObject mh_randomNumber:0 to:20];
        topic.commentsCount = commentsCount;
        for (NSInteger j = 0; j<commentsCount; j++) {
            MHComment *comment = [[MHComment alloc] init];
            comment.commentId = [NSString stringWithFormat:@"%zd%zd",i,j];
            comment.creatTime = @"2017-01-07 18:18:18";
            comment.text = [self.textString substringToIndex:[NSObject mh_randomNumber:0 to:30]];
            if (j%3==0) {
                MHUser *toUser = self.users[[NSObject mh_randomNumber:0 to:5]];
                comment.toUser = toUser;
            }
            
            MHUser *fromUser = self.users[[NSObject mh_randomNumber:6 to:9]];
            comment.fromUser = fromUser;
            [topic.comments addObject:comment];
        }
        
        [self.topicFrames addObject:[self _topicFrameWithTopic:topic]];
    }
}


#pragma mark - MHTopicCellDelegate
- (void)topicCellForClickedThumbAction:(MHTopicCell *)topicCell
{
    /**
     * 这里点击事件自行根据自己UI处理
     *
     */
//    MHLog(@"---点击👍按钮---");
}

- (void)topicCellForClickedMoreAction:(MHTopicCell *)topicCell
{
    /**
     * 这里点击事件自行根据自己UI处理
     *
     */
//    MHLog(@"---点击更多按钮---");
    // 修改数据源方法
    MHTopic *topic = topicCell.topicFrame.topic;
    topic.thumb = !topic.isThumb;
    if (topic.isThumb) {
        topic.thumbNums+=1;
    }else{
        topic.thumbNums-=1;
    }
    
    // 刷新数据
    [self.tableView reloadData];
}

- (void) topicCellDidClickedTopicContent:(MHTopicCell *)topicCell
{
//    MHLog(@"这里评论 -- :%@的帖子",topicCell.topicFrame.topic.user.nickname);
    /**
     * 这里点击事件自行根据自己UI处理
     *
     */
}

- (void) topicCellDidClickedUser:(MHTopicCell *)topicCell
{
//    MHUserInfoController *userInfo = [[MHUserInfoController alloc] init];
//    userInfo.user = topicCell.topicFrame.topic.user;
//    [self.navigationController pushViewController:userInfo animated:YES];
}

- (void) topicCell:(MHTopicCell *)topicCell didClickedUser:(MHUser *)user
{
//    MHUserInfoController *userInfo = [[MHUserInfoController alloc] init];
//    userInfo.user = user;
//    [self.navigationController pushViewController:userInfo animated:YES];
}

- (void) topicCell:(MHTopicCell *)topicCell didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MHTopicFrame *topicFrame = topicCell.topicFrame;
    MHCommentFrame *commentFrame = topicFrame.commentFrames[indexPath.row];
    
    MHUser *fromUser = commentFrame.comment.fromUser;
    
//    MHLog(@"这里回复 -- :%@",fromUser.nickname);
    /**
     * 这里点击事件自行根据自己UI处理
     *
     */
}


@end
