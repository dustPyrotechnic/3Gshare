//
//  newFollowCell.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class newFollowCell;
@protocol newFollowDelegate <NSObject>

- (void) pressBtnAt:(newFollowCell*)cell;

@end

@interface newFollowCell : UITableViewCell
@property (nonatomic, strong) UIImageView* headPhoto;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UIButton* followBtn;
@property BOOL isFollow;
@property (nonatomic, strong) id<newFollowDelegate> delegate;
- (void)updateButtonState;
@end

NS_ASSUME_NONNULL_END
