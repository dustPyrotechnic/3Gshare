//
//  personalPageVC.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/29.
//

#import "personalPageVC.h"

#import "myUploadPageVC.h"
#import "messagePageVC.h"

@interface personalPageVC ()

@end

@implementation personalPageVC
- (instancetype) init {
    self = [super init];
    if (self) {
        self.model = [[personalModel alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置标题大小
    UILabel* titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"个人";
    titleLabel.font = [UIFont systemFontOfSize:24.0];
    titleLabel.textColor = [UIColor blackColor];
    [self.navigationItem setTitleView:titleLabel];
    
    UINavigationBarAppearance* appearance = [UINavigationBarAppearance new];
    appearance.backgroundColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
    self.navigationController.navigationBar.standardAppearance = appearance;
    self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    
    // Do any additional setup after loading the view.
    self.personalView = [[personalPageView alloc] initWithFrame:self.view.bounds];
    
    self.personalView.tableView.delegate = self;
    self.personalView.tableView.dataSource = self;
    [self.personalView.tableView registerClass:[headPhotoCell class] forCellReuseIdentifier:@"headPhotoCell"];
    [self.personalView.tableView registerClass:[personalCell class] forCellReuseIdentifier:@"personalCell"];
    
    [self.view addSubview:self.personalView];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.personalView.tableView reloadData];
}

#pragma mark - UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 6;
    }
    return 0;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 120;
    } else if (indexPath.section == 1) {
        return 50;
    }
    return 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        headPhotoCell* cell = [tableView dequeueReusableCellWithIdentifier:@"headPhotoCell" forIndexPath:indexPath];
        if (!cell) {
            cell = [[headPhotoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"headPhotoCell"];
        }
        cell.personalImage.image = self.model.personalImage;
//        NSLog(@"cell中的UIImageView%@",cell.personalImage.image);
        cell.nameLabel.text = self.model.personalName;
//        NSLog(@"%@",self.model.personalName);
        
        cell.nameLabel.text = @"未知用户";
        
//        NSLog(@"%@",cell.nameLabel.text);
        cell.tagLabel.text = self.model.personalTag;
        cell.sayingLabel.text = self.model.personalSaying;
        // 瞎赋值一个
        cell.fkLabel.text = @"30";
        
        self.model.heartNum = [self.model caculateHeartNum];
        self.model.viewNum = [self.model caculateViewNum];
        
        cell.heartLabel.text = [NSString stringWithFormat:@"%ld",(long)self.model.heartNum];
        cell.viewLabel.text = [NSString stringWithFormat:@"%ld", (long)self.model.viewNum];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    } else if (indexPath.section == 1) {
        personalCell* cell = [tableView dequeueReusableCellWithIdentifier:@"personalCell" forIndexPath:indexPath];
        if (!cell) {
            cell = [[personalCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"personalCell"];
        }
        cell.tintColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
        cell.iconView.image = self.model.iconArray[indexPath.row];
        cell.titleLabel.text = self.model.nameArray[indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }
    return nil;
 }

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1 && indexPath.row == 0) {
        myUpLoadPageVC* myUpPage = [[myUpLoadPageVC alloc] init];
        myUpPage.model = self.model;
        [self.navigationController pushViewController:myUpPage animated:YES];
    } else if (indexPath.section == 1 && indexPath.row == 1) {
        messagePageVC* messageVC = [[messagePageVC alloc] init];
        [self.navigationController pushViewController:messageVC animated:YES];
    } else {
        NSLog(@"这里还在建设中...");
    }
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)test { 
    NSLog(@"没人用的方法");
}
@end
