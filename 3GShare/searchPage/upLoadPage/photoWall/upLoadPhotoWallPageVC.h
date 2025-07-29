//
//  upLoadPhotoWallPageVC.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/27.
//

#import <UIKit/UIKit.h>
#import "upLoadPhotoWallPage.h"
#import "upLoadPhotoWallPageModel.h"

#import "photoWallProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface upLoadPhotoWallPageVC : UIViewController<photoWallProtocol, UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong)upLoadPhotoWallPage* upLoadPhotoWall;
@property (nonatomic, strong)upLoadPhotoWallPageModel* Model;

@end

NS_ASSUME_NONNULL_END
