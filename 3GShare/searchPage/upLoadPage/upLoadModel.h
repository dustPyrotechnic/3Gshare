//
//  upLoadModel.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/27.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "blogContext.h"

NS_ASSUME_NONNULL_BEGIN
@protocol modelDelegate <NSObject>


@end

@interface upLoadModel : NSObject

@property (nonatomic, strong)blogContext* selfBlog;

@property (nonatomic, strong)NSMutableArray* btnArray;

// 按钮名称数组
@property (nonatomic, strong) NSArray* strArr;

@property (nonatomic, strong)NSMutableArray* selectedPhoto;

/// 上传页面包括的Blog
/// 发布新的Blog
///
/// 使用通知传值，传值到homePageModel，更新其内部的数组
- (void) upLoadNewBlog;

- (BOOL)isButtonPress:(NSInteger)tag;

- (void)saveBtnPress:(NSInteger)tag;
@end

NS_ASSUME_NONNULL_END
