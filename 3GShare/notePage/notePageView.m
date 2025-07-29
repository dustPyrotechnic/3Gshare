//
//  notePageView.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/29.
//

#import "notePageView.h"


@implementation notePageView
- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat height = frame.size.height;
        CGFloat width = frame.size.width;
        
        CGFloat paddingX = 10;
        CGFloat paddingY = 50;
        
        CGFloat segmentWidth = width - 2 *paddingX;
        CGFloat segmentHeight = 50;
        
        CGFloat tableWidth = width - 2 * paddingX;
        CGFloat tableHeight = 650;
        
        // 初始化数组，准备分段标题
        NSArray *sectionTitle = @[@"精选文章",@"热门推荐",@"全部文章"];
        self.segment = [[HMSegmentedControl alloc] initWithSectionTitles:sectionTitle];
        self.segment.frame = CGRectMake(paddingX,paddingY + 60, segmentWidth, segmentHeight);
        self.segment.selectedSegmentIndex = 0;
        [self.segment addTarget:self action:@selector(changeTableView) forControlEvents:UIControlEventValueChanged];
        
        
        paddingY += segmentHeight + 60;
        
        self.greatTableView = [[UITableView alloc] init];
        self.hotTableView = [[UITableView alloc] init];
        self.allTableView = [[UITableView alloc] init];
        
        self.greatTableView.frame = CGRectMake(paddingX, paddingY, tableWidth, tableHeight);
        self.hotTableView.frame = CGRectMake(paddingX + width, paddingY, tableWidth, tableHeight);
        self.allTableView.frame = CGRectMake(paddingX + width * 2, paddingY, tableWidth, tableHeight);
        
        [self addSubview:self.greatTableView];
        [self addSubview:self.hotTableView];
        [self addSubview:self.allTableView];
        
        [self addSubview:self.segment];
        
        
    }
    return self;
}

- (void) changeTableView {
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width;
    
    CGFloat paddingX = 10;
    CGFloat paddingY = 100 + 60;
    
    CGFloat tableWidth = width - 2 * paddingX;
    CGFloat tableHeight = 650;
    
    if (self.segment.selectedSegmentIndex == 0) {
        [UIView animateWithDuration:0.1 animations:^{
            self.greatTableView.frame = CGRectMake(paddingX, paddingY, tableWidth, tableHeight);
            self.hotTableView.frame = CGRectMake(paddingX + width, paddingY, tableWidth, tableHeight);
            self.allTableView.frame = CGRectMake(paddingX + width * 2, paddingY, tableWidth, tableHeight);
        } completion:nil];
    } else if (self.segment.selectedSegmentIndex == 1) {
        [UIView animateWithDuration:0.1 animations:^{
            self.greatTableView.frame = CGRectMake(paddingX - width, paddingY, tableWidth, tableHeight);
            self.hotTableView.frame = CGRectMake(paddingX, paddingY, tableWidth, tableHeight);
            self.allTableView.frame = CGRectMake(paddingX + width, paddingY, tableWidth, tableHeight);
        }];
    } else if (self.segment.selectedSegmentIndex == 2) {
        [UIView animateWithDuration:0.1 animations:^{
            self.greatTableView.frame = CGRectMake(paddingX - width * 2, paddingY, tableWidth, tableHeight);
            self.hotTableView.frame = CGRectMake(paddingX - width, paddingY, tableWidth, tableHeight);
            self.allTableView.frame = CGRectMake(paddingX, paddingY, tableWidth, tableHeight);
        } completion:nil];
    }
    [self.delegate refreshData];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
