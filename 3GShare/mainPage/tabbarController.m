//
//  tabbarController.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/24.
//

#import "tabbarController.h"
#import <CoreHaptics/CoreHaptics.h>


@interface tabbarController ()

@end

@implementation tabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    
    // 设置分栏的内容
    homePageVC* home = [[homePageVC alloc] init];
    UINavigationController* homeNav = [[UINavigationController alloc] initWithRootViewController:home];
    
    searchPageVC* serch = [[searchPageVC alloc] init];
    // 保证上传部分的页面可以首页的页面进行同步，并且在上传之后可以保存
    UINavigationController* serchNav = [[UINavigationController alloc] initWithRootViewController:serch];
    
    notePageVC* note = [[notePageVC alloc] init];
    UINavigationController* noteNav = [[UINavigationController alloc] initWithRootViewController:note];

    activityPageVC* trophy = [[activityPageVC alloc] init];
    UINavigationController* trophyNav = [[UINavigationController alloc] initWithRootViewController:trophy];
    
    personalPageVC* personalFile = [[personalPageVC alloc] init];
    UINavigationController* personalFileNav = [[UINavigationController alloc] initWithRootViewController:personalFile];
    
    UIImageSymbolConfiguration *config = [UIImageSymbolConfiguration configurationWithPointSize:20 weight:UIImageSymbolWeightMedium];
    
    // 设置图标
    UIImage* homeIma = [UIImage systemImageNamed:@"house" withConfiguration:config];
    UIImage* selecterHomeIma = [UIImage systemImageNamed:@"house.fill" withConfiguration:config];

    UIImage* serchIma = [UIImage systemImageNamed:@"magnifyingglass" withConfiguration:config];
    UIImage* selecterSerchIma = [UIImage systemImageNamed:@"sparkle.magnifyingglass" withConfiguration:config];

    UIImage* noteIma = [UIImage systemImageNamed:@"note.text" withConfiguration:config];
    UIImage* selecterNoteIma = [UIImage systemImageNamed:@"note.text.badge.plus" withConfiguration:config];

    UIImage* trophyIma = [UIImage systemImageNamed:@"trophy" withConfiguration:config];
    UIImage* selecterTrophyIma = [UIImage systemImageNamed:@"trophy.fill" withConfiguration:config];

    UIImage* personalFileIma = [UIImage systemImageNamed:@"person" withConfiguration:config];
    UIImage* selecterPersonalFileIma = [UIImage systemImageNamed:@"person.fill" withConfiguration:config];
    
    
    homeNav.tabBarItem.image = homeIma;
    homeNav.tabBarItem.selectedImage = selecterHomeIma;
    homeNav.tabBarItem.title = nil;
    homeNav.tabBarItem.imageInsets = UIEdgeInsetsMake(10, 0, -10, 0);
    
    serchNav.tabBarItem.image = serchIma;
    serchNav.tabBarItem.selectedImage = selecterSerchIma;
    serchNav.tabBarItem.title = nil;
    serchNav.tabBarItem.imageInsets = UIEdgeInsetsMake(10, 0, -10, 0);
    
    noteNav.tabBarItem.image = noteIma;
    noteNav.tabBarItem.selectedImage = selecterNoteIma;
    noteNav.tabBarItem.title = nil;
    noteNav.tabBarItem.imageInsets = UIEdgeInsetsMake(10, 0, -10, 0);
    
    trophyNav.tabBarItem.image = trophyIma;
    trophyNav.tabBarItem.selectedImage = selecterTrophyIma;
    trophyNav.tabBarItem.title = nil;
    trophyNav.tabBarItem.imageInsets = UIEdgeInsetsMake(10, 0, -10, 0);
    
    personalFileNav.tabBarItem.image = personalFileIma  ;
    personalFileNav.tabBarItem.selectedImage = selecterPersonalFileIma;
    personalFileNav.tabBarItem.title = nil;
    personalFileNav.tabBarItem.imageInsets = UIEdgeInsetsMake(10, 0, -10, 0);
    
    self.viewControllers = @[homeNav, serchNav, noteNav, trophyNav, personalFileNav];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshBlog) name:@"refreshBlog" object:nil];

    self.tabBar.backgroundColor = [UIColor clearColor];
    // 设置为透明图片
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(1, 1), NO, 0.0f);
    UIImage *transparentImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.tabBar.shadowImage = transparentImage;
    self.tabBar.barTintColor = [UIColor systemBackgroundColor];
    self.tabBar.layer.borderWidth = 0;
    self.tabBar.tintColor = [UIColor labelColor];

    self.tabBar.translucent = YES;

    // 设置tabbar的背景颜色
    UITabBarAppearance* appearance = [UITabBarAppearance new];
    appearance.backgroundColor = [UIColor blackColor];
    appearance.stackedLayoutAppearance.normal.iconColor = [UIColor systemGray2Color];
    appearance.stackedLayoutAppearance.selected.iconColor = [UIColor whiteColor];
    
    self.tabBar.standardAppearance = appearance;
    self.tabBar.scrollEdgeAppearance = appearance;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
    [generator prepare];
    [generator impactOccurred];
    self.tabBar.backgroundColor = [UIColor systemBackgroundColor];
}

- (void) refreshBlog {
    // 跳转到主页，并刷新数据
    self.selectedIndex = 0;
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
