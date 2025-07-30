//
//  personalPageView.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol personalPage <NSObject>

- (void) test;

@end
@interface personalPageView : UIView
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) id<personalPage> delegate;
@end

NS_ASSUME_NONNULL_END
