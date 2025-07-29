//
//  textFieldCell.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface textFieldCell : UITableViewCell <UITextFieldDelegate>
/// 标题输入框，tag值为201
@property(nonatomic, strong) UITextField* titleTextField;
/// 内容输入框, tag值为202
@property(nonatomic, strong) UITextField* txttextField;

@property(nonatomic, strong) UIButton* upLoadBtn;
@property(nonatomic, strong) UIButton* smallBtn;
@end

NS_ASSUME_NONNULL_END
