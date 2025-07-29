//
//  upLoadPhotoWallPage.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/27.
//

#import "upLoadPhotoWallPage.h"
#import "photoWallCell.h"

@implementation upLoadPhotoWallPage
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat screenWidth = frame.size.width;
        CGFloat screenHeight = frame.size.height;
        
        CGFloat margin = 20;
        CGFloat spacing = 15;
        CGFloat buttonSize = (screenWidth - 2 * margin - 2 * spacing) / 3;
        
        
        
        // 创建collectionView
        // 创建layout
        UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(buttonSize, buttonSize);
        layout.minimumLineSpacing = margin;
        layout.minimumInteritemSpacing = margin;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        self.photoWall = [[UICollectionView alloc] initWithFrame:CGRectMake(10, 120, frame.size.width - 20, frame.size.height - 120) collectionViewLayout:layout];
        self.photoWall.backgroundColor = [UIColor systemBackgroundColor];
        
//        self.photoWall.delegate = self.delegate;
//        self.photoWall.dataSource = self.delegate;
        
        [self addSubview:self.photoWall];
        
        [self.photoWall registerClass:[photoWallCell class] forCellWithReuseIdentifier:@"photoWallCell"];
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
