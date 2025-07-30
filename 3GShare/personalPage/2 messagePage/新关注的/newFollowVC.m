//
//  newFollowVC.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/30.
//

#import "newFollowVC.h"

@interface newFollowVC ()

@end

@implementation newFollowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    self.model = [[newFollowModel alloc] init];
    
    self.followView = [[newFollow alloc] initWithFrame:self.view.bounds];
    self.followView.tableView.delegate = self;
    self.followView.tableView.dataSource = self;
    [self.followView.tableView registerClass:[newFollowCell class] forCellReuseIdentifier:@"newFollowCell"];
    [self.view addSubview:self.followView];
}

#pragma mark -UITableView
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 12;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    newFollowCell* cell = [tableView dequeueReusableCellWithIdentifier:@"newFollowCell" forIndexPath:indexPath];
    cell.headPhoto.image = [self.model getPhotoFor:indexPath.row];
    cell.nameLabel.text = [self.model getNameFor:indexPath.row];
    
    cell.isFollow = [self.model getConditionOfButton:indexPath.row];
    
    [cell updateButtonState];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    return cell;
}

- (void)pressBtnAt:(newFollowCell *)cell {
    NSIndexPath* indexPath = [self.followView.tableView indexPathForCell:cell];
    [self.model setCondition:cell.isFollow Of:indexPath.row];
    
//    [self.followView.tableView reloadData];
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
