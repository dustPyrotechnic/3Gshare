//
//  notePageView.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/29.
//

#import <UIKit/UIKit.h>

#import "HMSegmentedControl/HMSegmentedControl.h"

NS_ASSUME_NONNULL_BEGIN
@protocol notePageViewDelegate <NSObject>

- (void) refreshData;

@end

@interface notePageView : UIView

/// 精选文章的tableView，tag:101
@property (nonatomic, strong) UITableView* greatTableView;
/// 热门推荐的tableView,tag:102
@property (nonatomic, strong) UITableView* hotTableView;
/// 全部文章,tag:103
@property (nonatomic, strong) UITableView* allTableView;
///切换tableView的部分
@property (nonatomic, strong) HMSegmentedControl* segment;

@property (nonatomic, strong) id<notePageViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
