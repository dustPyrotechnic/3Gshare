//
//  personalCell.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/30.
//

#import "personalCell.h"

@implementation personalCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.iconView = [[UIImageView alloc] init];
        self.titleLabel = [[UILabel alloc] init];
        self.gotoView = [[UIImageView alloc] initWithImage:[UIImage systemImageNamed:@"play.fill"]];
        
        // 添加子视图到contentView
        [self.contentView addSubview:self.iconView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.gotoView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    CGFloat paddingX = 20;
    CGFloat paddingY = 5;
    
    // 图标视图布局
    CGFloat iconSize = 24;
    self.iconView.frame = CGRectMake(paddingX, (height - iconSize) / 2, iconSize, iconSize);
    
    // 标题标签布局
    CGFloat titleX = paddingX + iconSize + 15;
    CGFloat titleWidth = width - titleX - paddingX - 30; // 30是右侧箭头的空间
    self.titleLabel.frame = CGRectMake(titleX, paddingY, titleWidth, height - 2 * paddingY);
    
    // 箭头视图布局
    CGFloat arrowSize = 16;
    self.gotoView.frame = CGRectMake(width - paddingX - arrowSize, (height - arrowSize) / 2, arrowSize, arrowSize);
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
