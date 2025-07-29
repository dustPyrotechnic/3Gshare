//
//  upLoadPhotoWallPageModel.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/27.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface upLoadPhotoWallPageModel : NSObject

///选中照片的数组
@property (nonatomic, strong) NSMutableArray* selectedPhoto;
///所有的照片
@property (nonatomic, strong) NSMutableArray* allPhoto;
///获取目前选中的图片
- (NSMutableArray*) getSelectedPhoto;
///查看照片是否选中
- (BOOL) isSelectedPhoto:(UIImage*)image;
/// 获取指定路径的照片
- (UIImage*)getImageAt:(NSInteger)row;
/// 加入照片到选中里
- (void) addImageInSelected:(UIImage*)image;
- (void) removeImage:(UIImage*)image;
@end

NS_ASSUME_NONNULL_END
