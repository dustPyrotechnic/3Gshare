//
//  upLoadPage.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/27.
//

#import "upLoadPage.h"

@implementation upLoadPage
- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.mainTableView = [[UITableView alloc] init];
        self.mainTableView.tag = 101;
        self.mainTableView.frame = self.bounds;
        self.mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:self.mainTableView];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
