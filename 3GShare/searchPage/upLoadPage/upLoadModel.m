//
//  upLoadModel.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/27.
//

#import "upLoadModel.h"


@implementation upLoadModel

- (instancetype) init {
    self = [super init];
    if (self) {
        self.selfBlog = [[blogContext alloc] init];
        NSString* name = [[NSUserDefaults standardUserDefaults] stringForKey:@"userName"];
        if (name) {
            name = @"游客用户";
        }
        self.selfBlog.author = name;
        self.selfBlog.lanunchTime = @"几分钟前发布";
        self.btnArray = [[NSMutableArray alloc] init];
        self.strArr = @[@"平面设计", @"网页设计", @"UI/icon", @"插画/手绘", @"虚拟设计", @"影视", @"摄影", @"其他"];

        self.selectedPhoto = [[NSMutableArray alloc] init];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(selectedPhoto:) name:@"selectedPhoto" object:nil];
        
    }
    return self;
}

- (void) selectedPhoto:(NSNotification*)notification {
    self.selectedPhoto = notification.object;
}

- (void) upLoadNewBlog {
    // 整理数据发布
    // 整理图片
    NSLog(@"整理图片");
    self.selfBlog.mainIma = self.selectedPhoto[0];
    [self.selectedPhoto removeObject:self.selectedPhoto[0]];
    self.selfBlog.imaArray = self.selectedPhoto;
    
    // 整理标签部分的内容
    // 整理按钮部分的标签
    NSLog(@"整理按钮部分的标签");
    for (int i = 0; i < 8; i++) {
        if ([self.btnArray containsObject:@(i + 100)]) {
            [self.selfBlog.tagArray addObject:self.strArr[i]] ;
        }
    }
    NSLog(@"通知传值");
    NSDictionary* info = [NSDictionary dictionaryWithObject:self.selfBlog forKey:@"blog"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"newBlog" object:nil userInfo:info];

    // 告诉控制器，发布成功，pop掉现在的页面，实现刷新数据
}

- (BOOL)isButtonPress:(NSInteger)tag {
    NSMutableArray *btnArray = self.btnArray;
//    NSLog(@"返回值为%@",[btnArray containsObject:@(tag)]);
    return [btnArray containsObject:@(tag)];
}

- (void) saveBtnPress:(NSInteger)tag {
    if ([self isButtonPress:tag]){
        NSLog(@"已移除按钮");
        [self.btnArray removeObject:@(tag)];
    } else {
        NSLog(@"已加入按钮");
        [self.btnArray addObject:@(tag)];
    }
    
}


@end
