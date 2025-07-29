//
//  activityModel.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/29.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface activityModel : NSObject
@property (nonatomic, strong) NSMutableArray* imagArray;
@property (nonatomic, strong) NSArray* strArray;


- (UIImage*)getImageAt:(NSInteger)row;
- (NSString*)getTitleAt:(NSInteger)row;

@end

NS_ASSUME_NONNULL_END
