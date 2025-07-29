//
//  BaymaxModel.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/29.
//

#import <Foundation/Foundation.h>
#import "blogContext.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaymaxModel : NSObject
///存放搜索到的博客
///
///这里使用的是定值
@property (nonatomic, strong) NSMutableArray* searchBlog;
///取得指定位置的blog
- (blogContext*) getBlogAt:(NSInteger)section;

- (NSString*)providBlogTag:(NSIndexPath*)indexPath;

- (void)saveData:(blogContext*)blog atRow:(NSInteger)section;
@end

NS_ASSUME_NONNULL_END
