//
//  normalCell.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class normalCell;

@protocol normallCellprotocol <NSObject>
/// 更新model里的数据
- (void)refreshData:(normalCell*)cell;

@end

@interface normalCell : UITableViewCell
/// 封面图
@property (nonatomic, strong) UIImageView* mainImg;
/// 主标题
@property (nonatomic, strong) UILabel* mainTitle;
@property (nonatomic, strong) UILabel* authorLabel;
/// 博客标签
@property (nonatomic, strong) UILabel* blogTag;
/// 发布时间
@property (nonatomic, strong) UILabel* lancunchTime;
/// 浏览数据


// 按钮
@property (nonatomic, strong) UIButton* heartBtn;
/// 显示是否查看过，并不是按钮
@property (nonatomic, strong) UIImageView* viewBtn;
@property (nonatomic, strong) UIButton* shareBtn;


@property (nonatomic, strong) UILabel* heartNum;
@property (nonatomic) BOOL isHeart;

@property (nonatomic, strong) UILabel* viewNum;
/// 查看是否被浏览，根据这个属性来调整按钮颜色
@property (nonatomic) BOOL isView;

@property (nonatomic, strong) UILabel* shareNum;
@property (nonatomic) BOOL isShare;

@property (nonatomic, strong) id<normallCellprotocol> delegate;

@end

NS_ASSUME_NONNULL_END
