//
//  newFollowCell.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/30.
//

#import "newFollowCell.h"

@implementation newFollowCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.headPhoto = [[UIImageView alloc] init];
        self.nameLabel = [[UILabel alloc] init];
        self.followBtn = [[UIButton alloc] init];
        
        [self.contentView addSubview:self.headPhoto];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.followBtn];
    }
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    CGFloat paddingX = 10;
    CGFloat paddingY = 10;
    
    CGFloat photoWidth = 50;
    CGFloat photoHeight = 50;
    
    // 头像布局
    self.headPhoto.frame = CGRectMake(paddingX, paddingY, photoWidth, photoHeight);
    self.headPhoto.layer.cornerRadius = photoWidth / 2;
    self.headPhoto.layer.masksToBounds = YES;
    
    // 名字标签布局
    CGFloat nameLabelX = paddingX + photoWidth + paddingX;
    CGFloat nameLabelY = paddingY;
    CGFloat nameLabelWidth = 150;
    CGFloat nameLabelHeight = 30;
    self.nameLabel.frame = CGRectMake(nameLabelX, nameLabelY, nameLabelWidth, nameLabelHeight);
    
    // 关注按钮布局
    CGFloat followBtnWidth = 80;
    CGFloat followBtnHeight = 35;
    CGFloat followBtnX = width - paddingX - followBtnWidth;
    CGFloat followBtnY = (height - followBtnHeight) / 2;
    self.followBtn.frame = CGRectMake(followBtnX, followBtnY, followBtnWidth, followBtnHeight);
    
    // 设置按钮样式
    self.followBtn.layer.cornerRadius = 5;
    [self.followBtn setTitle:@"follow" forState:UIControlStateNormal];
    
//    [self.followBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.followBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [self.followBtn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void) pressBtn:(UIButton*)sender {
    // 先更换当前状态
    self.isFollow = !self.isFollow;
    // 再保存当前状态
    
    if (self.isFollow) {
        [UIView animateWithDuration:0.1 animations:^{
            sender.layer.borderColor = [UIColor blackColor].CGColor;
            sender.layer.borderWidth = 2;
            
            sender.transform = CGAffineTransformMakeScale(0.95, 0.95);
            
            [sender setBackgroundColor:[UIColor whiteColor]];
            [sender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
        } completion:^(BOOL finished){
//            sender.layer.borderWidth = 0;
            
            [UIView animateWithDuration:0.1 animations:^{
                sender.transform = CGAffineTransformIdentity;
            }];
        }];
    } else {
        [UIView animateWithDuration:0.1 animations:^{
            sender.layer.borderWidth = 0;
            sender.transform = CGAffineTransformMakeScale(0.95, 0.95);
            
            [sender setBackgroundColor:[UIColor blackColor]];
            [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        } completion:^(BOOL finished){
            
            [UIView animateWithDuration:0.1 animations:^{
                sender.transform = CGAffineTransformIdentity;
            }];
            
        }];
    }
    [self.delegate pressBtnAt:self];
}

- (void)updateButtonState {
    if (self.isFollow) {
        [self.followBtn setBackgroundColor:[UIColor whiteColor]];
        self.followBtn.layer.borderColor = [UIColor blackColor].CGColor;
        self.followBtn.layer.borderWidth = 2;
        [self.followBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    } else {
        self.followBtn.layer.borderWidth = 0;
        [self.followBtn setBackgroundColor:[UIColor blackColor]];
        [self.followBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
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
