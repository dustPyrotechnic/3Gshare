//
//  normalCell.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/24.
//

#import "normalCell.h"
#import <CoreHaptics/CoreHaptics.h>

@implementation normalCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       self.mainImg = [[UIImageView alloc] init];
       self.mainImg.contentMode = UIViewContentModeScaleAspectFill;
       self.mainImg.clipsToBounds = YES;
       self.mainImg.layer.cornerRadius = 10;
       self.mainImg.layer.masksToBounds = YES;
       self.mainImg.layer.borderWidth = 0;
       [self.contentView addSubview:self.mainImg];

       self.mainTitle = [[UILabel alloc] init];
       self.mainTitle.font = [UIFont boldSystemFontOfSize:16];
       self.mainTitle.textColor = [UIColor labelColor];
       [self.contentView addSubview:self.mainTitle];

       self.authorLabel = [[UILabel alloc] init];
       self.authorLabel.font = [UIFont systemFontOfSize:12];
       self.authorLabel.textColor = [UIColor secondaryLabelColor];
       [self.contentView addSubview:self.authorLabel];

       self.lancunchTime = [[UILabel alloc] init];
       self.lancunchTime.font = [UIFont systemFontOfSize:12];
       self.lancunchTime.textColor = [UIColor secondaryLabelColor];
       [self.contentView addSubview:self.lancunchTime];

       self.blogTag = [[UILabel alloc] init];
       self.blogTag.lineBreakMode = NSLineBreakByTruncatingTail;
       self.blogTag.numberOfLines = 0;
       self.blogTag.font = [UIFont systemFontOfSize:12];
       self.blogTag.textColor = [UIColor secondaryLabelColor];
       self.blogTag.backgroundColor = [[UIColor systemBlueColor] colorWithAlphaComponent:0.08];
       self.blogTag.layer.cornerRadius = 6;
       self.blogTag.layer.masksToBounds = YES;
       self.blogTag.textAlignment = NSTextAlignmentCenter;
       [self.contentView addSubview:self.blogTag];

       self.heartNum = [[UILabel alloc] init];
       self.heartNum.font = [UIFont systemFontOfSize:12];
       self.heartNum.textColor = [UIColor secondaryLabelColor];
       self.heartNum.textAlignment = NSTextAlignmentLeft;
       [self.contentView addSubview:self.heartNum];
        
        self.viewNum = [[UILabel alloc] init];
        self.viewNum.font = [UIFont systemFontOfSize:12];
        self.viewNum.textColor = [UIColor secondaryLabelColor];
        self.viewNum.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:self.viewNum];
        
        self.shareNum = [[UILabel alloc] init];
        self.shareNum.font = [UIFont systemFontOfSize:12];
        self.shareNum.textColor = [UIColor secondaryLabelColor];
        self.shareNum.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:self.shareNum];
        
        self.isHeart = NO;
        self.isView = NO;
        self.isShare = NO;
        
        self.heartBtn = [[UIButton alloc] init];
        [self.heartBtn setImage:[UIImage systemImageNamed:@"heart"] forState:UIControlStateNormal];
        self.heartBtn.tintColor = [UIColor systemGray4Color];
        self.heartBtn.layer.cornerRadius = 10;
        self.heartBtn.layer.masksToBounds = YES;
        [self.heartBtn addTarget:self action:@selector(heartBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.heartBtn];
        
        self.viewBtn = [[UIImageView alloc] init];
        self.viewBtn.image = [UIImage systemImageNamed:@"play.square"];
        self.viewBtn.tintColor = [UIColor systemGray4Color];
        self.viewBtn.layer.cornerRadius = 10;
        self.viewBtn.layer.masksToBounds = YES;
        [self.contentView addSubview:self.viewBtn];

        self.shareBtn = [[UIButton alloc] init];
        [self.shareBtn setImage:[UIImage systemImageNamed:@"square.and.arrow.up"] forState:UIControlStateNormal];
        self.shareBtn.tintColor = [UIColor systemGray4Color];
        self.shareBtn.layer.cornerRadius = 10;
        self.shareBtn.layer.masksToBounds = YES;
        [self.shareBtn addTarget:self action:@selector(shareBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.shareBtn];

        // cell整体圆角和阴影
        self.contentView.layer.cornerRadius = 12;
        self.contentView.layer.masksToBounds = YES;
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOpacity = 0.08;
        self.layer.shadowOffset = CGSizeMake(0, 2);
        self.layer.shadowRadius = 6;
        self.layer.masksToBounds = NO;
    }
    return self;
}

