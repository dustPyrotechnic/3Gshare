//
//  personalModel.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/29.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "user.h"
#import "blogContext.h"


NS_ASSUME_NONNULL_BEGIN

@interface personalModel : NSObject
/// 当前登录人的用户信息
@property (nonatomic, strong) user* userInfo;

///个人头像
@property (nonatomic, strong) UIImage* personalImage;
///个人昵称
@property (nonatomic, strong) NSString* personalName;
///个人标签
@property (nonatomic, strong) NSString* personalTag;
///个人签名
@property (nonatomic, strong) NSString* personalSaying;
///点赞数
@property (nonatomic) NSInteger heartNum;
///被观看数
@property (nonatomic) NSInteger viewNum;

///我发布的博客数组
@property (nonatomic, strong) NSMutableArray* myBlogArray;
/// 全部的博客
@property (nonatomic, strong) NSMutableArray* blogArray;


@property (nonatomic, strong) NSMutableArray* iconArray;
@property (nonatomic, strong) NSArray* nameArray;
- (void) savemyBlogData:(blogContext*)blog atRow:(NSInteger)row;
- (NSInteger) caculateHeartNum;
- (NSInteger) caculateViewNum;


@end

NS_ASSUME_NONNULL_END
