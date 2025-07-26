//
//  blogContext.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/24.
//

#import "blogContext.h"

NS_ASSUME_NONNULL_BEGIN

@implementation blogContext
- (instancetype) init {
    
    
    self = [super init];
    if (self) {
#pragma mark - cell需要的数据部分
        self.mainIma = [UIImage imageNamed:@"test.JPG"];
        self.mainTitle = @"博客标题";
        self.author = @"作者";
        self.lanunchTime = @"几分钟前发布";
        self.tagArray = @[@"标签1",@"标签2",@"标签3"];
        self.heartNum = 100;
        self.isHeart = NO;
        self.viewNum = 100;
        self.isView = NO;
        self.shareNum = 100;
        self.isShare = NO;
        
#pragma mark - 弹出的详情页需要的数据部分，包括上面
        // 初始化内容数组；

    }
    return self;
}
@end

NS_ASSUME_NONNULL_END
