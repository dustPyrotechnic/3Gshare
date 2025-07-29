//
//  notePageVC.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/29.
//

#import <UIKit/UIKit.h>


#import "normalCell.h"
// 属于自己的页面
#import "notePageView.h"
#import "notePageModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface notePageVC : UIViewController <UITableViewDelegate, UITableViewDataSource, normallCellprotocol, modelDelegate, notePageViewDelegate>
///主页面
@property (nonatomic, strong) notePageView* noteView;
///主模型
@property (nonatomic, strong) notePageModel* model;
@end

NS_ASSUME_NONNULL_END
