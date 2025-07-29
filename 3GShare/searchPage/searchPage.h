//
//  searchPage.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface searchPage : UIView

@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) id<UITableViewDelegate,UITableViewDataSource> delegate;
@end

NS_ASSUME_NONNULL_END
