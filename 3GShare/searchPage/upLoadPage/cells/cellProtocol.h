//
//  cellProtocol.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol cellProtocol <NSObject>
-(void)pushPhotoWall:(UIButton*)sender;
- (void)refreshPage;
@end

NS_ASSUME_NONNULL_END
