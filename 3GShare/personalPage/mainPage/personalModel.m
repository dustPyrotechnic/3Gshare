//
//  personalModel.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/29.
//

#import "personalModel.h"

NS_ASSUME_NONNULL_BEGIN

@implementation personalModel
- (instancetype) init {
    self = [super init];
    if (self) {
        // 注册接收者
        self.userInfo = [[user alloc] init];
        self.myBlogArray = [[NSMutableArray alloc] init];
        NSLog(@"准备接收通知");
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getpersonalInfo:) name:@"personalInfo" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addMyblog:) name:@"newBlog" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getAllBlog:) name:@"allBlog" object:nil];
        self.personalImage = [UIImage imageNamed:@"personPhoto1.JPG"];
//        NSLog(@"头像为%@",[UIImage imageNamed:@"personPhoto1.JPG"]);
//        NSLog(@"头像为%@",self.personalImage);
        
        self.personalName = @"游客用户";
        
        self.personalTag = @"数媒/设计爱好者";
        self.personalSaying = @"这个人很懒，他什么都没写";
        
        self.heartNum = [self caculateHeartNum];
        self.viewNum = [self caculateViewNum];
        
        self.iconArray = [[NSMutableArray alloc] init];
        self.nameArray = @[@"我上传的",@"我的信息",@"我推荐的",@"院系通知",@"设置",@"退出"];
        UIImage* image1 = [UIImage systemImageNamed:@"square.and.arrow.up"];
        UIImage* image2 = [UIImage systemImageNamed:@"envelope"];
        UIImage* image3 = [UIImage systemImageNamed:@"heart.text.clipboard"];
        UIImage* image4 = [UIImage systemImageNamed:@"graduationcap"];
        UIImage* image5 = [UIImage systemImageNamed:@"gearshape.fill"];
        UIImage* image6 = [UIImage systemImageNamed:@"person.slash.fill"];
        
        [self.iconArray addObject:image1];
        [self.iconArray addObject:image2];
        [self.iconArray addObject:image3];
        [self.iconArray addObject:image4];
        [self.iconArray addObject:image5];
        [self.iconArray addObject:image6];
        
        
    }
    return self;
}


- (void) savemyBlogData:(blogContext*)blog atRow:(NSInteger)row {
    for (blogContext* comblog in self.blogArray) {
        if ([blog.mainTitle isEqual:comblog] && [blog.text isEqual:comblog.text]) {
            self.blogArray[[self.blogArray indexOfObject:comblog]] = blog;
        }
    }
    self.myBlogArray[row] = blog;
}



#pragma mark - 同步计算内容
- (NSInteger) caculateHeartNum {
    NSInteger heartNum = 0;
    for (blogContext* blog in self.myBlogArray) {
        for (blogContext* comblog in self.blogArray) {
            if ([blog.text isEqual:comblog.text] && [blog.mainTitle isEqual:comblog.mainTitle]) {
                blog.heartNum = comblog.heartNum;
            }
        }
        heartNum += blog.heartNum;
    }
    return heartNum;
}

- (NSInteger) caculateViewNum {
    NSInteger viewNum = 0;
    for (blogContext* blog in self.myBlogArray) {
        for (blogContext* comblog in self.blogArray) {
            if ([blog.text isEqual:comblog.text] && [blog.mainTitle isEqual:comblog.mainTitle]) {
                blog.viewNum = comblog.viewNum;
            }
        }
        viewNum += blog.viewNum;
    }
    return viewNum;
}

#pragma mark -通知传值接收部分
- (void) refreshData {
    self.personalName = self.userInfo.name;
    self.heartNum = [self caculateHeartNum];
    self.viewNum = [self caculateViewNum];
}

- (void) addMyblog:(NSNotification*) send {
//    NSLog(@"接收到新发布的博客，保存数据");
    blogContext* myBlog = send.userInfo[@"blog"];
    self.personalName = myBlog.author;
    [self.myBlogArray addObject:myBlog];
//    NSLog(@"已保存标题为%@的博客",myBlog.mainTitle);
    [self refreshData];
}

- (void) getpersonalInfo:(NSNotification*) send {
//    NSLog(@"准备保存数据");
    self.userInfo = send.userInfo[@"personalInfo"];
    [self refreshData];
}

- (void) getAllBlog:(NSNotification*) send {
    NSLog(@"接收所有的博客");
    self.blogArray = send.userInfo[@"allBlog"];
    NSLog(@"接收完毕，数据为%@",self.blogArray);
}
@end

NS_ASSUME_NONNULL_END
