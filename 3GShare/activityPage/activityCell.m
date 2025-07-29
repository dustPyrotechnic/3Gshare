//
//  activityCell.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/29.
//

#import "activityCell.h"

@implementation activityCell
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.cellView = [[UIImageView alloc] init];
        self.cellView.layer.cornerRadius = 10;
        self.cellView.clipsToBounds = YES;
        self.cellTitle = [[UILabel alloc] init];
        self.cellTitle.textColor = [UIColor labelColor];
        
        [self.contentView addSubview:self.cellView];
        [self.contentView addSubview:self.cellTitle];
        
        
    }
    return self;
}

- (void) layoutSubviews {
    CGFloat width = self.contentView.frame.size.width;
    CGFloat height = self.contentView.frame.size.height;
    
    CGFloat paddingX = 10;
    CGFloat paddingY = 10;;
    
    self.cellView.frame = CGRectMake(paddingX, paddingY, width - 2 * paddingX, (height - 3 * paddingY) / 4 * 3);
    
    self.cellTitle.frame = CGRectMake(paddingX, self.cellView.frame.size.height + 2 * paddingY, width - 2 * paddingX, (height - 3 * paddingY) / 4 * 1);
    
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
