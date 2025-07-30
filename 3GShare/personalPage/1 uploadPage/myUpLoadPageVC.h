//
//  myUpLoadPageVC.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/30.
//

#import <UIKit/UIKit.h>
#import "myUpLoadPage.h"
#import "personalModel.h"
#import "normalCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface myUpLoadPageVC : UIViewController <UITableViewDelegate, UITableViewDataSource,normallCellprotocol>
@property (nonatomic, strong) personalModel* model;
@property (nonatomic, strong) myUpLoadPage* myView;
@end

NS_ASSUME_NONNULL_END
