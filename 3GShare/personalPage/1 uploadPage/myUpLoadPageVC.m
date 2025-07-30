//
//  myUpLoadPageVC.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/30.
//

#import "myUpLoadPageVC.h"

@interface myUpLoadPageVC ()

@end

@implementation myUpLoadPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    self.myView = [[myUpLoadPage alloc] initWithFrame:self.view.bounds];
    self.myView.tableView.delegate = self;
    self.myView.tableView.dataSource = self;
    [self.myView.tableView registerClass:[normalCell class] forCellReuseIdentifier:@"normalCell"];
    [self.view addSubview:self.myView];
    // 如果我的发布为空，显示页面
    if (self.model.myBlogArray.count == 0) {
        UILabel* label = [[UILabel alloc] initWithFrame:self.view.bounds];
        label.text = @"你好像来到了知识的荒原...";
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor lightGrayColor];
        label.font = [UIFont systemFontOfSize:24.0];
        [self.view addSubview:label];
    }
    
}
- (void)viewWillAppear:(BOOL)animated {
//    NSLog(@"加载数量为%lu",(unsigned long)self.model.myBlogArray.count);
    [self refreshData];
}
#pragma mark -UITableView
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    NSLog(@"加载数量为%lu",(unsigned long)self.model.myBlogArray.count);
    return self.model.myBlogArray.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"开始加载cell");
    normalCell* cell = [tableView dequeueReusableCellWithIdentifier:@"normalCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[normalCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"normalCell"];
    }
    cell.delegate = self;
    blogContext* blog = self.model.myBlogArray[indexPath.row];
    cell.mainImg.image = blog.mainIma;
    cell.mainImg.contentMode = UIViewContentModeScaleAspectFit;
    cell.mainTitle.text = blog.mainTitle;
    cell.authorLabel.text = blog.author;
    cell.lancunchTime.text = blog.lanunchTime;
    
    NSArray* blogTag = blog.tagArray;
    NSMutableString* blogTagStr = [[NSMutableString alloc] init];
    for (int i = 0; i < blogTag.count; i++) {
        NSString* str = blogTag[i];
        [blogTagStr appendString:str];
        if (i < blogTag.count - 1) {
            [blogTagStr appendString:@"-"];
        }
    }
    cell.blogTag.text = blogTagStr;
    
    cell.heartNum.text = [NSString stringWithFormat:@"%ld",(long)blog.heartNum];
    cell.viewNum.text = [NSString stringWithFormat:@"%ld",(long)blog.viewNum];
    cell.shareNum.text = [NSString stringWithFormat:@"%ld",(long)blog.shareNum];
    
    cell.isHeart = blog.isHeart;
    cell.isShare = blog.isShare;
    cell.isView = blog.isView;
    
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
    NSIndexPath* path = [self.myView.tableView indexPathForCell:cell];
    blogContext* blog = self.model.blogArray[path.row];
    // 同步数据
    blog.heartNum = [cell.heartNum.text intValue];
    blog.viewNum = [cell.viewNum.text intValue];
    blog.shareNum = [cell.shareNum.text intValue];
    blog.isHeart = cell.isHeart;
    blog.isView = cell.isView;
    blog.isShare = cell.isShare;
    [self.model savemyBlogData:blog atRow:path.row];
    
    
}

- (void) refreshData {
    [self.myView.tableView reloadData];
    
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
