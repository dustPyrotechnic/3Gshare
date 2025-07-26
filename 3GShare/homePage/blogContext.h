//
//  blogContext.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface blogContext : NSObject
/// 封面图
@property (nonatomic, strong) UIImage* mainIma;
/// 发布内容包括封面图
@property (nonatomic, strong) NSArray* imaArray;
/// 标题
@property (nonatomic, strong) NSString* mainTitle;

@property (nonatomic, strong) NSString* author;
/// 标签数组，以字符串分开储存
@property (nonatomic, strong) NSArray* tagArray;
/// 发布时间（几分钟前）
@property (nonatomic, strong) NSString* lanunchTime;

/// 点赞数
@property (nonatomic) NSInteger heartNum;
@property (nonatomic) BOOL isHeart;
/// 观看数
@property (nonatomic) NSInteger viewNum;

@property (nonatomic) BOOL isView;
/// 分享数
@property (nonatomic) NSInteger shareNum;
@property (nonatomic) BOOL isShare;



@end
 
NS_ASSUME_NONNULL_END
