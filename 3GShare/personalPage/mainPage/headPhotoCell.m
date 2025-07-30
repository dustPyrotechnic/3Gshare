//
//  headPhotoCell.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/30.
//

#import "headPhotoCell.h"

@implementation headPhotoCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 初始化UI元素
        self.nameLabel = [[UILabel alloc] init];
        self.personalImage = [[UIImageView alloc] init];
        self.tagLabel = [[UILabel alloc] init];
        self.sayingLabel = [[UILabel alloc] init];
        
        self.fkImageView = [[UIImageView alloc] initWithImage:[UIImage systemImageNamed:@"book.pages"]];
        self.heartImageView = [[UIImageView alloc] initWithImage:[UIImage systemImageNamed:@"heart"]];
        self.viewImageView = [[UIImageView alloc] initWithImage:[UIImage systemImageNamed:@"eye"]];
        NSLog(@"阅读标签图像为%@",self.viewImageView.image);
        self.fkLabel = [[UILabel alloc] init];
        self.heartLabel = [[UILabel alloc] init];
        self.viewLabel = [[UILabel alloc] init];
        
        // 设置头像样式
        self.personalImage.layer.cornerRadius = 25;
        self.personalImage.layer.masksToBounds = YES;
        self.personalImage.contentMode = UIViewContentModeScaleAspectFill;
        
        // 设置标签样式
        self.nameLabel.font = [UIFont boldSystemFontOfSize:16];
        self.nameLabel.textColor = [UIColor blackColor];
        
        self.tagLabel.font = [UIFont systemFontOfSize:12];
        self.tagLabel.textColor = [UIColor systemBlueColor];
        self.tagLabel.backgroundColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
        self.tagLabel.textColor = [UIColor whiteColor];
        self.tagLabel.layer.cornerRadius = 8;
        self.tagLabel.layer.masksToBounds = YES;
        self.tagLabel.textAlignment = NSTextAlignmentCenter;
        
        self.sayingLabel.font = [UIFont systemFontOfSize:14];
        self.sayingLabel.textColor = [UIColor darkGrayColor];
        self.sayingLabel.numberOfLines = 2;
        
        // 设置图标样式
        self.fkImageView.tintColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
        self.heartImageView.tintColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
        self.viewImageView.tintColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
        
        // 设置数量标签样式
        self.fkLabel.font = [UIFont systemFontOfSize:12];
        self.fkLabel.textColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
        
        self.heartLabel.font = [UIFont systemFontOfSize:12];
        self.heartLabel.textColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
        
        self.viewLabel.font = [UIFont systemFontOfSize:12];
        self.viewLabel.textColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
        
        // 添加所有元素到视图层级
        [self.contentView addSubview:self.personalImage];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.tagLabel];
        [self.contentView addSubview:self.sayingLabel];
        [self.contentView addSubview:self.fkImageView];
        [self.contentView addSubview:self.heartImageView];
        [self.contentView addSubview:self.viewImageView];
        [self.contentView addSubview:self.fkLabel];
        [self.contentView addSubview:self.heartLabel];
        [self.contentView addSubview:self.viewLabel];
    }
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width;
    
    CGFloat paddingX = 15;
    CGFloat paddingY = 12;
    
    CGFloat avatarSize = 100;
    
    CGFloat iconSize = 16;
    CGFloat spacing = 8;
    
    // 头像布局
    self.personalImage.frame = CGRectMake(paddingX, paddingY, avatarSize, avatarSize);
    
    // 名字标签布局
    CGFloat nameX = paddingX + avatarSize + spacing;
    self.nameLabel.frame = CGRectMake(nameX, paddingY, width - nameX - paddingX, 20);
    
    // 标签布局
    CGFloat tagY = paddingY + 22;
    CGFloat tagWidth = 100;
    self.tagLabel.frame = CGRectMake(nameX, tagY, tagWidth, 16);
    
    // 签名布局
    CGFloat sayingY = tagY + 20;
    CGFloat sayingWidth = width - nameX - paddingX;
    self.sayingLabel.frame = CGRectMake(nameX, sayingY, sayingWidth, 32);
    
    // 底部统计信息布局
    CGFloat statsY = height - paddingY - 20;
    CGFloat statsSpacing = 20;
    
    // 第一个统计项
    CGFloat fkX = nameX;
    self.fkImageView.frame = CGRectMake(fkX, statsY, iconSize, iconSize);
    self.fkLabel.frame = CGRectMake(fkX + iconSize + 4, statsY, 30, iconSize);
    
    // 第二个统计项（爱心）
    CGFloat heartX = fkX + iconSize + 30 + statsSpacing;
    self.heartImageView.frame = CGRectMake(heartX, statsY, iconSize, iconSize);
    self.heartLabel.frame = CGRectMake(heartX + iconSize + 4, statsY, 30, iconSize);
    
    // 第三个统计项（观看）
    CGFloat viewX = heartX + iconSize + 30 + statsSpacing;
    self.viewImageView.frame = CGRectMake(viewX, statsY, iconSize, iconSize);
    self.viewLabel.frame = CGRectMake(viewX + iconSize + 4, statsY, 30, iconSize);
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


