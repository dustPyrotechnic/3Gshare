//
//  upLoadPage.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface upLoadPage : UIView
@property (nonatomic, strong) UITableView* mainTableView;

@property (nonatomic, strong) id delegate;
@end

NS_ASSUME_NONNULL_END
