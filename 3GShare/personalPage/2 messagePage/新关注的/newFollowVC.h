//
//  newFollowVC.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/30.
//

#import <UIKit/UIKit.h>
#import "newFollowModel.h"
#import "newFollow.h"
#import "newFollowCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface newFollowVC : UIViewController <UITableViewDelegate, UITableViewDataSource, newFollowDelegate>
@property (nonatomic, strong) newFollow* followView;
@property (nonatomic, strong) newFollowModel* model;
@end

NS_ASSUME_NONNULL_END
