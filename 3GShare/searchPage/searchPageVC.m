//
//  searchPageVC.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/26.
//

#import "searchPageVC.h"
#import "CoreHaptics/CoreHaptics.h"

#import "BaymaxVC.h"

@interface searchPageVC ()

@end

@implementation searchPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.searchView = [[searchPage alloc] initWithFrame:self.view.bounds];
    self.searchModel = [[searchPageModel alloc] init];
    
    UIButton* leftBtn = [[UIButton alloc] init];
    [leftBtn setImage:[UIImage systemImageNamed:@"paperplane"] forState:UIControlStateNormal];
    leftBtn.tintColor = [UIColor systemGray6Color];
    [leftBtn addTarget:self action:@selector(pushToUploadPage) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
    
    
    // 注册cell
    [self.searchView.tableView registerClass:[searchPageCell class] forCellReuseIdentifier:@"searchPageCell"];
    [self.searchView.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"searchCell"];
    
    self.searchView.delegate = self;
    
    [self.view addSubview:self.searchView];
//    self.navigationItem.title = @"搜索";
    
    self.searchTextField = [[UISearchTextField alloc] init];
    self.searchTextField.placeholder = @"请输入搜索内容...";
    self.searchTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.searchTextField.textColor = [UIColor labelColor];
    self.searchTextField.font = [UIFont systemFontOfSize:16];
    // 设置清除按钮模式
    self.searchTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    // 设置键盘类型
    self.searchTextField.keyboardType = UIKeyboardTypeDefault;
    // 设置返回键类型
    self.searchTextField.returnKeyType = UIReturnKeySearch;
    // 设置代理
    self.searchTextField.delegate = self;
    
    
    
    
    // 设置标题大小
    UILabel* titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"搜索";
    titleLabel.font = [UIFont systemFontOfSize:24.0];
    titleLabel.textColor = [UIColor blackColor];
    [self.navigationItem setTitleView:titleLabel];
        
    UINavigationBarAppearance* appearance = [UINavigationBarAppearance new];
    appearance.backgroundColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
    self.navigationController.navigationBar.standardAppearance = appearance;
    self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    
    // 添加点击手势来收起键盘
    [self setupKeyboardDismissGesture];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 注册键盘显示/隐藏通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // 移除键盘通知
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}

#pragma mark -UITableViewDelegate & UITableViewDataSourse
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        return 140;
    }
    return 80;
}


