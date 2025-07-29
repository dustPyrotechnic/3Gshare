//
//  loginAndRegisterModel.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/21.
//

#import <Foundation/Foundation.h>
#import "user.h"

NS_ASSUME_NONNULL_BEGIN

@interface loginAndRegisterModel : NSObject
/// 存储用户数据
@property (nonatomic, strong) NSMutableArray* usersInfo;

- (BOOL)isValidUser:(user*)users;
- (BOOL)isLoginSuccess:(user*)users;
/// 检测注册信息是否可用
///  - Returns:
///  0：注册成功
///  1：邮箱有重复
///  2：用户名有重复
///
///- Throws: 返回nil
- (NSInteger) isValidRegister:(user*) users;
@end

NS_ASSUME_NONNULL_END
