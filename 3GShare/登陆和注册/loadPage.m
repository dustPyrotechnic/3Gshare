//
//  loadPage.m
//  3GShare
//
//  Created by 红尘一笑 on 2025/7/23.
//

#import "loadPage.h"
#import "WebKit/WebKit.h"

@implementation loadPage
- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;
        
        NSString *gifPath = [[NSBundle mainBundle] pathForResource:@"loadPage" ofType:@"GIF"];
        NSURL* gitURL = [NSURL fileURLWithPath:gifPath];
        
        WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        webView.center = CGPointMake( width / 2, height / 2 - 150);
        
        webView.opaque = NO;
        webView.backgroundColor = [UIColor clearColor];
        webView.scrollView.backgroundColor = [UIColor clearColor];
        
        [webView loadFileURL:gitURL allowingReadAccessToURL:[gitURL URLByDeletingPathExtension]];
        
        [self addSubview:webView];
        
        self.maintitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
        self.maintitle.textAlignment = NSTextAlignmentCenter;
        self.maintitle.center = CGPointMake(width / 2, height / 2 + 100);
        self.maintitle.textColor = [UIColor whiteColor];
        self.maintitle.font = [UIFont systemFontOfSize:20];
        self.maintitle.text = @"欢迎进入Share";
        
        self.smalltitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
        
        self.smalltitle.textAlignment = NSTextAlignmentCenter;
        self.smalltitle.center = CGPointMake(width / 2, height / 2 + 200);
        self.smalltitle.textColor = [UIColor whiteColor];
        self.smalltitle.font = [UIFont systemFontOfSize:15];
        self.smalltitle.text = @"点击任意处继续";
        
        [self addSubview:self.maintitle];
        [self addSubview:self.smalltitle];
        
        // 确保在主线程上延迟启动动画
        dispatch_async(dispatch_get_main_queue(), ^{
            [self startBlinkingAnimation];
        });
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(presentHomePage)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

- (void) presentHomePage {
//    NSLog(@"点击了屏幕，停止闪烁动画");
//    [self stopBlinkingAnimation];
    [self.delegate presentHomePage];
    [self stopBlinkingAnimation];
    [self removeFromSuperview];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

// 添加闪烁动画方法
- (void)startBlinkingAnimation {
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         self.smalltitle.alpha = 0.0;
                     }
                     completion:nil];
}

// 停止闪烁动画的方法（可选）
- (void)stopBlinkingAnimation {
    [self.smalltitle.layer removeAllAnimations];
    self.smalltitle.alpha = 1.0;
}

@end
