//
//  BaymaxVC.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/29.
//

#import <UIKit/UIKit.h>
#import "BaymaxView.h"
#import "BaymaxModel.h"


#import "blogContext.h"
#import "normalCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaymaxVC : UIViewController <UITableViewDelegate, UITableViewDataSource,normallCellprotocol>
@property (nonatomic, strong) BaymaxView* baymaxView;
@property (nonatomic, strong) BaymaxModel* model;
@end

NS_ASSUME_NONNULL_END
