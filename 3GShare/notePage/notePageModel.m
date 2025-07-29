//
//  notePageModel.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/29.
//

#import "notePageModel.h"

NS_ASSUME_NONNULL_BEGIN

@implementation notePageModel
- (instancetype) init {
    self = [super init];
    if (self) {
        self.blogArray = [[NSMutableArray alloc] init];
        NSLog(@"准备接收通知");
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getBlog:) name:@"allBlog" object:nil];
    }
    return self;
}
// 提供cell需要的数据
- (UIImage*)providMainIma:(NSIndexPath*)indexPath {
    blogContext* blog = self.blogArray[indexPath.row];
    UIImage* mainIma = blog.mainIma;
    return mainIma;
}

- (NSString*)providMainTitle:(NSIndexPath*)indexPath {
    blogContext* blog = self.blogArray[indexPath.row];
    NSString* mainTitle = blog.mainTitle;
    return mainTitle;
}

- (NSString*)providAuthor:(NSIndexPath*)indexPath {
    blogContext* blog = self.blogArray[indexPath.row];
    NSString* author = blog.author;
    return author;
}

- (NSString*)providLancunchTime:(NSIndexPath*)indexPath {
    blogContext* blog = self.blogArray[indexPath.row];
    NSString* lancunchTime = blog.lanunchTime;
    return lancunchTime;
}

- (NSString*)providBlogTag:(NSIndexPath*)indexPath {
//    NSLog(@"为cell赋值");
    blogContext* blog = self.blogArray[indexPath.row];
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

- (BOOL)provideIsHeart:(NSIndexPath*)indexPath {
    blogContext* blog = self.blogArray[indexPath.row];
    return blog.isHeart;
}

- (BOOL)provideIsView:(NSIndexPath*)indexPath {
    blogContext* blog = self.blogArray[indexPath.row];
    return blog.isView;
}

- (BOOL)provideIsShare:(NSIndexPath*)indexPath {
    blogContext* blog = self.blogArray[indexPath.row];
    return blog.isShare;
}

- (NSString*)provideHeartNum:(NSIndexPath*)indexPath {
    blogContext* blog = self.blogArray[indexPath.row];
    NSString* num = [NSString stringWithFormat:@"%ld",(long)blog.heartNum];
    return num;
}
- (NSString*)provideViewNum:(NSIndexPath*)indexPath {
    blogContext* blog = self.blogArray[indexPath.row];
    NSString* num = [NSString stringWithFormat:@"%ld",(long)blog.viewNum];
    return num;
}
- (NSString*)provideShareNum:(NSIndexPath*)indexPath {
    blogContext* blog = self.blogArray[indexPath.row];
    NSString* num = [NSString stringWithFormat:@"%ld",(long)blog.shareNum];
    return num;
}

- (void)saveData:(blogContext*)blog atRow:(NSInteger)row {
    NSLog(@"%ld",(long)row);
    self.blogArray[row] = blog;
}

- (void) getBlog: (NSNotification*) send {
    // 保存传来的blog
    NSLog(@"接收所有博客数据");
    self.blogArray = send.userInfo[@"blogArr"];
    
}

@end

NS_ASSUME_NONNULL_END
