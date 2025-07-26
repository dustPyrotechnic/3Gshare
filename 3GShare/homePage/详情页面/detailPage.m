//
//  detailPage.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/25.
//

#import "detailPage.h"

@implementation detailPage
- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.mainImg = [[UIImageView alloc] init];
        self.mainTitle = [[UILabel alloc] init];
        self.authorLabel = [[UILabel alloc] init];
        self.launchtime = [[UILabel alloc] init];
        self.heartNum = [[UILabel alloc] init];
        self.viewNum = [[UILabel alloc] init];
        self.shareNum = [[UILabel alloc] init];
        
        self.heartBtn = [[UIButton alloc] init];
        self.viewBtn = [[UIImageView alloc] init];
        self.shareBtn = [[UIButton alloc] init];
        
        self.mainImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"headPhoto.JPG"]];
        
        CGFloat NaviHeight = 57 + 44; // 可根据实际导航栏高度调整
        
        // 顶部栏的高度，图片与周围的空出的间距
        CGFloat mainInfoHeight = 80;
        CGFloat mainPadding = 10;
        CGFloat labelPadding = 5;
        CGFloat launchTimeLabelpadding = 10;
        CGFloat btnPadding = 24;
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;
        
        // 主图片
        self.mainImg.frame = CGRectMake(mainPadding, mainPadding + NaviHeight, mainInfoHeight - 2 * mainPadding, mainInfoHeight - 2 * mainPadding);
        self.mainImg.layer.cornerRadius = 8;
        self.mainImg.clipsToBounds = YES;
        self.mainImg.contentMode = UIViewContentModeScaleAspectFill;
        
        // 标题
        CGFloat titleX = CGRectGetMaxX(self.mainImg.frame) + 10;
        CGFloat titleWidth = width - titleX - launchTimeLabelpadding - 60;
        self.mainTitle.frame = CGRectMake(titleX, mainPadding + NaviHeight, titleWidth, 28);
        self.mainTitle.font = [UIFont boldSystemFontOfSize:18];
        self.mainTitle.textColor = [UIColor blackColor];
        
        // 作者
        self.authorLabel.frame = CGRectMake(titleX, mainPadding + NaviHeight + 32, 100, 20);
        self.authorLabel.font = [UIFont systemFontOfSize:13];
        self.authorLabel.textColor = [UIColor grayColor];
        
        // 发布时间
        self.launchtime.frame = CGRectMake(width - launchTimeLabelpadding - 80, mainPadding + NaviHeight, 80, 20);
        self.launchtime.font = [UIFont systemFontOfSize:12];
        self.launchtime.textColor = [UIColor lightGrayColor];
        self.launchtime.textAlignment = NSTextAlignmentRight;
        
        // 分割线
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(mainPadding, mainPadding + NaviHeight + mainInfoHeight, width - 2 * mainPadding, 1)];
        line.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
        [self addSubview:line];
        
        // 点赞、查看、分享按钮和数字
        CGFloat btnY = mainPadding + NaviHeight + mainInfoHeight + 10;
        CGFloat btnWidth = 28;
        CGFloat btnHeight = 28;
        CGFloat numWidth = 40;
        CGFloat iconGap = 10;
        
        // 点赞按钮
        self.heartBtn.frame = CGRectMake(mainPadding, btnY, btnWidth, btnHeight);
        
        
        
        [self.heartBtn setImage:[UIImage systemImageNamed:@"heart"] forState:UIControlStateNormal];
        
        
//        self.heartBtn.layer.cornerRadius = btnWidth/2;
        self.heartBtn.clipsToBounds = YES;
        
        self.heartNum.frame = CGRectMake(CGRectGetMaxX(self.heartBtn.frame)+2, btnY, numWidth, btnHeight);
        self.heartNum.font = [UIFont systemFontOfSize:14];
        self.heartNum.textAlignment = NSTextAlignmentLeft;
        
        // 查看按钮
        self.viewBtn.frame = CGRectMake(CGRectGetMaxX(self.heartNum.frame)+iconGap, btnY, btnWidth, btnHeight);
        self.viewBtn.image = [UIImage systemImageNamed:@"play.square"];
        self.viewBtn.layer.cornerRadius = btnWidth/2;
        self.viewBtn.clipsToBounds = YES;
        
        self.viewNum.frame = CGRectMake(CGRectGetMaxX(self.viewBtn.frame)+2, btnY, numWidth, btnHeight);
        self.viewNum.font = [UIFont systemFontOfSize:14];
        self.viewNum.textAlignment = NSTextAlignmentLeft;
        
        // 分享按钮
        self.shareBtn.frame = CGRectMake(CGRectGetMaxX(self.viewNum.frame)+iconGap, btnY, btnWidth, btnHeight);
        
        [self.shareBtn setImage:[UIImage systemImageNamed:@"share"] forState:UIControlStateNormal];
        
        self.shareBtn.layer.cornerRadius = btnWidth/2;
        self.shareBtn.clipsToBounds = YES;
        
        self.shareNum.frame = CGRectMake(CGRectGetMaxX(self.shareBtn.frame)+2, btnY, numWidth, btnHeight);
        self.shareNum.font = [UIFont systemFontOfSize:14];
        self.shareNum.textAlignment = NSTextAlignmentLeft;
        
        // TableView
        CGFloat tableY = CGRectGetMaxY(self.heartBtn.frame) + 16;
        self.mainTableview.frame = CGRectMake(0, tableY, width, height - tableY);
        self.mainTableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.mainTableview.backgroundColor = [UIColor colorWithWhite:0.98 alpha:1];
        
        // 背景色
        self.backgroundColor = [UIColor systemBackgroundColor];
        
        
        
        [self addSubview:self.mainImg];
        [self addSubview:self.mainTitle];
        [self addSubview:self.authorLabel];
        [self addSubview:self.launchtime];
        
        [self addSubview:self.heartNum];
        [self addSubview:self.viewNum];
        [self addSubview:self.shareNum];
        
        [self addSubview:self.heartBtn];
        [self addSubview:self.viewBtn];
        [self addSubview:self.shareBtn];
        
        self.mainTableview = [[UITableView alloc] initWithFrame:CGRectMake(10, 230, frame.size.width - 20, frame.size.height) style:UITableViewStyleGrouped];
        self.mainTableview.backgroundColor = [UIColor systemBackgroundColor];
        self.mainTableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:self.mainTableview];
        
        

    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
