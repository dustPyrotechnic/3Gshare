//
//  login.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/21.
//

#import "login.h"
#import "registerPage.h"

@implementation login
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.frame = frame;
    self.backgroundColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
    
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
    UITextField* nameTextField = [[UITextField alloc] init];
    UITextField* passwordTextField = [[UITextField alloc] init];
    nameTextField.frame = CGRectMake(0, 0, 300, 60);
    passwordTextField.frame = CGRectMake(0, 0, 300, 60);
    
    nameTextField.center = CGPointMake((self.frame.size.width - 300) / 2 + 150, self.frame.size.height / 2 - 70);
    passwordTextField.center = CGPointMake((self.frame.size.width - 300) / 2 + 150, self.frame.size.height/ 2 + 10);
    
    // 设置外观
    nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    passwordTextField.secureTextEntry = YES;
    
    // 设置阴影效果
    nameTextField.layer.shadowColor = [UIColor blackColor].CGColor;
    nameTextField.layer.shadowRadius = 4;
    nameTextField.layer.shadowOffset = CGSizeMake(2, 3);
    nameTextField.layer.shadowOpacity = 0.25;
    
    passwordTextField.layer.shadowColor = [UIColor blackColor].CGColor;
    passwordTextField.layer.shadowRadius = 4;
    passwordTextField.layer.shadowOffset = CGSizeMake(2, 3);
    passwordTextField.layer.shadowOpacity = 0.25;
    
    
    // 设置输入框左侧图标
    UIImageView* nameView = [[UIImageView alloc] initWithImage:[UIImage systemImageNamed:@"person"]];
    nameView.frame = CGRectMake(10, 0, 30, 30);
    nameView.contentMode = UIViewContentModeScaleAspectFit;
    UIImageView* passwordView =[[UIImageView alloc] initWithImage:[UIImage systemImageNamed:@"lock"]];
    passwordView.frame = CGRectMake(10, 0, 30, 30);
    passwordView.contentMode = UIViewContentModeScaleAspectFit;
    nameTextField.leftView = nameView;
    passwordTextField.leftView = passwordView;
    
    // 设置左侧视图的显示模式
    nameTextField.leftViewMode = UITextFieldViewModeAlways;
    passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    
    // 设置输入框占位符
    nameTextField.placeholder = @"用户名";
    passwordTextField.placeholder = @"密码";
    
    // 标签值，方便Controller来调控
    nameTextField.tag = 101;
    passwordTextField.tag = 102;
    
    nameTextField.delegate = self.delegate;
    passwordTextField.delegate = self.delegate;
    
    // 设置按钮
    UIButton* loginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton* registerBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    loginBtn.frame = CGRectMake(0, 0, 100, 50);
    registerBtn.frame = CGRectMake(0, 0, 100, 50);
    
    loginBtn.center = CGPointMake(self.frame.size.width / 2 - 50 - 10, self.frame.size.height / 2 + 80);
    registerBtn.center = CGPointMake(self.frame.size.width / 2 + 50 + 10, self.frame.size.height / 2 + 80);

    // 设置按钮标题和颜色
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    
    [loginBtn setBackgroundColor:[UIColor whiteColor]];
    [registerBtn setBackgroundColor:[UIColor whiteColor]];
    
    loginBtn.layer.cornerRadius = 5;
    registerBtn.layer.cornerRadius = 5;
    
    // 设置阴影
    loginBtn.layer.shadowColor = [UIColor blackColor].CGColor;
    loginBtn.layer.shadowRadius = 4;
    loginBtn.layer.shadowOffset = CGSizeMake(2, 3);
    loginBtn.layer.shadowOpacity = 0.25;
    
    registerBtn.layer.shadowColor = [UIColor blackColor].CGColor;
    registerBtn.layer.shadowRadius = 4;
    registerBtn.layer.shadowOffset = CGSizeMake(2, 3);
    registerBtn.layer.shadowOpacity = 0.25;
    
    [loginBtn setTitleColor:[UIColor labelColor] forState:UIControlStateNormal];
    [registerBtn setTitleColor:[UIColor labelColor] forState:UIControlStateNormal];
    // 设置操作
    [loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [registerBtn addTarget:self action:@selector(goToregisterPage) forControlEvents:UIControlEventTouchUpInside];
    
    // 自动登录按钮
    UIButton* AutoLogin = [UIButton buttonWithType:UIButtonTypeSystem];
    AutoLogin.frame = CGRectMake(0, 0, 20, 20);
    AutoLogin.layer.borderWidth = 2;
    AutoLogin.layer.borderColor = [UIColor colorWithRed:205 / 255.0 green:209 / 255.0 blue:211 / 255.0 alpha:1.0].CGColor;
    AutoLogin.layer.cornerRadius = 6;
    AutoLogin.backgroundColor = [UIColor clearColor];
    AutoLogin.center = CGPointMake(65, 570);
    // 添加操作
    [AutoLogin addTarget:self action:@selector(changeBtn:) forControlEvents:UIControlEventTouchUpInside];
    // 旁边添加label
    UILabel* labelLogin = [[UILabel alloc] init];
    labelLogin.text = @"自动登录";
    labelLogin.font = [UIFont systemFontOfSize:16];
    labelLogin.textColor = [UIColor colorWithRed:205 / 255.0 green:209 / 255.0 blue:211 / 255.0 alpha:1.0];
    labelLogin.frame = CGRectMake(0, 0, 70, 20);
    labelLogin.center = CGPointMake(110, 570);
    // 为按钮添加收回键盘的动作
    // 添加点击手势来收回键盘
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self addGestureRecognizer:tapGesture];
    
    // 加入视图
    [self addSubview:imageView];
    [self addSubview:label];
    [self addSubview:nameTextField];
    [self addSubview:passwordTextField];
    [self addSubview:loginBtn];
    [self addSubview:registerBtn];
    [self addSubview:AutoLogin];
    [self addSubview:labelLogin];
    return self;
}
- (void) changeBtn:(UIButton*)btn {
    if (btn.backgroundColor == [UIColor clearColor]) {
        btn.backgroundColor = [UIColor colorWithRed:205 / 255.0 green:209 / 255.0 blue:211 / 255.0 alpha:1.0];
    } else {
        btn.backgroundColor = [UIColor clearColor];
    }
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
- (void) login {
    if ([self.delegate isLoginSuccess]) {
        
        NSLog(@"已登录");
        [self goToLoadPage];
    }
    
}

- (void) goToLoadPage {
    [self.delegate goToLoadPage];
    [self removeFromSuperview];
    
}

- (void) goToregisterPage {
    registerPage* View = [[registerPage alloc] initWithFrame:self.bounds];
    View.delegate = self.delegate;
    [self.delegate presentRegisterPage:View];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dismissKeyboard {
    [self endEditing:YES];
}

@end
