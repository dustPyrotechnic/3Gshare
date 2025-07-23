//
//  registerPage.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/21.
//

#import "registerPage.h"

@implementation registerPage
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.frame = frame;
    self.backgroundColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
    // 返回按钮
    UIButton* returnBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    returnBtn.frame = CGRectMake(0, 0, 50, 44);
    returnBtn.center = CGPointMake(41, 78.33);
    [returnBtn setImage:[UIImage systemImageNamed:@"arrow.left"] forState:UIControlStateNormal];
    returnBtn.tintColor = [UIColor colorWithRed:227 / 255.0 green: 241 / 255.0 blue: 255 / 255.0 alpha:1.0];
    [returnBtn addTarget:self action:@selector(returnLogin) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:returnBtn];
    
    // 设置图标的样式
    UIImage* image = [UIImage imageNamed:@"ic_launcher-web.png"];
    UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(0, 0, 100, 100);
    imageView.center = CGPointMake(self.frame.size.width / 2 , self.frame.size.height / 2 - 250);
    imageView.layer.cornerRadius = 50;
    imageView.clipsToBounds = YES;
    
    // 设置label
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
    label.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2 - 170);
    label.font = [UIFont boldSystemFontOfSize:25];
    
    // 设置label文本
    label.text = @"3GShare";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    
    // 设置输入框的位置
    UITextField* emailTextField = [[UITextField alloc] init];
    UITextField* nameTextField = [[UITextField alloc] init];
    UITextField* passwordTextField = [[UITextField alloc] init];
    emailTextField.frame = CGRectMake(0, 0, 300, 40);
    nameTextField.frame = CGRectMake(0, 0, 300, 40);
    passwordTextField.frame = CGRectMake(0, 0, 300, 40);
    
    emailTextField.center = CGPointMake((self.frame.size.width - 300) / 2 + 150, self.frame.size.height / 2 - 90);
    nameTextField.center = CGPointMake((self.frame.size.width - 300) / 2 + 150, self.frame.size.height / 2 - 40);
    passwordTextField.center = CGPointMake((self.frame.size.width - 300) / 2 + 150, self.frame.size.height/ 2 + 10);
    
    // 设置外观
    emailTextField.borderStyle = UITextBorderStyleRoundedRect;
    nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    passwordTextField.secureTextEntry = YES;
    
    // 设置输入框左侧图标
    UIImageView* emailView = [[UIImageView alloc] initWithImage:[UIImage systemImageNamed:@"envelope"]];
    emailView.frame = CGRectMake(10, 0, 30, 30);
    emailView.contentMode = UIViewContentModeScaleAspectFit;
    UIImageView* nameView = [[UIImageView alloc] initWithImage:[UIImage systemImageNamed:@"person"]];
    nameView.frame = CGRectMake(10, 0, 30, 30);
    nameView.contentMode = UIViewContentModeScaleAspectFit;
    UIImageView* passwordView =[[UIImageView alloc] initWithImage:[UIImage systemImageNamed:@"lock"]];
    passwordView.frame = CGRectMake(10, 0, 30, 30);
    passwordView.contentMode = UIViewContentModeScaleAspectFit;
    
    emailTextField.leftView = emailView;
    nameTextField.leftView = nameView;
    passwordTextField.leftView = passwordView;
    
    // 设置左侧视图的显示模式
    emailTextField.leftViewMode = UITextFieldViewModeAlways;
    nameTextField.leftViewMode = UITextFieldViewModeAlways;
    passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    
    // 设置输入框占位符
    emailTextField.placeholder = @"邮箱";
    nameTextField.placeholder = @"用户名";
    passwordTextField.placeholder = @"密码";
    
    // 标签值，方便Controller来调控
    emailTextField.tag = 103;
    nameTextField.tag = 101;
    passwordTextField.tag = 102;
    
    emailTextField.delegate = self.delegate;
    nameTextField.delegate = self.delegate;
    passwordTextField.delegate = self.delegate;
    
    // 设置阴影效果
    emailTextField.layer.shadowColor = [UIColor blackColor].CGColor;
    emailTextField.layer.shadowRadius = 4;
    emailTextField.layer.shadowOffset = CGSizeMake(2, 3);
    emailTextField.layer.shadowOpacity = 0.25;
    
    nameTextField.layer.shadowColor = [UIColor blackColor].CGColor;
    nameTextField.layer.shadowRadius = 4;
    nameTextField.layer.shadowOffset = CGSizeMake(2, 3);
    nameTextField.layer.shadowOpacity = 0.25;
    
    passwordTextField.layer.shadowColor = [UIColor blackColor].CGColor;
    passwordTextField.layer.shadowRadius = 4;
    passwordTextField.layer.shadowOffset = CGSizeMake(2, 3);
    passwordTextField.layer.shadowOpacity = 0.25;
    
    // 设置按钮
