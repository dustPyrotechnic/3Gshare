//
//  BaymaxVC.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/29.
//

#import "BaymaxVC.h"


@interface BaymaxVC ()

@end

@implementation BaymaxVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.title = @"搜索结果";
    
    
//    NSLog(@"创建页面");
    self.baymaxView = [[BaymaxView alloc] initWithFrame:self.view.bounds];
//    NSLog(@"设置页面代理");
    self.baymaxView.tableView.delegate = self;
    self.baymaxView.tableView.dataSource = self;
    self.model = [[BaymaxModel alloc] init];
    [self.view addSubview:self.baymaxView];
}



#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"进入cell返回");
    normalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"normalCell"];
    if (!cell) {
        cell = [[normalCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"normalCell"];
    }
    
    cell.delegate = self;
    
    
    blogContext* blog = [self.model getBlogAt:indexPath.section];
    cell.mainImg.image = blog.mainIma;
    cell.mainImg.contentMode = UIViewContentModeScaleAspectFit;
    
    cell.mainTitle.text = blog.mainTitle;
    cell.authorLabel.text = blog.author;
    cell.lancunchTime.text = blog.lanunchTime;
    NSLog(@"设置blog的标签页面");
    cell.blogTag.text = [self.model providBlogTag:indexPath];
    
    cell.heartNum.text = [NSString stringWithFormat:@"%ld",(long)blog.heartNum];
    cell.viewNum.text = [NSString stringWithFormat:@"%ld",(long)blog.viewNum];
    cell.shareNum.text = [NSString stringWithFormat:@"%ld",(long)blog.shareNum];
    
    cell.isHeart = blog.isHeart;
    cell.isView = blog.isView;
    cell.isShare = blog.isShare;
    
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

- (void)refreshData:(normalCell *)cell {
    NSIndexPath* path= [self.baymaxView.tableView indexPathForCell:cell];
    NSInteger section = path.section;
    blogContext* blog = self.model.searchBlog[section];
    // 同步数据
    blog.heartNum = [cell.heartNum.text intValue];
    blog.viewNum = [cell.viewNum.text intValue];
    blog.shareNum = [cell.shareNum.text intValue];
    blog.isHeart = cell.isHeart;
    blog.isView = cell.isView;
    blog.isShare = cell.isShare;
    [self.model saveData:blog atRow:section];
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
