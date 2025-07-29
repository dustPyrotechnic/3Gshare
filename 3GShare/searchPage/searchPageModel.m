//
//  searchPageModel.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/26.
//

#import "searchPageModel.h"

NS_ASSUME_NONNULL_BEGIN

@implementation searchPageModel

- (instancetype) init {
    self = [super init];
    if (self) {
        self.totalBtn = [[NSMutableArray alloc] init];
        self.BtnOfRow1 = [[NSMutableArray alloc] init];
        self.BtnOfRow2 = [[NSMutableArray alloc] init];
        self.BtnOfRow3 = [[NSMutableArray alloc] init];

        [self.totalBtn addObject:self.BtnOfRow1];
        [self.totalBtn addObject:self.BtnOfRow2];
        [self.totalBtn addObject:self.BtnOfRow3];
        
        
//        // 测试
//        [self.BtnOfRow1 addObject:@(101)];
//        [self.BtnOfRow2 addObject:@(101)];
//        [self.BtnOfRow3 addObject:@(101)];
        
        // 填充第一节的按钮题目（分类）
        self.strOfBtn1 = @[@"平面设计", @"网页设计", @"UI/icon", @"插画/手绘", @"虚拟与设计", @"影视", @"摄影", @"其他"];
        
        // 填充第二节的按钮题目（推荐）
        self.strOfBtn2 = @[@"人气最高", @"收藏最多", @"评论最多", @"编辑精选"];
        
        // 填充第三节的按钮题目（时间）
        self.strOfBtn3 = @[@"30分钟前", @"1小时前", @"1月前", @"1年前"];
        
        // 总数组
        self.strTotal = @[self.strOfBtn1, self.strOfBtn2, self.strOfBtn3];
        
    }
    return self;
}

// 从数据库中获取按钮是否被选中
- (BOOL)isButtonPress:(NSInteger)tag andIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray *btnArray = self.totalBtn[indexPath.section - 1];
    return [btnArray containsObject:@(tag)];
}

// 保存按钮是否被选中
- (void)saveBtnPress:(NSInteger)tag andIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray *btnArray = self.totalBtn[indexPath.section - 1];
    if ([btnArray containsObject:@(tag)]) {
        [btnArray removeObject:@(tag)];
    } else {
        [btnArray addObject:@(tag)];
    }

    // 增加排序
    [btnArray sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
}

// 查询方法，返回指定位置的按钮的标题数组
- (NSArray *)getBtnTitleArray:(NSInteger)section {
    return self.strTotal[section];
}


@end

NS_ASSUME_NONNULL_END
