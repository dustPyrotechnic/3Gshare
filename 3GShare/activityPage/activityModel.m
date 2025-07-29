//
//  activityModel.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/29.
//

#import "activityModel.h"

NS_ASSUME_NONNULL_BEGIN

@implementation activityModel
- (instancetype)init {
    self = [super init];
    if (self) {
        self.imagArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 6; i++) {
            NSString* str = [NSString stringWithFormat:@"act%d.png",i];
            UIImage* image = [UIImage imageNamed:str];
            NSLog(@"%@",image);
            [self.imagArray addObject:image];
        }
        self.strArray = @[@"讨厌的池长老<(￣ヘ￣╬)>",@"师姐带我去了好多会馆，还拆了一个…嘿嘿(*¯ᗜ¯*)ゞ",@"邂逅一段前所未有的故事与奇遇，期待与你一起推开时空之门",@"【不归花火】斩业星熊",@"这里是！会馆！",@"新一期的壁纸来啦"];
        
    }
    return self;
}

- (UIImage*) getImageAt:(NSInteger)row {
//    NSLog(@"%@",self.imagArray[row]);
    return self.imagArray[row];
}

- (NSString*) getTitleAt:(NSInteger)row {
    return self.strArray[row];
}
@end

NS_ASSUME_NONNULL_END
