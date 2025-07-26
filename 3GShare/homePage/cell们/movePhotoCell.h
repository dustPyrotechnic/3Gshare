//
//  movePhotoCell.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface movePhotoCell : UITableViewCell <UIScrollViewDelegate>
/// 滚动视图，显示照片
@property (nonatomic, strong) UIScrollView* mainScrollView;
/// 用来显示滚动的页数和当前的位置
@property (nonatomic, strong) UIPageControl* mainPageControl;


@end

NS_ASSUME_NONNULL_END
