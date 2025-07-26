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

@protocol changeWindow <NSObject>

- (void) changeWindow;

@end

@interface LoginController : UIViewController <UITextFieldDelegate, LoginProtocol>
// 暂时存储数据
@property (nonatomic, strong) user* userInfo;

// V
@property (nonatomic, strong) login* LoginPage;
@property (nonatomic, strong) registerPage* registerPage;
@property (nonatomic, strong) loadPage* loadPage;


// M
@property (nonatomic, strong) loginAndRegisterModel* Model;

@property (nonatomic, strong) id<changeWindow> delegate;
@end

NS_ASSUME_NONNULL_END
