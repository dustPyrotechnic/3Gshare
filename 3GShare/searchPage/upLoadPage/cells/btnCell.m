//
//  btnCell.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/27.
//

#import "btnCell.h"

@implementation btnCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor systemGray6Color];
        // 先创建8个按钮，在layoutSubviews中再根据实际高度调整显示
        for (int i = 0; i < 8; i++) {
            UIButton* btn = [[UIButton alloc] init];
            btn.tag = 101 + i;
            [btn addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
            [self.contentView addSubview:btn];
        }
    }
    return self;
}

- (void)buttonTapped:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(pressBtn:)]) {
        [self.delegate pressBtn:sender];
    }
}

- (void) layoutSubviews {
    [super layoutSubviews];
    
    NSInteger num = 8;
    // 找到cell的宽和高
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width;
    // 找到上下和左右边距
    CGFloat upDownPadding = 20;
    CGFloat boundPadding = 10;
    // 计算按钮的宽和高
    CGFloat buttonWidth = ( width - boundPadding * (4 + 1) )/ 4;
    CGFloat buttonHeight = (height - upDownPadding * 3) / 2;
    
    for (int i = 0; i < num; i++) {
        UIButton* btn = [self.contentView viewWithTag:101 + i];
        
        if (btn) {
            
            NSInteger line = i / 4;
            NSInteger num  = i % 4;
            
            
            btn.frame = CGRectMake(boundPadding + num * (boundPadding + buttonWidth), upDownPadding + (upDownPadding + buttonHeight) * line, buttonWidth, buttonHeight);
            if (i == 4) {
                btn.frame = CGRectMake(boundPadding + num * (boundPadding + buttonWidth), upDownPadding + (upDownPadding + buttonHeight) * line, buttonWidth + 2, buttonHeight);
            }
            // 设置阴影效果
            btn.layer.shadowOpacity = 0.25;
            btn.layer.shadowRadius = 3;
            btn.layer.shadowOffset = CGSizeMake(3, 3);
            
            // 设置半透明效果
//            btn.backgroundColor = [UIColor systemBackgroundColor];
            btn.alpha = 0.5;
        }
        
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
