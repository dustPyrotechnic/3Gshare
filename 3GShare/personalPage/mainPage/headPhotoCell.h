//
//  headPhotoCell.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface headPhotoCell : UITableViewCell
///头像照片显示
@property (nonatomic, strong) UIImageView* personalImage;
///名字标签
@property (nonatomic, strong) UILabel* nameLabel;
///标签标签
@property (nonatomic, strong) UILabel* tagLabel;
///签名标签
@property (nonatomic, strong) UILabel* sayingLabel;

///我也不知道叫什么的图标
@property (nonatomic, strong) UIImageView* fkImageView;
///爱心数图标
@property (nonatomic, strong) UIImageView* heartImageView;
///观看数图标
@property (nonatomic, strong) UIImageView* viewImageView;

///我也不知道叫什么的数量
@property (nonatomic, strong) UILabel* fkLabel;
///爱心数量
@property (nonatomic, strong) UILabel* heartLabel;
///观看数量
@property (nonatomic, strong) UILabel* viewLabel;


@end

NS_ASSUME_NONNULL_END
