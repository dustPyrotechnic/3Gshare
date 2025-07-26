//
//  loadPage.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/23.
//

#import <UIKit/UIKit.h>
#import "LoginProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface loadPage : UIView
@property(nonatomic, strong) UILabel* maintitle;
@property(nonatomic, strong) UILabel* smalltitle;

@property(nonatomic, strong) id<LoginProtocol> delegate;
@end

NS_ASSUME_NONNULL_END
