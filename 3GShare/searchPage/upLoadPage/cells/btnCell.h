//
//  btnCell.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol btnCellDelegate <NSObject>

- (void) pressBtn:(UIButton*) sender;

@end

@interface btnCell : UITableViewCell
@property (nonatomic, strong) id<btnCellDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
