//
//  messageModel.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface messageModel : NSObject
@property (nonatomic) NSInteger followNum;
@property (nonatomic) NSInteger messageNum;

@property (nonatomic, strong) NSArray* titleArray;
- (NSString*) getStringAt:(NSInteger)row;
@end

NS_ASSUME_NONNULL_END
