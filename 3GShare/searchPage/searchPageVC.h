//
//  searchPageVC.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/26.
//

#import <UIKit/UIKit.h>
#import "searchPage.h"
#import "searchPageModel.h"

#import "searchPageCell.h"
#import "homePageModel.h"

#import "uploadPageVC.h"

#import "tabbarController.h"

NS_ASSUME_NONNULL_BEGIN

@interface searchPageVC : UIViewController <UITableViewDelegate, UITableViewDataSource, searchCell, UITextFieldDelegate>
/// 显示主页面
@property (nonatomic, strong) searchPage* searchView;
/// 作为数据模型
@property (nonatomic, strong) searchPageModel* searchModel;

@property (nonatomic, strong) UISearchTextField* searchTextField;



/// 创建节标题视图
- (UIView *)sectionHeaderWithTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
