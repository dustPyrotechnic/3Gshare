//
//  homePageModel.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "blogContext.h"

NS_ASSUME_NONNULL_BEGIN

@interface homePageModel : NSObject
// 提供博客数组
@property (nonatomic, strong) NSMutableArray* blogArr;
/// 为第一个cell的滑动照片墙提供照片数组
- (NSArray*) providesImages;
// 为第二个cell提供主图片
- (UIImage*)providMainIma:(NSIndexPath*)indexPath;
// 为第二个cell提供主标题
- (NSString*)providMainTitle:(NSIndexPath*)indexPath;
// 为第二个cell提供作者
- (NSString*)providAuthor:(NSIndexPath*)indexPath;
// 为第二个cell提供发布时间
- (NSString*)providLancunchTime:(NSIndexPath*)indexPath;
// 为第二个cell提供博客标签
- (NSString*)providBlogTag:(NSIndexPath*)indexPath;
// 为第二个cell提供点赞数量
- (NSString*)provideHeartNum:(NSIndexPath*)indexPath;
// 为第二个cell提供查看数量
- (NSString*)provideViewNum:(NSIndexPath*)indexPath;
// 为第二个cell提供分享数量
- (NSString*)provideShareNum:(NSIndexPath*)indexPath;
// 为第二个cell提供是否点赞
- (BOOL)provideIsHeart:(NSIndexPath*)indexPath;
// 为第二个cell提供是否查看
- (BOOL)provideIsView:(NSIndexPath*)indexPath;
// 为第二个cell提供是否分享
- (BOOL)provideIsShare:(NSIndexPath*)indexPath;

- (void)saveData:(blogContext*)blog atRow:(NSInteger)row;


@end

NS_ASSUME_NONNULL_END

