//
//  detailPageTableViewCell.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/25.
//

#import "detailPageTableViewCell.h"

@implementation detailPageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 初始化子视图
        self.ImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.ImageView];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.ImageView.frame = self.contentView.bounds;
    // 不裁切图片
    self.ImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.ImageView.clipsToBounds = YES;
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
