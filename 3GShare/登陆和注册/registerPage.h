//
//  registerPage.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/21.
//

#import <UIKit/UIKit.h>
#import "LoginProtocol.h"
#import "user.h"

NS_ASSUME_NONNULL_BEGIN

@interface registerPage : UIView
@property (nonatomic, strong) id<UITextFieldDelegate,LoginProtocol> delegate;
- (void) showMessage:(NSString*) Message;
@end

NS_ASSUME_NONNULL_END
