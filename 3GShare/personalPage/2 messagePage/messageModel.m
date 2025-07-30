//
//  messageModel.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/30.
//

#import "messageModel.h"

NS_ASSUME_NONNULL_BEGIN

@implementation messageModel
- (instancetype) init {
    self = [super init];
    if (self) {
        self.followNum = 0;
        self.messageNum = 0;
        
        self.titleArray = @[@"评论", @"推荐我的", @"新关注的", @"私信", @"活动通知"];
    }
    return self;
}


- (NSString*) getStringAt:(NSInteger)row {
    return self.titleArray[row];
}

@end

NS_ASSUME_NONNULL_END
