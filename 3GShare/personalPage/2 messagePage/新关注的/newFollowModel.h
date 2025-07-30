//
//  newFollowModel.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/30.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

NS_ASSUME_NONNULL_BEGIN



@interface newFollowModel : NSObject
@property (nonatomic, strong) NSMutableArray* imaArray;
@property (nonatomic, strong) NSArray* nameArray;
@property (nonatomic, strong) NSMutableArray* followCondition;

- (NSString*) getNameFor:(NSInteger)row;
- (UIImage*) getPhotoFor:(NSInteger)row;
- (BOOL) getConditionOfButton:(NSInteger)row;
- (void) setCondition:(BOOL) condition Of:(NSInteger)row;
@end

NS_ASSUME_NONNULL_END
