//
//  loginAndRegisterModel.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/21.
//

#import "loginAndRegisterModel.h"

@implementation loginAndRegisterModel
- (BOOL)isValidUser:(user*)users {
    if (users.email) {
        return [users.email hasSuffix:@".com"]&& users.name.length > 3 && users.password.length > 3;;
    }
    return users.name.length > 3 && users.password.length > 3;
}
#pragma mark -登录方法
- (BOOL)isLoginSuccess:(user*)users {
    
    for (user* temp in self.usersInfo) {
        NSLog(@"当前名字为%@，比较名字为%@", users.name, temp.name);
        if ([users.name isEqual:temp.name]) {
            NSLog(@"当前密码为%@，比较密码为%@", users.password, temp.password);
            if ([users.password isEqual:temp.password]) {
                NSLog(@"登录完毕，用户名为%@，密码为%@", users.name, users.password);
                return YES;
            }
        }
    }
    NSLog(@"登录失败，没有找到对应的用户名和密码");
    return NO;
}

#pragma mark -注册方法
- (NSInteger) isValidRegister:(user*) users {
    NSLog(@"账号密码总览");
    for (user* temp in self.usersInfo) {
        NSLog(@"账号为%@，名字为为%@",temp.email, temp.name);
    }
    for (user* temp in self.usersInfo) {
        NSLog(@"当前名字为%@，比较名字为%@", users.name, temp.name);
        NSLog(@"当前邮箱为%@，比较邮箱为%@", users.email, temp.email);
        if ([users.email isEqual:temp.email]) {
            return 1;
        } else if([users.name isEqual:temp.name]) {
            return 2;
        }
    }
    [self.usersInfo addObject:users];
    return 0;
}
@end
