//
//  BaymaxModel.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/29.
//

#import "BaymaxModel.h"

NS_ASSUME_NONNULL_BEGIN

@implementation BaymaxModel
- (instancetype) init {
    self = [super init];
    if (self) {
        // 初始化数据
        self.searchBlog = [[NSMutableArray alloc] init];
        
        //可以在后期考虑做搜索部分
        blogContext* blog1 = [[blogContext alloc] init];
        blog1.mainIma = [UIImage imageNamed:@"1.jpg"];
        blog1.mainTitle = @"Love of Baymax";
        blog1.author = @"share小白";
        blog1.lanunchTime = @"15分钟前";
        NSLog(@"加入标签数组");
        blog1.tagArray = [[NSMutableArray alloc] init];
        [blog1.tagArray addObject:@"原创"];
        [blog1.tagArray addObject:@"UI"];
        [blog1.tagArray addObject:@"ICON"];
        
        blog1.heartNum = 102;
        blog1.viewNum = 26;
        blog1.shareNum = 20;
        
        blog1.isHeart = YES;
        blog1.isView = YES;
        blog1.isShare = YES;
        
        blogContext* blog2 = [[blogContext alloc] init];
        blog2.mainIma = [UIImage imageNamed:@"2.jpg"];
        blog2.mainTitle = @"大白";
        blog2.author = @"share小王";
        blog2.lanunchTime = @"1个月之前";
        blog2.tagArray = [[NSMutableArray alloc] init];
        
        [blog2.tagArray addObject:@"原创作品"];
        [blog2.tagArray addObject:@"摄影"];
        
        blog2.heartNum = 102;
        blog2.viewNum = 26;
        blog2.shareNum = 20;
        
        blog2.isHeart = YES;
        blog2.isView = YES;
        blog2.isShare = YES;
        NSLog(@"加入数组");
        [self.searchBlog addObject:blog1];
        [self.searchBlog addObject:blog2];
        
        
    }
    return self;
}


- (blogContext *)getBlogAt:(NSInteger)section {
    return self.searchBlog[section];
}

- (NSString*)providBlogTag:(NSIndexPath*)indexPath {
//    NSLog(@"为cell赋值");
    blogContext* blog = self.searchBlog[indexPath.section];
    NSArray* blogTag = blog.tagArray;
    NSMutableString* blogTagStr = [[NSMutableString alloc] init];
    for (int i = 0; i < blogTag.count; i++) {
        NSString* str = blogTag[i];
        [blogTagStr appendString:str];
        if (i < blogTag.count - 1) {
            [blogTagStr appendString:@"-"];
        }
    }
//    NSLog(@"model返回值为：%@",blogTagStr);
    return blogTagStr;
}

- (void)saveData:(blogContext*)blog atRow:(NSInteger)section {
    self.searchBlog[section] = blog;
}

@end

NS_ASSUME_NONNULL_END
