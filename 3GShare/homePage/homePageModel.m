//
//  homePageModel.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/24.
//

#import "homePageModel.h"

NS_ASSUME_NONNULL_BEGIN

@implementation homePageModel
- (instancetype)init {
    self = [super init];
    if (self) {
        self.blogArr = [[NSMutableArray alloc] init];
        // 写博客标题数组
        NSArray* titleArr = @[@"假日",@"meme梗图合集2",@"每日园艺小技巧",@"meme梗图",@"我们风息也是翻身了",@"鹿野- 干员介绍",@"师姐和小黑",@"无限手撕木头",@"明日方舟工招词条",@"小黑的日常"];
        // 作者数组
        NSArray* authorArr = @[@"share小白",@"我是张维为老师",@"最爱希儿了！",@"中国人口吧",@"才不是萝莉控呢！",@"鹰角网络",@"作者7",@"作者8",@"血狼破军",@"作者10"];
        // 发布时间数组
        NSArray* lancunchTimeArr = @[@"15分钟前发布",@"几分钟前发布",@"几分钟前发布",@"几分钟前发布",@"几分钟前发布",@"几分钟前发布",@"几分钟前发布",@"几分钟前发布",@"几分钟前发布",@"几分钟前发布"];
        // 标签数组
        NSArray* tagArr = @[
          @[@"原创",@"插画",@"练习习作"],
          @[@"标签2"],
          @[@"标签3"],
          @[@"标签4"],
          @[@"标签5"],
          @[@"明日方舟"],
          @[@"标签7"],
          @[@"标签8"],
          @[@"标签9"],
          @[@"标签10"]
        ];
        // 点赞数组
        NSArray* heartArr = @[@"102",@"20",@"30",@"40",@"50",@"60",@"70",@"80",@"90",@"100"];
        // 查看数组
        NSArray* viewArr = @[@"20",@"40",@"60",@"80",@"100",@"120",@"140",@"160",@"180",@"200"];
        // 分享数组
        NSArray* shareArr = @[@"26",@"80",@"120",@"160",@"200",@"240",@"280",@"320",@"360",@"400"];
        // 是否点赞数组
        NSArray* isHeartArr = @[@"YES",@"NO",@"YES",@"NO",@"YES",@"NO",@"YES",@"NO",@"YES",@"NO"];
        // 是否查看数组
        NSArray* isViewArr = @[@"NO",@"NO",@"NO",@"NO",@"NO",@"NO",@"NO",@"NO",@"NO",@"NO"];
        // 是否分享数组
        NSArray* isShareArr = @[@"YES",@"NO",@"YES",@"NO",@"YES",@"NO",@"YES",@"NO",@"YES",@"NO"];

        // 在这里一会直接写进来数据
        for (int i = 0; i < 10; i++) {
            blogContext* blog = [[blogContext alloc] init];
            blog.mainIma = [UIImage imageNamed:[NSString stringWithFormat:@"blog%d.JPG",i]];
            if (!blog.mainIma) {
                blog.mainIma = [UIImage imageNamed:[NSString stringWithFormat:@"blog%d.png",i]];
            }
            blog.mainTitle = titleArr[i];
            blog.author = authorArr[i];
            blog.lanunchTime = lancunchTimeArr[i];
            blog.tagArray = tagArr[i];
            blog.heartNum = [heartArr[i] intValue];
            blog.isHeart = [isHeartArr[i] boolValue];
            blog.viewNum = [viewArr[i] intValue];
            blog.isView = [isViewArr[i] boolValue];
            blog.shareNum = [shareArr[i] intValue];
            blog.isShare = [isShareArr[i] boolValue];
            [self.blogArr addObject:blog];
        }

        // 测试数据
        blogContext* blog = [[blogContext alloc] init];
        blog.mainIma = [UIImage imageNamed:@"test.JPG"];
        blog.mainTitle = @"博客标题";
        blog.author = @"作者";
        blog.lanunchTime = @"几分钟前发布";
        blog.tagArray = @[@"标签1",@"标签2",@"标签3"];
        blog.heartNum = 10;
        blog.isHeart = YES;
        blog.viewNum = 20;
        blog.isView = YES;
        blog.shareNum = 40;
        blog.isShare = NO;
    }
    
    // 注册观察者
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getBlog:) name:@"newBlog" object:nil];
    
    
    return self;
}
// 第一个cell
- (NSArray* ) providesImages {
    NSMutableArray* arr = [[NSMutableArray alloc] init];
    for (int i = 0; i < 7; i++) {
        NSString* nameOfPhoto = [[NSString alloc] init];
        if (i < 6) {
            nameOfPhoto = [NSString stringWithFormat:@"scroll%d.JPG",i];
        } else {
            nameOfPhoto = [NSString stringWithFormat:@"scroll%d.PNG",i];
        }
        
        [arr addObject:[UIImage imageNamed:nameOfPhoto]];
    }
    return arr;
}

