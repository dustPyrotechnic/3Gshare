//
//  photoWallCell.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/28.
//

#import "photoWallCell.h"

@implementation photoWallCell
- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] init];
    }
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(0, 0, self.contentView.bounds.size.width, self.contentView.bounds.size.height);
    [self.contentView addSubview:self.imageView];
}
@end
