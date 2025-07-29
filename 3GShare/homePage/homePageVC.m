//
//  homePageVC.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/24.
//

#import "homePageVC.h"

@interface homePageVC ()

@end

@implementation homePageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainView = [[homePageView alloc] initWithFrame:self.view.bounds];
    
    self.mainView.mainTableview.delegate = self;
    self.mainView.mainTableview.dataSource = self;
    
    self.homeModel = [[homePageModel alloc] init];
    [self.view addSubview:self.mainView];
    [self.mainView.mainTableview registerClass:[movePhotoCell class] forCellReuseIdentifier:@"movePhotoCell"];
    [self.mainView.mainTableview registerClass:[normalCell class] forCellReuseIdentifier:@"normalCell"];
    
   
    self.navigationController.hidesBarsOnSwipe = NO;
    self.navigationController.hidesBarsOnTap = NO;
    self.navigationController.hidesBarsWhenVerticallyCompact = NO;
    self.navigationController.hidesBarsWhenKeyboardAppears = NO;
//    self.navigationItem.title = @"SHARE";
    
    // 设置标题大小
    UILabel* titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"SHARE";
    titleLabel.font = [UIFont systemFontOfSize:24.0];
    titleLabel.textColor = [UIColor blackColor];
    [self.navigationItem setTitleView:titleLabel];
    
    // 设置导航栏背景颜色
    UINavigationBarAppearance* appearance = [UINavigationBarAppearance new];
    appearance.backgroundColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
    self.navigationController.navigationBar.standardAppearance = appearance;
    self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.mainView.mainTableview reloadData];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // 使用model把整个集合发出去
    [self.homeModel sendAllBlog];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 10;
    }
    return 0;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (UITableViewCell*)tableView: (UITableView*) tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
//    NSLog(@"加载cell");
    if (indexPath.section == 0) {
        movePhotoCell* cell = [tableView dequeueReusableCellWithIdentifier:@"movePhotoCell" forIndexPath:indexPath];
        if (!cell) {
            cell = [[movePhotoCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"movePhotoCell"];
        }
        CGFloat width = cell.frame.size.width;
        CGFloat height = cell.frame.size.height;
        
        NSArray* temparr = [self.homeModel providesImages];
//        NSLog(@"%@",temparr);
        // 修正：先移除所有旧图片，防止叠加
        for (UIView *subview in cell.mainScrollView.subviews) {
            [subview removeFromSuperview];
        }
        for (int i = 0; i < 7; i ++) {
            UIImage* temp = temparr[i];
            UIImageView* ImaView = [[UIImageView alloc] initWithImage:temp];
            ImaView.frame = CGRectMake(width * i, 0, width, height);
            [cell.mainScrollView addSubview:ImaView];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if (indexPath.section == 1) {
        normalCell* cell = [tableView dequeueReusableCellWithIdentifier:@"normalCell" forIndexPath:indexPath];
        // 配置cell内容
        if (!cell) {
            cell = [[normalCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"normalCell"];
        }
        
        cell.delegate = self;
        
        cell.mainImg.image = [self.homeModel providMainIma:indexPath];
        cell.mainImg.contentMode = UIViewContentModeScaleAspectFit;
        cell.mainTitle.text = [self.homeModel providMainTitle:indexPath];
        cell.authorLabel.text = [self.homeModel providAuthor:indexPath];
        cell.lancunchTime.text = [self.homeModel providLancunchTime:indexPath];
        
        cell.blogTag.text = [self.homeModel providBlogTag:indexPath];
        
        cell.heartNum.text = [self.homeModel provideHeartNum:indexPath];
        cell.viewNum.text = [self.homeModel provideViewNum:indexPath];
        cell.shareNum.text = [self.homeModel provideShareNum:indexPath];
        cell.isHeart = [self.homeModel provideIsHeart:indexPath];
        cell.isView = [self.homeModel provideIsView:indexPath];
        cell.isShare = [self.homeModel provideIsShare:indexPath];
        if (cell.isHeart) {
            [cell.heartBtn setImage:[UIImage systemImageNamed:@"heart.fill"] forState:UIControlStateNormal];
            cell.heartBtn.tintColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
        } else {
            [cell.heartBtn setImage:[UIImage systemImageNamed:@"heart"] forState:UIControlStateNormal];
            cell.heartBtn.tintColor = [UIColor systemGray4Color];
        }
        if (cell.isView) {  
            cell.viewBtn.image =  [UIImage systemImageNamed:@"play.square.fill"];
            cell.viewBtn.tintColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
        } else {
            cell.viewBtn.image =  [UIImage systemImageNamed:@"play.square"];
            cell.viewBtn.tintColor = [UIColor systemGray4Color];
        }
        if (cell.isShare) {
            [cell.shareBtn setImage:[UIImage systemImageNamed:@"square.and.arrow.up.fill"] forState:UIControlStateNormal];
            cell.shareBtn.tintColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
        } else {
            [cell.shareBtn setImage:[UIImage systemImageNamed:@"square.and.arrow.up"] forState:UIControlStateNormal];
            cell.shareBtn.tintColor = [UIColor systemGray4Color];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    return nil;
}

- (void)refreshData:(normalCell*)cell {
    NSIndexPath* path= [self.mainView.mainTableview indexPathForCell:cell];
    NSInteger row = path.row;
    blogContext* blog = self.homeModel.blogArr[row];
    // 同步数据
    blog.heartNum = [cell.heartNum.text intValue];
    blog.viewNum = [cell.viewNum.text intValue];
    blog.shareNum = [cell.shareNum.text intValue];
    blog.isHeart = cell.isHeart;
    blog.isView = cell.isView;
    blog.isShare = cell.isShare;
    [self.homeModel saveData:blog atRow:row];
}

- (CGFloat) tableView:(UITableView*) tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 200;
    } else if (indexPath.section == 1){
        return 150;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10.0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 更新数据
    
    // 取出cell
    normalCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    // 修改观看量
    NSInteger VN = [cell.viewNum.text intValue];
    if (cell.isView == NO) {
        cell.isView = YES;
        VN++;
        cell.viewNum.text = [NSString stringWithFormat:@"%ld",(long)VN];
        cell.viewBtn.tintColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
    }
    blogContext* blog = self.homeModel.blogArr[indexPath.row];
    blog.isView = YES;
    blog.viewNum = VN;
    [self.homeModel saveData:blog atRow:indexPath.row];
    [self.mainView.mainTableview reloadData];
    
    // 跳转到的详情页面，把值都传进去
    detailVC* detailPageVC = [[detailVC alloc] init];
    detailPageVC.indexPath = indexPath;
    detailPageVC.cell = cell;
    detailPageVC.blog = blog;
    detailPageVC.model = self.homeModel;
    
    [self.navigationController pushViewController:detailPageVC animated:NO];
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
