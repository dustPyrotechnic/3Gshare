//
//  searchPageCell.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol searchCell <NSObject>

- (void) pressBtn:(UIButton*) sender atIndex:(NSIndexPath*)indexPath;

@end



@interface searchPageCell : UITableViewCell
@property (nonatomic, strong) id<searchCell> delagate;
@end

NS_ASSUME_NONNULL_END
