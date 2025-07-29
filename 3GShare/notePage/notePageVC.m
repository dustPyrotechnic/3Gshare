//
//  notePageVC.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/29.
//

#import "notePageVC.h"
// 不属于自己的cell

@interface notePageVC ()

@end

@implementation notePageVC

- (instancetype) init {
    self = [super init];
    if (self) {
        self.model = [[notePageModel alloc] init];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.model = [[notePageModel alloc] init];
    
    // 设置标题大小
    UILabel* titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"笔记";
    titleLabel.font = [UIFont systemFontOfSize:24.0];
    titleLabel.textColor = [UIColor blackColor];
    [self.navigationItem setTitleView:titleLabel];
    
    UINavigationBarAppearance* appearance = [UINavigationBarAppearance new];
    appearance.backgroundColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
    self.navigationController.navigationBar.standardAppearance = appearance;
    self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    
    self.noteView = [[notePageView alloc] initWithFrame:self.view.bounds];
    // 设置代理
    self.model.delegate = self;
    self.noteView.delegate = self;
    
    self.noteView.greatTableView.delegate = self;
    self.noteView.greatTableView.dataSource = self;
    self.noteView.hotTableView.delegate = self;
    self.noteView.hotTableView.dataSource = self;
    self.noteView.allTableView.delegate = self;
    self.noteView.allTableView.dataSource = self;
    // 注册cell
    [self.noteView.greatTableView registerClass:[normalCell class] forCellReuseIdentifier:@"normalCell"];
    [self.noteView.hotTableView registerClass:[normalCell class] forCellReuseIdentifier:@"normalCell"];
    [self.noteView.allTableView registerClass:[normalCell class] forCellReuseIdentifier:@"normalCell"];
    
    
    [self.view addSubview:self.noteView];
}

- (void) viewWillAppear:(BOOL)animated {
    [self.noteView.hotTableView reloadData];
    [self.noteView.greatTableView reloadData];
    [self.noteView.allTableView reloadData];
}

#pragma mark -UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    normalCell* cell = [tableView dequeueReusableCellWithIdentifier:@"normalCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[normalCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"normalCell"];
    }
    cell.delegate = self;
    if (tableView.tag == 101) {
        NSLog(@"这里是第一个tableview的数据填充");
    } else if (tableView.tag == 102) {
        NSLog(@"这里是第二个tableview的数据填充");
    } else if (tableView.tag == 103) {
        NSLog(@"这里是第二个tableview的数据填充");
    }
    cell.mainImg.image = [self.model providMainIma:indexPath];
    cell.mainImg.contentMode = UIViewContentModeScaleAspectFit;
    cell.mainTitle.text = [self.model providMainTitle:indexPath];
    cell.authorLabel.text = [self.model providAuthor:indexPath];
    cell.lancunchTime.text = [self.model providLancunchTime:indexPath];
    
    cell.blogTag.text = [self.model providBlogTag:indexPath];
    
    cell.heartNum.text = [self.model provideHeartNum:indexPath];
    cell.viewNum.text = [self.model provideViewNum:indexPath];
    cell.shareNum.text = [self.model provideShareNum:indexPath];
    cell.isHeart = [self.model provideIsHeart:indexPath];
    cell.isView = [self.model provideIsView:indexPath];
    cell.isShare = [self.model provideIsShare:indexPath];
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


- (void)refreshData:(nonnull normalCell *)cell {
    // 注意！！！！
    // 这里由于tableView没有加载，会导致返回值为空
    // 需要做一个提前的判断，判断哪个view在屏幕内
    NSIndexPath* path= [[NSIndexPath alloc] init];
    if (self.noteView.segment.selectedSegmentIndex == 0) {
        path= [self.noteView.greatTableView indexPathForCell:cell];
    } else if (self.noteView.segment.selectedSegmentIndex == 1) {
        path= [self.noteView.hotTableView indexPathForCell:cell];
    } else if (self.noteView.segment.selectedSegmentIndex == 2) {
        path= [self.noteView.allTableView indexPathForCell:cell];
    }
    NSInteger row = path.row;
    blogContext* blog = self.model.blogArray[row];
    // 同步数据
    blog.heartNum = [cell.heartNum.text intValue];
    blog.viewNum = [cell.viewNum.text intValue];
    blog.shareNum = [cell.shareNum.text intValue];
    blog.isHeart = cell.isHeart;
    blog.isView = cell.isView;
    blog.isShare = cell.isShare;
    [self.model saveData:blog atRow:row];
}

- (void) refreshData {
    [self.noteView.greatTableView reloadData];
    [self.noteView.hotTableView reloadData];
    [self.noteView.allTableView reloadData];
    
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
