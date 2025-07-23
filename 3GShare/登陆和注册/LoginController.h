//
//  LoginController.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/21.
//

#import <UIKit/UIKit.h>
#import "LoginProtocol.h"
#import "login.h"
#import "registerPage.h"
#import "loginAndRegisterModel.h"
#import "user.h"

#import "loadPage.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginController : UIViewController <UITextFieldDelegate, LoginProtocol>
// 暂时存储数据
@property (nonatomic, strong) user* userInfo;

// V
@property (nonatomic, strong) login* LoginPage;
@property (nonatomic, strong) registerPage* registerPage;
@property (nonatomic, strong) loadPage* loadPage;
// M
@property (nonatomic, strong) loginAndRegisterModel* Model;
@end

NS_ASSUME_NONNULL_END
