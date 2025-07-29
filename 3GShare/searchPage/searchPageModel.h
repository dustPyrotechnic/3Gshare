//
//  searchPageModel.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/26.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface searchPageModel : NSObject
/// 按钮状态的总数组
///
/// 其中包括三个数组，分别为各自栏的按钮状态，通过记录btn的按钮值来判断是否按下
@property (nonatomic, strong) NSMutableArray* totalBtn;
/// 第一个栏的按钮，tag值应当在101 - 108之间
@property (nonatomic, strong) NSMutableArray* BtnOfRow1;
/// 第二个栏的按钮
@property (nonatomic, strong) NSMutableArray* BtnOfRow2;
/// 第三个栏的按钮
@property (nonatomic, strong) NSMutableArray* BtnOfRow3;

/// 第一节的按钮题目，有8个元素
@property (nonatomic, strong) NSArray* strOfBtn1;
/// 第二节的按钮题目，4个
@property (nonatomic, strong) NSArray* strOfBtn2;
/// 第三节的按钮题目，4个
@property (nonatomic, strong) NSArray* strOfBtn3;

@property (nonatomic, strong) NSArray* strTotal;


/// 返回一个布尔值，判断该button是否被按下
- (BOOL)isButtonPress:(NSInteger)tag andIndexPath:(NSIndexPath*)indexPath;
/// 保存按下按钮的状态
///
/// 把按钮的tag值存在对应节的数组中，方便之后查询
///
///- Parameters:
/// - tag:按钮的标签值，存储按钮。
///- Throws: 不知道会发生什么
///
///
- (void)saveBtnPress:(NSInteger)tag andIndexPath:(NSIndexPath*)indexPath;
/// 查询方法，返回指定位置的按钮的标题数组
- (NSArray *)getBtnTitleArray:(NSInteger)section;

@end

NS_ASSUME_NONNULL_END
