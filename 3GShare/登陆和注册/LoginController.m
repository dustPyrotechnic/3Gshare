//
//  LoginController.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/21.
//

#import "LoginController.h"


@interface LoginController ()

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.LoginPage = [[login alloc] initWithFrame:self.view.bounds];
    self.LoginPage.delegate = self;
    
    self.Model = [[loginAndRegisterModel alloc] init];
    
    // 初始化数组
    self.Model.usersInfo = [[NSMutableArray alloc] init];

    // 添加管理员账号
    user* admin = [[user alloc] init];
    admin.name = @"1";
    admin.password = @"1";
    [self.Model.usersInfo addObject:admin];
    
    
    NSLog(@"当前账号有%@",self.Model.usersInfo);
    // 初始化缓存区
    self.userInfo = [[user alloc] init];
    
    self.loadPage = [[loadPage alloc] initWithFrame:self.view.bounds];
    
//    [self.view addSubview:self.LoginPage];
    [self.view addSubview:self.loadPage];
}

#pragma mark -登录部分
-(BOOL) isLoginSuccess {
    // 刷新自己的用户名和密码
    [self refreshUser];
    
//    if (![self.Model isValidUser:self.userInfo]) {
//        [self.LoginPage showMessage:@"用户名和密码长度必须大于3位"];
//        return NO;
//    }
//    
    if ([self.Model isLoginSuccess:self.userInfo]) {
        [self.LoginPage showMessage:@"登陆成功"];
        return YES;
    } else {
        [self.LoginPage showMessage:@"账号或密码有误"];
        return NO;
    }
    return NO;
}
/// 更新用户登录信息
- (void) refreshUser {
    UITextField* temp = [self.LoginPage viewWithTag:101];
    self.userInfo.name = temp.text;
    temp = [self.LoginPage viewWithTag:102];
    self.userInfo.password = temp.text;
}

- (void) goToLoadPage {
    [self.view addSubview:self.loadPage];
}

#pragma mark -注册部分方法
/// 呈现注册页面
- (void)presentRegisterPage:(registerPage *)View {
    self.registerPage = View;
    [self.view addSubview:View];
}
/// 检测是否成功注册，并根据情况弹出弹窗
- (BOOL) isRegisterSuccess {
    NSLog(@"更新信息");
    [self refershRegister];
    NSLog(@"检查是否合法");
    if (![self.Model isValidUser:self.userInfo]) {
        [self.registerPage showMessage:@"邮箱必须以.com结尾，用户名和密码长度必须大于3位"];
        return NO;
    }
    NSLog(@"确定合法");
    NSLog(@"检测是否已被注册");
    NSInteger temp = [self.Model isValidRegister:self.userInfo];
    if (temp == 1) {
        [self.registerPage showMessage:@"该邮箱已被注册！"];
        return NO;
    } else if (temp == 2) {
        [self.registerPage showMessage:@"该用户名不可用！"];
        return NO;
    } else if (temp == 0) {
        NSLog(@"检测无误");
        [self.registerPage showMessage:@"注册成功！"];
        // 注册成功后创建新的用户对象，避免下次注册时使用同一个对象
        self.userInfo = [[user alloc] init];
    }
    return YES;
}
/// 为登录界面填充信息
- (void) fillUserInfo {
    user* userInfo = [self.Model.usersInfo lastObject];
    UITextField* temp = [self.LoginPage viewWithTag:101];
    temp.text = userInfo.name;
    
    temp = [self.LoginPage viewWithTag:102];
    temp.text = userInfo.password;
}
/// 重新更新一遍注册信息，防止协议更新不及时
- (void) refershRegister {
    UITextField* temp = [self.registerPage viewWithTag:103];
    self.userInfo.email = temp.text;
    
    temp = [self.registerPage viewWithTag:101];
    self.userInfo.name = temp.text;
    
    temp  = [self.registerPage viewWithTag:102];
    self.userInfo.password = temp.text;
    NSLog(@"注册信息：email为%@，名字为%@，密码为%@",self.userInfo.email, self.userInfo.name, self.userInfo.password);
}


#pragma mark -通用方法
- (void)presentView:(UIAlertController*)View {
    [self presentViewController:View animated:YES completion:nil];
}


#pragma mark -UITextFieldDelegate
// 结束编辑的时候调用
- (void) textFieldDidEndEditing:(UITextField *)textField {
    if (textField.tag == 101 ) {
        self.userInfo.name = textField.text;
        NSLog(@"%@",self.userInfo.name);
    } else if (textField.tag == 102){
        self.userInfo.password = textField.text;
        NSLog(@"%@",self.userInfo.password);
    } else if (textField.tag == 103) {
        self.userInfo.email = textField.text;
        NSLog(@"%@", self.userInfo.email);
    }
}

// 点击return
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    NSLog(@"%@",self.userInfo);
    return YES;
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
