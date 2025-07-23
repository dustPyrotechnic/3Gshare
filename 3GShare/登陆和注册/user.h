//
//  user.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface user : NSObject
@property(nonatomic, strong) NSString* email;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* password;


@end

NS_ASSUME_NONNULL_END
