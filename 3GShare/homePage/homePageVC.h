//
//  homePageVC.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/24.
//

#import <UIKit/UIKit.h>
#import "movePhotoCell.h"
#import "normalCell.h"

#import "homePageView.h"
#import "homePageModel.h"

#import "detailVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface homePageVC : UIViewController <UITableViewDelegate, UITableViewDataSource, normallCellprotocol>
@property (nonatomic, strong) homePageView* mainView;
@property (nonatomic, strong) homePageModel* homeModel;

@end

NS_ASSUME_NONNULL_END
