//
//  detailVC.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/25.
//

#import "detailVC.h"

@interface detailVC ()

@end

@implementation detailVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"进入初始化");
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    self.detailView = [[detailPage alloc] initWithFrame:self.view.bounds];
    self.detailView.delegate = self;
    
    self.detailView.mainTableview.delegate = self;
    self.detailView.mainTableview.dataSource = self;
    
    self.detailView.mainImg = [[UIImageView alloc] initWithImage:self.blog.mainIma];
    self.detailView.mainTitle.text = self.blog.mainTitle;
    self.detailView.authorLabel.text = self.blog.author;
    self.detailView.launchtime.text = self.blog.lanunchTime;
    // 是否点赞，看过，分享过
    self.detailView.isHeart = self.blog.isHeart;
    self.detailView.isView = self.blog.isView;
    self.detailView.isShare = self.blog.isShare;
    
    self.detailView.heartNum.text = [NSString stringWithFormat:@"%ld",self.blog.heartNum];
    self.detailView.viewNum.text = [NSString stringWithFormat:@"%ld",self.blog.viewNum];
    self.detailView.shareNum.text = [NSString stringWithFormat:@"%ld",self.blog.shareNum];
    
    self.detailView.mainImg.image = self.blog.mainIma;
    self.detailView.mainTitle.text = self.blog.mainTitle;
    self.detailView.authorLabel.text = self.blog.author;
    self.detailView.launchtime.text = self.blog.lanunchTime;
    
    
//    NSLog(@"初始化点赞数");
    self.detailView.heartNum.text = [NSString stringWithFormat:@"%ld",self.blog.heartNum];
//    NSLog(@"%@",self.detailView.heartNum.text);
    
//    NSLog(@"%ld", (long)self.blog.heartNum);
    self.detailView.viewNum.text = [NSString stringWithFormat:@"%ld",self.blog.viewNum];
    
    self.detailView.shareNum.text = [NSString stringWithFormat:@"%ld",self.blog.shareNum];
    
    // 按钮
    if (self.blog.isHeart) {
        [self.detailView.heartBtn setImage:[UIImage systemImageNamed:@"heart.fill"] forState:UIControlStateNormal];
        self.detailView.heartBtn.tintColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
    } else {
        [self.detailView.heartBtn setImage:[UIImage systemImageNamed:@"heart"] forState:UIControlStateNormal];
        self.detailView.heartBtn.tintColor = [UIColor systemGray4Color];
    }
    
    if (self.blog.isView) {
        self.detailView.viewBtn.image =  [UIImage systemImageNamed:@"play.square.fill"];
        self.detailView.viewBtn.tintColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
    } else {
        self.detailView.viewBtn.image =  [UIImage systemImageNamed:@"play.square"];
        self.detailView.viewBtn.tintColor = [UIColor systemGray4Color];
    }

    if (self.blog.isShare) {
        [self.detailView.shareBtn setImage:[UIImage systemImageNamed:@"square.and.arrow.up.fill"] forState:UIControlStateNormal];
        self.detailView.shareBtn.tintColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
    } else {
        [self.detailView.shareBtn setImage:[UIImage systemImageNamed:@"square.and.arrow.up"] forState:UIControlStateNormal];
        self.detailView.shareBtn.tintColor = [UIColor systemGray4Color];
    }
    // 设置按钮的点击事件
    [self.detailView.heartBtn addTarget:self action:@selector(heartBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.detailView.shareBtn addTarget:self action:@selector(shareBtnClick) forControlEvents:UIControlEventTouchUpInside];

    NSLog(@"%@",self.blog.mainIma);

    self.imaArray = self.blog.imaArray;
    
    
    // 临时测试代码
    NSMutableArray* iArray = [[NSMutableArray alloc] init];
    for (int i = 1; i < 10; i++) {
        UIImage* image = [UIImage imageNamed:[NSString stringWithFormat:@"blog%d.JPG",i]];
        [iArray addObject:image];
    }
    self.imaArray = iArray;
    
    
    
    
    [self.detailView.mainTableview registerClass:[detailPageTableViewCell class] forCellReuseIdentifier:@"detailPageTableViewCell"];
    
    [self.view addSubview:self.detailView];
    
}

#pragma mark - 按钮点击事件
- (void)heartBtnClick {
    self.blog.isHeart = !self.blog.isHeart;
    if (self.blog.isHeart) {
        self.blog.heartNum++;
        [self.detailView.heartBtn setImage:[UIImage systemImageNamed:@"heart.fill"] forState:UIControlStateNormal];
        self.detailView.heartNum.text = [NSString stringWithFormat:@"%ld",self.blog.heartNum];
        self.detailView.heartBtn.tintColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
    } else {
        self.blog.heartNum--;
        self.detailView.heartNum.text = [NSString stringWithFormat:@"%ld",self.blog.heartNum];
        [self.detailView.heartBtn setImage:[UIImage systemImageNamed:@"heart"] forState:UIControlStateNormal];
        self.detailView.heartBtn.tintColor = [UIColor systemGray4Color];
    }
    [self.model saveData:self.blog atRow:self.indexPath.row];
}

- (void)shareBtnClick {
    self.blog.isShare = !self.blog.isShare;
    if (self.blog.isShare) {
        self.blog.shareNum++;
        [self.detailView.shareBtn setImage:[UIImage systemImageNamed:@"square.and.arrow.up.fill"] forState:UIControlStateNormal];
        self.detailView.shareNum.text = [NSString stringWithFormat:@"%ld",self.blog.shareNum];
        self.detailView.shareBtn.tintColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
    } else {
        self.blog.shareNum--;
        self.detailView.shareNum.text = [NSString stringWithFormat:@"%ld",self.blog.shareNum];
        [self.detailView.shareBtn setImage:[UIImage systemImageNamed:@"square.and.arrow.up"] forState:UIControlStateNormal];
        self.detailView.shareBtn.tintColor = [UIColor systemGray4Color];
    }
    [self.model saveData:self.blog atRow:self.indexPath.row];
    
    NSLog(@"分享按钮被点击");
}




#pragma mark -UITableViewDelegate and UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (!self.imaArray) {
        return 1;
    }
    return self.imaArray.count + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"返回个数");
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200; // 或你想要的
}

-(UITableViewCell*)tableView: (UITableView* )tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSLog(@"开始创建cell");
    detailPageTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"detailPageTableViewCell" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        cell.ImageView.image = self.blog.mainIma;
    } else {
        cell.ImageView.image = self.imaArray[indexPath.section - 1];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.ImageView.contentMode = UIViewContentModeScaleAspectFit;
    cell.ImageView.clipsToBounds = YES;
    return cell;
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