-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 搜索栏的cell
    if (indexPath.section == 0) {
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"searchCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"searchCell"];
        }
        self.searchTextField.frame = CGRectMake(10, 10, 382, 60);
        [cell.contentView addSubview:self.searchTextField];
        return cell;
    } else {
        searchPageCell* cell = [tableView dequeueReusableCellWithIdentifier:@"searchPageCell" forIndexPath:indexPath];
        if (!cell) {
            cell = [[searchPageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"searchPageCell"];
        }
        
        cell.delagate = self;
        NSArray* array = [self.searchModel getBtnTitleArray:indexPath.section - 1]; // 减1因为section 0是搜索栏
        
        // 两行，每行四个按钮
        if (indexPath.section == 1) {
            for (int j = 0; j < 2; j++) {
                NSInteger num = j * 4;
                for (int i = 0; i < 4; i++) {
                    UIButton* btn = [cell.contentView viewWithTag:101 + i + num];
                    // 设置cell的标题和标题颜色
                    if (btn && i + num < array.count) {
                        [btn setTitle:array[j * 4 + i] forState:UIControlStateNormal];
                        [btn setTitleColor:[UIColor labelColor] forState:UIControlStateNormal];
                    }
                    // 根据cell的状态来设置按钮颜色，表示是否被按下
                    if ([self.searchModel isButtonPress:101 + i + num andIndexPath:indexPath]) {
                        btn.backgroundColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
                    } else {
                        btn.backgroundColor = [UIColor systemBackgroundColor];
                    }
                }
            }
            
        } else if (indexPath.section == 2 || indexPath.section == 3) {
            for (int i = 0; i < 4; i++) {
                UIButton* btn = [cell.contentView viewWithTag:101 + i];
                
                if (btn && i < array.count) {
                    [btn setTitle:array[i] forState:UIControlStateNormal];
                    [btn setTitleColor:[UIColor labelColor] forState:UIControlStateNormal];
                }
                
                if ([self.searchModel isButtonPress:101 + i andIndexPath:indexPath]) {
                    btn.backgroundColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
                } else {
                    btn.backgroundColor = [UIColor systemBackgroundColor];
                }
                
            }
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
}

#pragma mark -searchcell

- (void) pressBtn:(UIButton *)sender atIndex:(nonnull NSIndexPath *)indexPath {
    // 查询按钮是否曾经已经被按下
    // 通过查询状态来改变按钮颜色
    UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
    [generator prepare];
    [generator impactOccurred];
    if (![self.searchModel isButtonPress:sender.tag andIndexPath:indexPath]) {
        // 此时为没有按下状态
        [UIView animateWithDuration:0.1 animations:^{
            sender.transform = CGAffineTransformMakeScale(0.95, 0.95);
            // 使用自定义collor
            sender.backgroundColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
        } completion:^(BOOL finished){
            [UIView animateWithDuration:0.1 animations:^{
                sender.transform = CGAffineTransformIdentity;
            } completion:nil];
        }];
    } else {
        // 按钮之前就被按下过
        [UIView animateWithDuration:0.1 animations:^{
            sender.transform = CGAffineTransformMakeScale(0.95, 0.95);
            // 使用自定义collor
            sender.backgroundColor = [UIColor systemBackgroundColor];
        } completion:^(BOOL finished){
            [UIView animateWithDuration:0.1 animations:^{
                sender.transform = CGAffineTransformIdentity;
            } completion:nil];
        }];
    }
    // 返回model按钮状态
    [self.searchModel saveBtnPress:sender.tag andIndexPath:indexPath];
}


#pragma mark -<UITextFieldDelegate>
// 点击返回键
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // 收起键盘
    [textField resignFirstResponder];
    if ([textField.text isEqual:@"大白"])  {
        BaymaxVC* bayMax = [[BaymaxVC alloc] init];
        [self.navigationController pushViewController:bayMax animated:YES];
    }
    // 这里弹出搜索结果
    NSLog(@"搜索内容: %@", textField.text);
    return YES;
}

#pragma mark - 弹出到发布页面
/// 弹出到发布页面
- (void) pushToUploadPage {
    upLoadPageVC* uploadPage = [[upLoadPageVC alloc] init];
    [self.navigationController pushViewController:uploadPage animated:YES];
    NSLog(@"发布内容");
}

#pragma mark - 节标题视图
/// 创建节标题视图
- (UIView *)sectionHeaderWithTitle:(NSString *)title {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
    headerView.backgroundColor = [UIColor clearColor];
    
    // 设置阴影效果，增强立体感
    headerView.layer.shadowColor = [UIColor blackColor].CGColor;
    headerView.layer.shadowOffset = CGSizeMake(0, 2);
    headerView.layer.shadowOpacity = 0.2;
    headerView.layer.shadowRadius = 4;
    
    // 创建背景视图，用于显示蓝色背景
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(16, 8, self.view.bounds.size.width - 32, 32)];
    backgroundView.backgroundColor = [UIColor colorWithRed:79/255.0 green:141/255.0 blue:198/255.0 alpha:1.0];
    backgroundView.layer.cornerRadius = 8;
    [headerView addSubview:backgroundView];
    
    // 系统图标tag
    UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(24, 12, 20, 20)];
    iconView.image = [UIImage systemImageNamed:@"tag"];
    iconView.tintColor = [UIColor whiteColor];
    [headerView addSubview:iconView];
    
    // 标题文字
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(52, 8, 200, 32)];
    label.text = title;
    label.font = [UIFont boldSystemFontOfSize:16];
    label.textColor = [UIColor whiteColor];
    [headerView addSubview:label];
    
    return headerView;
}

#pragma mark - TableView Section Header
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return [self sectionHeaderWithTitle:@"分类"];
    } else if (section == 2) {
        return [self sectionHeaderWithTitle:@"推荐"];
    } else if (section == 3) {
        return [self sectionHeaderWithTitle:@"时间"];
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1 || section == 2 || section == 3) {
        return 40;
    }
    return 0.01;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - 键盘处理
/// 设置点击手势来收起键盘
- (void)setupKeyboardDismissGesture {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    tapGesture.cancelsTouchesInView = NO; // 允许其他手势继续工作
    [self.view addGestureRecognizer:tapGesture];
}

/// 收起键盘
- (void)dismissKeyboard {
    [self.searchTextField resignFirstResponder];
}

/// 键盘将要显示
- (void)keyboardWillShow:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    NSValue *keyboardFrameValue = userInfo[UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardFrame = [keyboardFrameValue CGRectValue];
    
    // 可以在这里调整UI布局，比如调整tableView的contentInset
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0, 0, keyboardFrame.size.height, 0);
    self.searchView.tableView.contentInset = contentInsets;
    self.searchView.tableView.scrollIndicatorInsets = contentInsets;
}

/// 键盘将要隐藏
- (void)keyboardWillHide:(NSNotification *)notification {
    // 恢复tableView的contentInset
    self.searchView.tableView.contentInset = UIEdgeInsetsZero;
    self.searchView.tableView.scrollIndicatorInsets = UIEdgeInsetsZero;
}

@end
