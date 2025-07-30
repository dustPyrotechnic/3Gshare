//
//  myUpLoadPage.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/30.
//

#import "myUpLoadPage.h"

@implementation myUpLoadPage
- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.tableView = [[UITableView alloc] initWithFrame:frame];
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
