//
//  textFieldCell.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/27.
//

#import "textFieldCell.h"

@implementation textFieldCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleTextField = [[UITextField alloc] init];
        self.titleTextField.tag = 201;
        
        self.txttextField = [[UITextField alloc] init];
        self.txttextField.tag = 202;
        
        // 设置text Field的样式
        // 边框
        self.titleTextField.layer.borderWidth = 1;
        self.titleTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.titleTextField.borderStyle = UITextBorderStyleRoundedRect;
        self.titleTextField.layer.cornerRadius = 5;
        self.titleTextField.layer.masksToBounds = YES;
        
        self.txttextField.layer.borderWidth = 1;
        self.txttextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.txttextField.borderStyle = UITextBorderStyleRoundedRect;
        self.txttextField.layer.cornerRadius = 5;
        self.txttextField.layer.masksToBounds = YES;

        // 设置text Field的placeholder
        self.titleTextField.placeholder = @"请输入标题";
        self.txttextField.placeholder = @"请输入内容";
        
        // 设置字体
        self.titleTextField.font = [UIFont systemFontOfSize:16];
        self.txttextField.font = [UIFont systemFontOfSize:16];
        
        // 设置delegate
        self.titleTextField.delegate = self;
        self.txttextField.delegate = self;
        
        // 将textField添加到contentView
        [self.contentView addSubview:self.titleTextField];
        [self.contentView addSubview:self.txttextField];
        
        // 初始化上传按钮和小按钮
        self.upLoadBtn = [[UIButton alloc] init];
        self.smallBtn = [[UIButton alloc] init];
        
        // 将按钮添加到contentView
        [self.contentView addSubview:self.upLoadBtn];
        [self.contentView addSubview:self.smallBtn];
        
        // 设置按钮标题
        [self.upLoadBtn setTitle:@"上传" forState:UIControlStateNormal];
    }
    return self;
}

- (void) layoutSubviews {
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width;
    
    CGFloat paddingWidth = 10;
    CGFloat paddingheight = 20;
    
    CGFloat fieldWidth = width - 2 * paddingWidth;
    CGFloat fieldHeight = (height - 4 * paddingheight) / 3.0 - 20;
    
    CGFloat buttonWidth = width - 4 * paddingWidth;
    CGFloat buttonHeight = (height - 4 * paddingheight) / 3.0;
    
    self.titleTextField.frame = CGRectMake(paddingWidth, paddingheight, fieldWidth, fieldHeight);
    self.txttextField.frame = CGRectMake(paddingWidth, paddingheight * 2 + fieldHeight, fieldWidth, fieldHeight + 20);
    
    self.upLoadBtn.frame = CGRectMake(paddingWidth * 2 , paddingheight * 3 + 2 * fieldHeight + 20, buttonWidth, buttonHeight);
    self.upLoadBtn.backgroundColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
    
    // 设置阴影效果
    self.upLoadBtn.layer.shadowOpacity = 0.25;
    self.upLoadBtn.layer.shadowRadius = 3;
    self.upLoadBtn.layer.shadowOffset = CGSizeMake(3, 3);
    
    
    
    
    // 设置smallBtn的frame和样式
    self.smallBtn.frame = CGRectMake(paddingWidth * 2 , paddingheight * 3 + 2 * fieldHeight + 20 + buttonHeight + 10, 20, 20);
    self.smallBtn.layer.borderWidth = 2;
    self.smallBtn.layer.borderColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0].CGColor;
    self.smallBtn.layer.cornerRadius = 6;
    self.smallBtn.backgroundColor = [UIColor clearColor];
    
    [self.smallBtn addTarget:self action:@selector(smallBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UILabel* textLabel = [[UILabel alloc] init];
    textLabel.text = @"禁止转载";
    textLabel.font = [UIFont systemFontOfSize:16];
    textLabel.textColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
    textLabel.frame = CGRectMake(paddingWidth * 2 + 20 + 10, paddingheight * 3 + 2 * fieldHeight + 20 + buttonHeight + 10, 100, 20);
    
//    [self.contentView addSubview:self.smallBtn];
    [self.contentView addSubview:textLabel];
}

-(void)smallBtnPress:(UIButton*) sender {
    if (sender.backgroundColor == [UIColor clearColor]) {
        sender.backgroundColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
    } else {
        sender.backgroundColor = [UIColor clearColor];
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
