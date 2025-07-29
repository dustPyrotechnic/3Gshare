//
//  activityPageVC.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/29.
//

#import <UIKit/UIKit.h>

#import "activityModel.h"
#import "activityPageView.h"

#import "activityCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface activityPageVC : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) activityModel* model;
@property (nonatomic, strong) activityPageView* actView;
@end

NS_ASSUME_NONNULL_END
