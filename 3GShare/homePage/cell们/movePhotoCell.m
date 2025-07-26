//
//  movePhotoCell.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/24.
//

#import "movePhotoCell.h"

@implementation movePhotoCell
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        self.mainScrollView = [[UIScrollView alloc] init];
        self.mainPageControl = [[UIPageControl alloc] init];
        
        self.mainScrollView.pagingEnabled = YES;
        self.mainScrollView.showsHorizontalScrollIndicator = NO;
        self.mainScrollView.delegate = self;
        
//        for (int i = 0; i < 8; i ++) {
//            UIImage* temp = self.scrollPhoto[i];
//            UIImageView* ImaView = [[UIImageView alloc] initWithImage:temp];
//            ImaView.frame = CGRectMake(0 + frame.size.width * i, 0 + frame.size.height * i, frame.size.width, frame.size.height);
//            [self.mainScrollView addSubview:ImaView];
//        }
        
        self.mainPageControl.numberOfPages = 7;
        
        
        self.mainPageControl.currentPage = 0;
        // 当前页的原点颜色
        self.mainPageControl.currentPageIndicatorTintColor  = [UIColor systemBackgroundColor];
        self.mainPageControl.pageIndicatorTintColor = [UIColor labelColor];
        [self.mainPageControl addTarget:self action:@selector(pageControlDidChange:) forControlEvents:UIControlEventValueChanged];
        
        
        
        [self.contentView addSubview:self.mainScrollView];
        [self.contentView addSubview:self.mainPageControl];
        
        // 美化：添加圆角和柔和阴影
        self.contentView.layer.cornerRadius = 18;
        self.contentView.layer.masksToBounds = NO;
        self.contentView.layer.shadowColor = [UIColor blackColor].CGColor;
        self.contentView.layer.shadowOffset = CGSizeMake(0, 4);
        self.contentView.layer.shadowOpacity = 0.12;
        self.contentView.layer.shadowRadius = 10;
        
        // scrollView圆角
        self.mainScrollView.layer.cornerRadius = 18;
        self.mainScrollView.layer.masksToBounds = YES;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect frame = self.contentView.bounds;
    
    // scrollView紧贴四周
    self.mainScrollView.frame = frame;
    self.mainScrollView.contentSize = CGSizeMake(frame.size.width * 7, frame.size.height);
    
    self.mainPageControl.frame = CGRectMake(0, frame.size.height - 30, frame.size.width, 30);
    
    // 阴影路径优化
    self.contentView.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.contentView.bounds cornerRadius:18].CGPath;
}

/// 根据点击值变化页数
- (void) pageControlDidChange:(UIPageControl*) sender {
    NSInteger currentPage = sender.currentPage;
    CGPoint offset = CGPointMake(currentPage * self.mainScrollView.frame.size.width, 0);
    [self.mainScrollView  setContentOffset:offset animated:YES];
}

#pragma mark -UIScrollViewDelegate

- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger currentPage = (NSInteger)(floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1);
    self.mainPageControl.currentPage = currentPage;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
