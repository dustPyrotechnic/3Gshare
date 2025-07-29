//
//  imaCell.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/27.
//

#import <UIKit/UIKit.h>
#import "cellProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface imaCell : UITableViewCell <UITableViewDelegate,UITableViewDataSource>
// 选择图片
@property (nonatomic, strong) UIButton* imaBtn;
// 折叠TableView
@property (nonatomic, strong) UITableView* foldTableView;

///显示当前被选中的标签
@property (nonatomic, strong) UIButton* tagButton;
///显示下拉菜单的图标
@property (nonatomic, strong) UIButton* imaButton;
///选中标题是什么
@property (nonatomic, strong) NSString* strtag;
///标签一共都有些什么
@property (nonatomic, strong) NSArray* tagArray;

@property BOOL isExpand;

// 定位
@property (nonatomic, strong) UILabel* placeLabel;
/// 显示定位小图标
@property (nonatomic, strong) UIImageView* imaView;

@property (nonatomic, strong) id<cellProtocol> delegate;

@end

NS_ASSUME_NONNULL_END
