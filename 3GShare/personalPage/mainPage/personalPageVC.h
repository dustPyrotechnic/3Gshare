//
//  personalPageVC.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/29.
//

#import <UIKit/UIKit.h>
#import "personalCell.h"
#import "headPhotoCell.h"
#import "personalPageView.h"
#import "personalModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface personalPageVC : UIViewController <UITableViewDelegate, UITableViewDataSource, personalPage>
@property (nonatomic, strong) personalPageView* personalView;
@property (nonatomic, strong) personalModel* model;
@end

NS_ASSUME_NONNULL_END
