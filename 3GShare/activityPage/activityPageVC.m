//
//  activityPageVC.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/29.
//

#import "activityPageVC.h"

@interface activityPageVC ()

@end

@implementation activityPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel* titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"活动";
    titleLabel.font = [UIFont systemFontOfSize:24.0];
    titleLabel.textColor = [UIColor blackColor];
    [self.navigationItem setTitleView:titleLabel];
    
    UINavigationBarAppearance* appearance = [UINavigationBarAppearance new];
    appearance.backgroundColor = [UIColor colorWithRed:79 / 255.0 green:141 / 255.0 blue:198 / 255.0 alpha:1.0];
    self.navigationController.navigationBar.standardAppearance = appearance;
    self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    
    // Do any additional setup after loading the view.
    self.model = [[activityModel alloc] init];
    self.actView = [[activityPageView alloc] initWithFrame:self.view.bounds];
    
    self.actView.tableView.delegate = self;
    self.actView.tableView.dataSource = self;
    
    [self.actView.tableView registerClass:[activityCell class] forCellReuseIdentifier:@"activityCell"];
    
    [self.view addSubview:self.actView];
    
}

#pragma mark -UITableViewDelegate,UITableViewDataSourse
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 250;;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    activityCell* cell = [tableView dequeueReusableCellWithIdentifier:@"activityCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[activityCell alloc] init];
    }
    [cell.cellView setImage:[self.model getImageAt:indexPath.row]];
    NSLog(@"%@",cell.cellView.image);
    cell.cellTitle.text = [self.model getTitleAt:indexPath.row];
    return cell;
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
