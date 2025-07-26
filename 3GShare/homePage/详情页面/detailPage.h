//
//  detailPage.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface detailPage : UIView
@property (nonatomic, strong) id<UITableViewDelegate,UITableViewDataSource> delegate;

// 页面显示需要的元素

@property (nonatomic, strong) UIImageView* mainImg;
@property (nonatomic, strong) UILabel* mainTitle;
@property (nonatomic, strong) UILabel* authorLabel;
@property (nonatomic, strong) UILabel* launchtime;

// 按钮
@property (nonatomic, strong) UIButton* heartBtn;
// 显示是否查看过，并不是按钮
@property (nonatomic, strong) UIImageView* viewBtn;
@property (nonatomic, strong) UIButton* shareBtn;


@property (nonatomic, strong) UILabel* heartNum;
@property (nonatomic) BOOL isHeart;

@property (nonatomic, strong) UILabel* viewNum;
/// 查看是否被浏览，根据这个属性来调整按钮颜色
@property (nonatomic) BOOL isView;

@property (nonatomic, strong) UILabel* shareNum;
@property (nonatomic) BOOL isShare;


@property (nonatomic, strong) UITableView* mainTableview;



@end

NS_ASSUME_NONNULL_END
