//
//  upLoadPageVC.h
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/27.
//

#import <UIKit/UIKit.h>
#import "cellProtocol.h"
// 页面本身相关内容
#import "upLoadPage.h"
#import "upLoadModel.h"

// cell相关内容
#import "btnCell.h"
#import "imaCell.h"
#import "textFieldCell.h"

#import "upLoadPhotoWallPageVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface upLoadPageVC : UIViewController <UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate, cellProtocol,btnCellDelegate>
// 页面本身内容相关
@property upLoadPage* upLoadPageView;
@property upLoadModel* Model;





@property bool isExand;
@end

NS_ASSUME_NONNULL_END
