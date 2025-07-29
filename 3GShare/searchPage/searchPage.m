//
//  searchPage.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/26.
//

#import "searchPage.h"

@implementation searchPage
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.tableView = [[UITableView alloc] initWithFrame:self.bounds];
        self.tableView.backgroundColor = [UIColor systemGray6Color];
        self.tableView.separatorStyle = UITableViewCellAccessoryNone;
        [self addSubview:self.tableView];
    }
    return self;
}

- (void)setDelegate:(id<UITableViewDelegate,UITableViewDataSource>)delegate {
    _delegate = delegate;
    self.tableView.delegate = delegate;
    self.tableView.dataSource = delegate;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
