//
//  activityPageView.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/29.
//

#import "activityPageView.h"

@implementation activityPageView
- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.tableView = [[UITableView alloc] init];
        self.tableView.frame = frame;
        [self addSubview:self.tableView];
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
