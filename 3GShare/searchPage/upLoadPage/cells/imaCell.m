//
//  imaCell.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/27.
//

#import "imaCell.h"

@implementation imaCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imaBtn = [[UIButton alloc] init];
        self.foldTableView = [[UITableView alloc] init];

        
        // 设置按钮标题
        [self.imaBtn setTitle:@"选择图片" forState:UIControlStateNormal];
        [self.imaBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.imaBtn.backgroundColor = [UIColor systemGray5Color];
        [self.imaBtn addTarget:self.delegate action:@selector(pushPhotoWall:) forControlEvents:UIControlEventTouchUpInside];
        self.placeLabel = [[UILabel alloc] init];
        self.placeLabel.text = @"陕西省，西安市";
        self.placeLabel.font = [UIFont systemFontOfSize:12];
        self.placeLabel.textColor = [UIColor systemGrayColor];
        
        self.imaView = [[UIImageView alloc] initWithImage:[UIImage systemImageNamed:@"signpost.right.and.left"]];
        
#pragma mark -折叠cell的部分内容
        // 设置foldTableView的代理
        self.foldTableView.delegate = self;
        self.foldTableView.dataSource = self;
        self.foldTableView.backgroundColor = [UIColor systemBackgroundColor];
        self.foldTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.foldTableView.layer.cornerRadius = 5;
        self.foldTableView.layer.masksToBounds = YES;
        self.foldTableView.layer.borderWidth = 1;
        self.foldTableView.layer.borderColor = [UIColor systemGray4Color].CGColor;
        
        self.isExpand = NO;
        self.foldTableView.hidden = YES;
        
        self.tagButton = [[UIButton alloc] init];
        [self.tagButton setTitle:self.strtag forState:UIControlStateNormal];
        
        self.imaButton = [[UIButton alloc] init];
        
        if (!self.isExpand) {
            [self.imaButton setImage:[UIImage systemImageNamed:@"arrowtriangle.down.fill"] forState:UIControlStateNormal];
        } else {
            [self.imaButton setImage:[UIImage systemImageNamed:@"arrowtriangle.up.fill"] forState:UIControlStateNormal];
        }
        
        
        [self.imaButton addTarget:self action:@selector(pressBtn) forControlEvents:UIControlEventTouchUpInside];
        [self.tagButton addTarget:self action:@selector(pressBtn) forControlEvents:UIControlEventTouchUpInside];
        self.strtag = @"原创作品";
        
        [self.tagButton setTitle:self.strtag forState:UIControlStateNormal];
        [self.tagButton setTitleColor:[UIColor labelColor] forState:UIControlStateNormal];
        
        self.tagArray = @[@"原创作品",@"设计资料",@"设计观点", @"设计教程"];
        
        
        // 将视图添加到contentView
        [self.contentView addSubview:self.imaBtn];
        [self.contentView addSubview:self.placeLabel];
        [self.contentView addSubview:self.imaView];

        [self.contentView addSubview:self.foldTableView];
        [self.contentView addSubview:self.tagButton];
        [self.contentView addSubview:self.imaButton];
    }
    return self;
}

-(void) layoutSubviews {
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width;
    
    CGFloat startPaddingX = 10;
    CGFloat startPaddingY = 10;
    
//    CGFloat paddingButton = 30;
    
    CGFloat imaheight = height - 2 * startPaddingY;
    CGFloat imawidth = width * 2 / 3 - 2 * startPaddingX;
    
    CGFloat middlepadding = 0;
    CGFloat paddingY = 20;
//    CGFloat kidWidth = (width / 3) - middlepadding * 2;
//    CGFloat kitHeight = (height - 3 * paddingY) / 2;
    
    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
        self.imaBtn.frame = CGRectMake(startPaddingX, startPaddingY, imawidth, imaheight);
        
        self.imaView.frame = CGRectMake(startPaddingX * 2 + imawidth, 28, 30, 30);
        self.placeLabel.frame = CGRectMake(startPaddingX * 2 + imawidth + 30, 20, 119, 50);
        self.placeLabel.font = [UIFont systemFontOfSize:14];
        
        self.tagButton.frame = CGRectMake(startPaddingX * 2 + imawidth, 60, 80, 30);
        self.imaButton.frame = CGRectMake(startPaddingX * 2 + imawidth + 70, 60, 30, 30);
        self.foldTableView.frame = CGRectMake(startPaddingX * 2 + imawidth, 90, 100, 160);
//    });
//    self.imaBtn.frame = CGRectMake(startPaddingX, startPaddingY, imawidth, imaheight);
//    
//    self.imaView.frame = CGRectMake(startPaddingX * 2 + imawidth, 28, 30, 30);
//    self.placeLabel.frame = CGRectMake(startPaddingX * 2 + imawidth + 30, 20, 119, 50);
//    self.placeLabel.font = [UIFont systemFontOfSize:14];
//    
//    self.tagButton.frame = CGRectMake(startPaddingX * 2 + imawidth, 60, 80, 30);
//    self.imaButton.frame = CGRectMake(startPaddingX * 2 + imawidth + 70, 60, 30, 30);
//    self.foldTableView.frame = CGRectMake(startPaddingX * 2 + imawidth, 90, 100, 160);
    
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// 折叠cell的方法
- (void) pressBtn {
    if (!self.isExpand) {
        [self.imaButton setImage:[UIImage systemImageNamed:@"arrowtriangle.up.fill"] forState:UIControlStateNormal];
    } else {
        [self.imaButton setImage:[UIImage systemImageNamed:@"arrowtriangle.down.fill"] forState:UIControlStateNormal];
    }
    self.isExpand = !self.isExpand;
    self.foldTableView.hidden = !self.foldTableView.hidden;
    [self.foldTableView reloadData];
    
    [self.delegate refreshPage];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    NSInteger count = self.isExpanded ? self.categoryArray.count : 0;
//    return count;
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"foldCell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"foldCell"];
        cell.backgroundColor = [UIColor systemBackgroundColor];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.textColor = [UIColor labelColor];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        cell.layer.cornerRadius = 3;
        cell.layer.masksToBounds = YES;
    }
    cell.text = self.tagArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.strtag = self.tagArray[indexPath.row];
    [self.tagButton setTitle:self.strtag forState:UIControlStateNormal];
    
}

@end
