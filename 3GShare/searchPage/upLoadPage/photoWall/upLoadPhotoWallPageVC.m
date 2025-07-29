//
//  upLoadPhotoWallPageVC.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/27.
//

#import "upLoadPhotoWallPageVC.h"
#import "photoWallCell.h"

@interface upLoadPhotoWallPageVC ()

@end

@implementation upLoadPhotoWallPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
       UIButton *confirmButton = [UIButton buttonWithType:UIButtonTypeSystem];
       [confirmButton setTitle:@"确定" forState:UIControlStateNormal];
       [confirmButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

       confirmButton.titleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
       [confirmButton addTarget:self action:@selector(confirmSelection) forControlEvents:UIControlEventTouchUpInside];
       [confirmButton sizeToFit];
       UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:confirmButton];

       self.navigationItem.rightBarButtonItem = rightItem;
    
    
    
    
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    self.title = @"选择照片";
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.Model = [[upLoadPhotoWallPageModel alloc] init];
    self.upLoadPhotoWall = [[upLoadPhotoWallPage alloc] initWithFrame:self.view.bounds];
    self.upLoadPhotoWall.delegate = self;
    
    self.upLoadPhotoWall.photoWall.delegate = self;
    self.upLoadPhotoWall.photoWall.dataSource = self;
    [self.view addSubview:self.upLoadPhotoWall];
}

#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource
- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 40;
}
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    photoWallCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"photoWallCell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[photoWallCell alloc] init];
    }
    
    UIImage* image = [self.Model getImageAt:indexPath.row];
    NSLog(@"%@",image);
    cell.imageView.image = image;
    // 测试
//    cell.imageView.image = [UIImage imageNamed:@"photoWall0.JPG"];
    cell.backgroundColor = [UIColor systemBackgroundColor];
    
    cell.layer.cornerRadius = 12;
    cell.clipsToBounds = YES;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    photoWallCell* cell = [collectionView cellForItemAtIndexPath:indexPath];
    UIImage* image = cell.imageView.image;
    cell.layer.borderColor = [UIColor systemBlueColor].CGColor;
    if (![self.Model isSelectedPhoto:image]) {
        [self.Model addImageInSelected:image];
        [UIView animateWithDuration:0.15 animations:^{
            cell.layer.borderWidth = 3;
            cell.transform = CGAffineTransformMakeScale(0.95, 0.95);
        } completion:^(BOOL finished){
            [UIView animateWithDuration:0.1 animations:^{
                cell.transform = CGAffineTransformIdentity;
            }];
        }];
    } else {
        [self.Model removeImage:image];
        [UIView animateWithDuration:0.15 animations:^{
            cell.layer.borderWidth = 0;
            cell.transform = CGAffineTransformMakeScale(0.95, 0.95);
        } completion:^(BOOL finished){
            [UIView animateWithDuration:0.1 animations:^{
                cell.transform = CGAffineTransformIdentity;
            }];
        }];
        
    }
}

- (void) confirmSelection {
    NSLog(@"弹出控制器");
    [self.navigationController popViewControllerAnimated:YES];
    // 通知传值，把选中照片的数组传出去
    [[NSNotificationCenter defaultCenter] postNotificationName:@"selectedPhoto" object:self.Model.selectedPhoto];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