- (void) heartBtnClick {
    // 提取出数字
    int heartNumb = [self.heartNum.text intValue];
    if (!self.isHeart) {
        heartNumb++;
        UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
        [generator prepare];
        [generator impactOccurred];
        
        [UIView animateWithDuration:0.2 animations:^{
            self.heartBtn.tintColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
            self.heartBtn.transform = CGAffineTransformMakeScale(0.9, 0.9);
            [self.heartBtn setImage:[UIImage systemImageNamed:@"heart.fill"] forState:UIControlStateNormal];
        } completion:^(BOOL finished) {
            if (finished) {
                [UIView animateWithDuration:0.1 animations:^{
                    self.heartBtn.transform = CGAffineTransformIdentity;
                }];
            }
            
        }];
    } else {
        heartNumb--;
        [UIView animateWithDuration:0.1 animations:^{
            [self.heartBtn setImage:[UIImage systemImageNamed:@"heart"] forState:UIControlStateNormal];
            self.heartBtn.tintColor = [UIColor systemGray4Color];
        }];
    }
    
    self.heartNum.text = [NSString stringWithFormat:@"%d",heartNumb];
    self.isHeart = !self.isHeart;
    [self.delegate refreshData:self];
    
}

- (void) shareBtnClick {
    // 提取出数字
    int shareNumb = [self.shareNum.text intValue];
    if (!self.isShare) {
        shareNumb++;
        UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
        [generator prepare];
        [generator impactOccurred];
        [UIView animateWithDuration:0.2 animations:^{
            [self.shareBtn setImage:[UIImage systemImageNamed:@"square.and.arrow.up.fill"] forState:UIControlStateNormal];
            self.shareBtn.tintColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
            self.shareBtn.transform = CGAffineTransformMakeScale(0.9, 0.9);
        } completion:^(BOOL finished) {
            if (finished) {
                [UIView animateWithDuration:0.1 animations:^{
                    self.shareBtn.transform = CGAffineTransformIdentity;
                }];
            }
        }];
    } else {
        shareNumb--;
        [UIView animateWithDuration:0.1 animations:^{
            [self.shareBtn setImage:[UIImage systemImageNamed:@"square.and.arrow.up"] forState:UIControlStateNormal];
            self.shareBtn.tintColor = [UIColor systemGray4Color];
        }];
    }
    self.shareNum.text = [NSString stringWithFormat:@"%d",shareNumb];
    self.isShare = !self.isShare;
    [self.delegate refreshData:self];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = self.contentView.frame.size.width;
    CGFloat height = self.contentView.frame.size.height;
    
    CGFloat PosX = width - 100 - 60;
    
    self.mainImg.frame = CGRectMake(5, 5, width / 2  - 10, height - 10);
    self.mainImg.layer.cornerRadius = 10;
    self.mainTitle.frame = CGRectMake(PosX, 10, 200, 20);
    self.authorLabel.frame = CGRectMake(PosX, 30, 100, 20);
    self.lancunchTime.frame = CGRectMake(PosX, 50, 100, 20);
    self.blogTag.frame = CGRectMake(PosX, 70, 140, 40);
    // 分割线
//    UIView *line = [self.contentView viewWithTag:999];
//    if (!line) {
//        line = [[UIView alloc] initWithFrame:CGRectMake(10, height-1, width-20, 1)];
//        line.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
//        line.tag = 999;
//        [self.contentView addSubview:line];
//    } else {
//        line.frame = CGRectMake(10, height-1, width-20, 1);
//    }
    // 喜欢、查看、分享按钮和数字的布局
    CGFloat btnWidth = 24;
    CGFloat btnHeight = 24;
    
    CGFloat labelWidth = 30;
    CGFloat labelHeight = 20;
    
    CGFloat spacing = 5;
    CGFloat bottomMargin = 12;
    CGFloat rightStart = PosX - 25; // 与主标题对齐

    // 喜欢按钮
    self.heartBtn.frame = CGRectMake(rightStart, height - btnHeight - bottomMargin, btnWidth, btnHeight);
    // 喜欢数字
    self.heartNum.frame = CGRectMake(CGRectGetMaxX(self.heartBtn.frame) + 2, height - labelHeight - bottomMargin - 2, labelWidth, labelHeight);

    // 查看按钮（用imageView）
    self.viewBtn.frame = CGRectMake(CGRectGetMaxX(self.heartNum.frame) + spacing, height - btnHeight - bottomMargin + 2.5, btnWidth, btnHeight - 5);
    // 查看数字
    self.viewNum.frame = CGRectMake(CGRectGetMaxX(self.viewBtn.frame) + 2, height - labelHeight - bottomMargin - 2, labelWidth, labelHeight);

    // 分享按钮
    self.shareBtn.frame = CGRectMake(CGRectGetMaxX(self.viewNum.frame) + spacing, height - btnHeight - bottomMargin - 2.5, btnWidth, btnHeight);
    // 分享数字
    self.shareNum.frame = CGRectMake(CGRectGetMaxX(self.shareBtn.frame) + 2, height - labelHeight - bottomMargin - 2, labelWidth, labelHeight);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.contentView.backgroundColor = [UIColor clearColor];
}

@end
