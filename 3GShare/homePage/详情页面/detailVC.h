//
//  detailVC.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/25.
//

#import <UIKit/UIKit.h>
#import "normalCell.h"
#import "blogContext.h"
#import "detailPage.h"
#import "homePageModel.h"

#import "detailPageTableViewCell.h"


NS_ASSUME_NONNULL_BEGIN

@interface detailVC : UIViewController<UITableViewDelegate,UITableViewDataSource>

/// 当前cell的详情页面
@property normalCell* cell;
@property blogContext* blog;
// 图片数组
@property (nonatomic, strong) NSArray* imaArray;

// 主页面
@property (nonatomic,strong) detailPage* detailView;

// 模型
@property (nonatomic, strong) homePageModel* model;
@property (nonatomic, strong) NSIndexPath* indexPath;



@end

NS_ASSUME_NONNULL_END
