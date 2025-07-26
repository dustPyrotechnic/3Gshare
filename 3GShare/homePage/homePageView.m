//
//  homePageView.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/24.
//

#import "homePageView.h"

@implementation homePageView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor systemBackgroundColor];
        self.mainTableview = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStyleInsetGrouped];
//        self.mainTableview.delegate = self.delegate;
//        self.mainTableview.dataSource = self.delegate;
        [self addSubview:self.mainTableview];
        
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