//    UIButton* loginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton* registerBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
//    loginBtn.frame = CGRectMake(0, 0, 100, 50);
    registerBtn.frame = CGRectMake(0, 0, 150, 50);
    
//    loginBtn.center = CGPointMake(self.frame.size.width / 2 - 50 - 10, self.frame.size.height / 2 + 80);
    registerBtn.center = CGPointMake(self.frame.size.width / 2 , self.frame.size.height / 2 + 80);

    // 设置按钮标题和颜色
//    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    registerBtn.font = [UIFont systemFontOfSize:20];
    
    // 阴影效果
    registerBtn.layer.shadowColor = [UIColor blackColor].CGColor;
    registerBtn.layer.shadowRadius = 4;
    registerBtn.layer.shadowOffset = CGSizeMake(2, 3);
    registerBtn.layer.shadowOpacity = 0.25;
    
//    [loginBtn setBackgroundColor:[UIColor colorWithRed:205 / 255.0 green:209 / 255.0 blue:211 / 255.0 alpha:1.0]];
    [registerBtn setBackgroundColor:[UIColor whiteColor]];
    
//    [loginBtn setTitleColor:[UIColor labelColor] forState:UIControlStateNormal];
    [registerBtn setTitleColor:[UIColor labelColor] forState:UIControlStateNormal];
    
//    // 自动登录按钮
//    UIButton* AutoLogin = [UIButton buttonWithType:UIButtonTypeSystem];
//    AutoLogin.frame = CGRectMake(0, 0, 20, 20);
//    AutoLogin.layer.borderWidth = 2;
//    AutoLogin.layer.borderColor = [UIColor colorWithRed:205 / 255.0 green:209 / 255.0 blue:211 / 255.0 alpha:1.0].CGColor;
//    AutoLogin.layer.cornerRadius = 6;
//    AutoLogin.backgroundColor = [UIColor clearColor];
//    AutoLogin.center = CGPointMake(65, 570);
    // 添加操作
    
    // 为按钮添加收回键盘的动作
//    [loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [registerBtn addTarget:self action:@selector(registerUser) forControlEvents:UIControlEventTouchUpInside];

    // 添加点击手势来收回键盘
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self addGestureRecognizer:tapGesture];
    
    
    // 加入视图
    [self addSubview:imageView];
    [self addSubview:label];
    [self addSubview:emailTextField];
    [self addSubview:nameTextField];
    [self addSubview:passwordTextField];
//    [self addSubview:loginBtn];
    [self addSubview:registerBtn];
//    [self addSubview:AutoLogin];
    return self;
}

- (void) registerUser {
//    BOOL temp = [self.delegate isRegisterSuccess];
//    NSLog(@"进入判断，temp值为：%@，方法返回结果为：%@",temp, [self.delegate isRegisterSuccess]);
    if ([self.delegate isRegisterSuccess]) {
        [self returnLogin];
        [self.delegate fillUserInfo];
    }
    NSLog(@"注册");
}

- (void) returnLogin {
    [self removeFromSuperview];
}

- (void)dismissKeyboard {
    [self endEditing:YES];
}

- (void) showMessage:(NSString*)Message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示"
                                                                           message:Message
                                                                    preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确认"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    [alertController addAction:cancelAction];
    [self.delegate presentView:alertController];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
