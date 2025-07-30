//
//  messagePageVC.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/30.
//

#import "messagePageVC.h"

@interface messagePageVC ()

@end

@implementation messagePageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    self.model = [[messageModel alloc] init];
    self.messageView = [[messagePage alloc] initWithFrame:self.view.bounds];
    self.messageView.tableView.delegate = self;
    self.messageView.tableView.dataSource = self;
    
    [self.view addSubview:self.messageView];
}

- (void) viewWillAppear:(BOOL)animated {
    [self refreshData];
    [self.messageView.tableView reloadData];
}

- (void) refreshData {
    NSArray* temp = [[NSUserDefaults standardUserDefaults] arrayForKey:@"followCondition"];
    NSInteger yesCount = 0;
    
    for (NSNumber *numberObject in temp) {
        BOOL value = [numberObject boolValue];
        if (value) {
            yesCount++;
        }
    }
    self.model.followNum = yesCount;
}

#pragma mark -UITableView

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"myCell"];
    }
    // 获取数据
    cell.textLabel.text = [self.model getStringAt:indexPath.row];
    cell.detailTextLabel.text = @"7";
    if (indexPath.row == 2) {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld",(long)self.model.followNum];
    }
    if (indexPath.row == 3) {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld",(long)self.model.messageNum];
    }
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 2) {
        newFollowVC* newFollow = [[newFollowVC alloc] init];
        [self.navigationController pushViewController:newFollow animated:YES];
    }
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
