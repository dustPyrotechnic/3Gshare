//
//  upLoadPhotoWallPageModel.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/27.
//

#import "upLoadPhotoWallPageModel.h"

@implementation upLoadPhotoWallPageModel
- (instancetype) init {
    self = [super init];
    if (self) {
        self.selectedPhoto = [[NSMutableArray alloc] init];
        self.allPhoto = [[NSMutableArray alloc] init];
        for (int i = 0; i < 40; i++) {
            NSString* Name = [NSString stringWithFormat:@"photoWall%d.JPG",i];
            UIImage* ima = [UIImage imageNamed:Name];
            [self.allPhoto addObject:ima];
        }
    }
    return self;
}
- (UIImage*)getImageAt:(NSInteger)row {
    return self.allPhoto[row];
}
- (NSMutableArray*) getSelectedPhoto {
    return self.selectedPhoto;
}

- (BOOL) isSelectedPhoto:(UIImage*)image {
    return [self.selectedPhoto containsObject:image];
}

- (void) selectedPhoto:(UIImage*)image {
    [self.selectedPhoto addObject:image];
}

- (void) addImageInSelected:(UIImage*)image {
    [self.selectedPhoto addObject:image];
}

- (void) removeImage:(UIImage*)image {
    [self.selectedPhoto removeObject:image];
}
@end
