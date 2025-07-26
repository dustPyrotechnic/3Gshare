//
//  LoginProtocol.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/21.
//

#import <Foundation/Foundation.h>

@class registerPage;

NS_ASSUME_NONNULL_BEGIN

@protocol LoginProtocol <NSObject>

- (void) presentView:(UIAlertController*) View;
// 登录部分
- (BOOL) isLoginSuccess;
/// 进入加载页面
- (void) goToLoadPage;
// 注册部分
// 呈现注册页面
- (void) presentRegisterPage: (registerPage*) View;
/// 注册结果
- (BOOL) isRegisterSuccess;
// 把注册页面的值直接给登录界面
- (void) fillUserInfo;

/// 弹出主页面
- (void) presentHomePage;
@end

NS_ASSUME_NONNULL_END
