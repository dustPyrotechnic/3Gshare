//
//  user.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/21.
//

#import "user.h"

@implementation user
-(instancetype)init {
    self = [super init];
    self.email = [[NSString alloc] init];
    self.name = [[NSString alloc] init];
    self.password = [[NSString alloc] init];
    return self;
}
@end
