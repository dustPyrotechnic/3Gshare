//
//  messagePageVC.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/30.
//

#import <UIKit/UIKit.h>

#import "messagePage.h"
#import "messageModel.h"

#import "newFollowVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface messagePageVC : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) messagePage* messageView;
@property (nonatomic, strong) messageModel* model;


@end

NS_ASSUME_NONNULL_END
