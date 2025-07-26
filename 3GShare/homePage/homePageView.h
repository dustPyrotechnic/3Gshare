//
//  homePageView.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface homePageView : UIView
/// UITableView，显示主页面的滑动，分成两节
@property(nonatomic, strong) UITableView* mainTableview;
/// 代理为Controller
@property id<UITableViewDelegate, UITableViewDataSource> delegate;

NS_ASSUME_NONNULL_END
@end
