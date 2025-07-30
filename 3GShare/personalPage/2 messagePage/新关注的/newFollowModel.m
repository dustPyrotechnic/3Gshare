//
//  newFollowModel.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/30.
//

#import "newFollowModel.h"

NS_ASSUME_NONNULL_BEGIN

@implementation newFollowModel
- (instancetype) init {
    self = [super init];
    if (self) {
        self.imaArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 12; i++) {
            NSString* str = [NSString stringWithFormat:@"newfollow%d.PNG",i];
            UIImage* image = [UIImage imageNamed:str];
//            NSLog(@"加载图片%@，名称为%@",str, image);
            [self.imaArray addObject:image];
        }
        self.nameArray = @[@"1", @"幽默静步男",@"无孩爱猫女",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"老板"];
        
        NSArray* temp = [[NSUserDefaults standardUserDefaults] arrayForKey:@"followCondition"];
        if (temp) {
            self.followCondition = [temp mutableCopy];
        } else {
            self.followCondition = [[NSMutableArray alloc] init];
            for (int i = 0; i < 12; i++) {
                [self.followCondition addObject:@(NO)];
            }
            [[NSUserDefaults standardUserDefaults] setObject:self.followCondition forKey:@"followCondition"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
        
//        NSLog(@"数组值为%@",self.followCondition);
        
    }
    return self;
}

- (NSString*) getNameFor:(NSInteger)row {
    return self.nameArray[row];
}

- (UIImage*) getPhotoFor:(NSInteger)row {
    return self.imaArray[row];
}

- (BOOL) getConditionOfButton:(NSInteger)row {
    return [self.followCondition[row] boolValue];
}

- (void) setCondition:(BOOL) condition Of:(NSInteger)row {
    
    self.followCondition[row] = @(condition);
    NSLog(@"保存数组,保存值为%@",self.followCondition);
    [[NSUserDefaults standardUserDefaults] setObject:self.followCondition forKey:@"followCondition"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
}
@end

NS_ASSUME_NONNULL_END
