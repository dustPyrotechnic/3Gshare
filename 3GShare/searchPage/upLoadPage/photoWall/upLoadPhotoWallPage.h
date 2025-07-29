//
//  upLoadPhotoWallPage.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/27.
//

#import <UIKit/UIKit.h>
#import "photoWallProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface upLoadPhotoWallPage : UIView
@property (nonatomic, strong) id<photoWallProtocol, UICollectionViewDelegate, UICollectionViewDataSource> delegate;

@property (nonatomic,strong) UICollectionView* photoWall;

@end

NS_ASSUME_NONNULL_END
 