// 第二个cell
- (UIImage*)providMainIma:(NSIndexPath*)indexPath {
    blogContext* blog = self.blogArr[indexPath.row];
    UIImage* mainIma = blog.mainIma;
    return mainIma;
}

- (NSString*)providMainTitle:(NSIndexPath*)indexPath {
    blogContext* blog = self.blogArr[indexPath.row];
    NSString* mainTitle = blog.mainTitle;
    return mainTitle;
}

- (NSString*)providAuthor:(NSIndexPath*)indexPath {
    blogContext* blog = self.blogArr[indexPath.row];
    NSString* author = blog.author;
    return author;
}

- (NSString*)providLancunchTime:(NSIndexPath*)indexPath {
    blogContext* blog = self.blogArr[indexPath.row];
    NSString* lancunchTime = blog.lanunchTime;
    return lancunchTime;
}

- (NSString*)providBlogTag:(NSIndexPath*)indexPath {
//    NSLog(@"为cell赋值");
    blogContext* blog = self.blogArr[indexPath.row];
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
    blogContext* blog = self.blogArr[indexPath.row];
    return blog.isHeart;
}

- (BOOL)provideIsView:(NSIndexPath*)indexPath {
    blogContext* blog = self.blogArr[indexPath.row];
    return blog.isView;
}

- (BOOL)provideIsShare:(NSIndexPath*)indexPath {
    blogContext* blog = self.blogArr[indexPath.row];
    return blog.isShare;
}

- (NSString*)provideHeartNum:(NSIndexPath*)indexPath {
    blogContext* blog = self.blogArr[indexPath.row];
    NSString* num = [NSString stringWithFormat:@"%ld",(long)blog.heartNum];
    return num;
}
- (NSString*)provideViewNum:(NSIndexPath*)indexPath {
    blogContext* blog = self.blogArr[indexPath.row];
    NSString* num = [NSString stringWithFormat:@"%ld",(long)blog.viewNum];
    return num;
}
- (NSString*)provideShareNum:(NSIndexPath*)indexPath {
    blogContext* blog = self.blogArr[indexPath.row];
    NSString* num = [NSString stringWithFormat:@"%ld",(long)blog.shareNum];
    return num;
}

- (void)saveData:(blogContext*)blog atRow:(NSInteger)row {
    self.blogArr[row] = blog;
}


- (void) getBlog: (NSNotification*) send {
    // 保存传来的blog
    blogContext* newBlog = send.userInfo[@"blog"];
    [self.blogArr insertObject:newBlog atIndex:0];
}

- (void) sendAllBlog {
    // 发送所有博客数据，通知传值传递
    NSLog(@"发送所有博客数据");
    
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    dict[@"blogArr"] = self.blogArr;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"allBlog" object:nil userInfo:dict];
    NSLog(@"发送完毕");
    
}

@end

NS_ASSUME_NONNULL_END
