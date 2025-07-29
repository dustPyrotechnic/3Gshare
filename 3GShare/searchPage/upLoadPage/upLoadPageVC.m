//
//  upLoadPageVC.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/27.
//

#import "upLoadPageVC.h"

@interface upLoadPageVC ()

@end

@implementation upLoadPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.upLoadPageView = [[upLoadPage alloc] initWithFrame:self.view.bounds];
    self.upLoadPageView.mainTableView.delegate = self;
    self.upLoadPageView.mainTableView.dataSource = self;
    
    self.Model = [[upLoadModel alloc] init];
    
    [self.view addSubview:self.upLoadPageView];
    
    // 注册cell的复用标识符
    [self.upLoadPageView.mainTableView registerClass:[imaCell class] forCellReuseIdentifier:@"imaCell"];
    [self.upLoadPageView.mainTableView registerClass:[btnCell class] forCellReuseIdentifier:@"btnCell"];
    [self.upLoadPageView.mainTableView registerClass:[textFieldCell class] forCellReuseIdentifier:@"textFieldCell"];
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    // 添加点击空白收起键盘
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    tap.cancelsTouchesInView = NO; // 允许tableView的cell点击事件继续响应
    [self.view addGestureRecognizer:tap];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)dismissKeyboard {
    [self.view endEditing:YES];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.upLoadPageView.mainTableView reloadData];
}

- (void) pressBtn:(UIButton *)sender {
    // 查询按钮是否曾经已经被按下
    // 通过查询状态来改变按钮颜色
    UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
    [generator prepare];
    [generator impactOccurred];
    
    NSLog(@"当前按钮tag值为：%ld",(long)sender.tag);
//    NSLog(@"之前是否被按下：%@",[self.Model isButtonPress:sender.tag]);
    if (![self.Model isButtonPress:sender.tag]) {
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
            sender.backgroundColor = [UIColor systemBackgroundColor];
        } completion:^(BOOL finished){
            [UIView animateWithDuration:0.1 animations:^{
                sender.transform = CGAffineTransformIdentity;
            } completion:nil];
        }];
    }
    // 返回model按钮状态
    [self.Model saveBtnPress:sender.tag];
}

-(void)pushPhotoWall:(UIButton*)sender {
    upLoadPhotoWallPageVC* photoWall = [[upLoadPhotoWallPageVC alloc] init];
    [self.navigationController pushViewController:photoWall animated:YES];
//    NSLog(@"打开照片墙");
    NSLog(@"接收照片墙选中的数据");
    NSLog(@"更换按钮的照片");
}

#pragma mark -UITableView

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            if (self.isExand) {
                return 250;
            } else {
                return 160;;
            }
            return 160;
        case 1: // btnCell
            return 150;
        case 2: // textFieldCell
            return 300;
        default:
            return 44;
    }
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0: { // imaCell
            static NSString *imaCellIdentifier = @"imaCell";
            imaCell *cell = [tableView dequeueReusableCellWithIdentifier:imaCellIdentifier];
            if (cell == nil) {
                cell = [[imaCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:imaCellIdentifier];
            }
            cell.delegate = self;
            NSLog(@"准备进入判断");
            if (self.Model.selectedPhoto.count > 0) {
                NSLog(@"设置图像");
                [cell.imaBtn setImage:self.Model.selectedPhoto[0] forState:UIControlStateNormal];
                [cell.imaBtn setTitle:[NSString stringWithFormat:@"%ld",self.Model.selectedPhoto.count] forState:UIControlStateNormal];
                NSLog(@"创建提示符");
                UILabel* label = [[UILabel alloc] init];
                NSLog(@"赋值");
                label.text = [NSString stringWithFormat:@"%ld",self.Model.selectedPhoto.count];
                [cell.contentView addSubview:label];
                label.frame = CGRectMake(228, 20, 20, 20);
                label.backgroundColor = [UIColor systemRedColor];
                label.layer.cornerRadius = 10;
                label.layer.masksToBounds = YES;
                label.textColor = [UIColor whiteColor];
                label.font = [UIFont systemFontOfSize:12];
                label.textAlignment = NSTextAlignmentCenter;
                [cell.contentView addSubview:label];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        case 1: { // btnCell
            static NSString *btnCellIdentifier = @"btnCell";
            btnCell *cell = [tableView dequeueReusableCellWithIdentifier:btnCellIdentifier];
            if (cell == nil) {
                cell = [[btnCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:btnCellIdentifier];
            }
            cell.backgroundColor = [UIColor systemBackgroundColor];
            
            for (int i = 0; i < 8; i++) {
                
                UIButton* btn = [cell.contentView viewWithTag:101 + i];
                [btn setTitle:self.Model.strArr[i] forState:UIControlStateNormal];
                [btn setTitleColor:[UIColor labelColor] forState:UIControlStateNormal];
                
                if ([self.Model isButtonPress:btn.tag]) {
                    btn.backgroundColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
                } else {
                    btn.backgroundColor = [UIColor systemBackgroundColor];
                }
            }
            
            cell.delegate = self;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        case 2: { // textFieldCell
            static NSString *textFieldCellIdentifier = @"textFieldCell";
            textFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:textFieldCellIdentifier];
            if (cell == nil) {
                cell = [[textFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:textFieldCellIdentifier];
            }
            
            [cell.upLoadBtn addTarget:self action:@selector(getAllDataAndUpload) forControlEvents:UIControlEventTouchUpInside];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            // 设置textField的delegate
            cell.titleTextField.delegate = self;
            cell.txttextField.delegate = self;
            return cell;
        }
        default:
            return nil;
    }
}

#pragma mark -UITextField

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField.tag == 201 ) {
        self.Model.selfBlog.mainTitle = textField.text;
    } else if (textField == 202) {
        self.Model.selfBlog.text = textField.text;
    }
    NSLog(@"文本输入完成: %@", textField.text);
}

#pragma mark - CellDelegate

- (void)refreshPage {
    self.isExand = !self.isExand;
    [self.upLoadPageView.mainTableView reloadData];
}













///整合所有的数据，发布
- (void) getAllDataAndUpload {
    // 整理标签
    
    
    NSLog(@"整理标签");
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    NSLog(@"取出制定位置的cell");
    imaCell* cell = [self.upLoadPageView.mainTableView cellForRowAtIndexPath:indexPath];
    NSLog(@"为标签赋值");
    self.Model.selfBlog.tagArray = [NSMutableArray array];
    [self.Model.selfBlog.tagArray addObject:cell.strtag];
    
    
    
    
    NSLog(@"使用model整理数据");
    [self.Model upLoadNewBlog];
    
    // 弹出提示框，发布成功
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"发布成功" message:@"您的文章已发布成功" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alert addAction:action];
    
//    [self presentViewController:alert animated:YES completion:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
    // 更新完博客后，返回主页，并弹出当前页面
    [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshBlog" object:nil];
    
}









- (void)keyboardWillShow:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    CGRect keyboardFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardHeight = keyboardFrame.size.height;

    // 只在未上移时上移，避免多次叠加
    if (self.view.transform.ty == 0) {
        [UIView animateWithDuration:0.25 animations:^{
            self.view.transform = CGAffineTransformMakeTranslation(0, -keyboardHeight/2.0);
        }];
    }
}

- (void)keyboardWillHide:(NSNotification *)notification {
    [UIView animateWithDuration:0.25 animations:^{
        self.view.transform = CGAffineTransformIdentity;
    }];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
