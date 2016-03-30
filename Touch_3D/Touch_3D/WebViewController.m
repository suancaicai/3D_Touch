//
//  WebViewController.m
//  BlueTalk
//
//  Created by yumingming on 16/3/22.
//  Copyright © 2016年 YangPeiQiu. All rights reserved.
//

#import "WebViewController.h"
@interface WebViewController ()<UIWebViewDelegate>
@property (nonatomic,strong)UIWebView *webView;
@end
@implementation WebViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    //web页
    self.webView=[[UIWebView alloc] initWithFrame:self.view.bounds];
    self.webView.scalesPageToFit = YES;
    self.webView.delegate=self;
    //控制器view置为webView  - 请求传入的url
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlStr]]];
    [self.view addSubview:self.webView];
}

/**
 *  底部预览界面选项
 */
#pragma mark - 3DTouch Sliding Action

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems
{


    // 生成UIPreviewAction
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"Action 1" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Action 1 selected");
    }];

    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"Action 2" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Action 2 selected");
    }];

    UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"Action 3" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Action 3 selected");
    }];

   NSArray *actions = @[action1, action2, action3];


    /*   style
     typedef NS_ENUM(NSInteger,UIPreviewActionStyle) {
     UIPreviewActionStyleDefault=0,
     UIPreviewActionStyleSelected,//后边有标志
     UIPreviewActionStyleDestructive,//字体为红色
     } NS_ENUM_AVAILABLE_IOS(9_0);
     */




    //可以自己动手体会一下UIPreviewActionGroup与UIPreviewAction的区别
    /*
    UIPreviewActionGroup *group1 = [UIPreviewActionGroup actionGroupWithTitle:@"group1" style:UIPreviewActionStyleDefault actions:@[action1,action2]];
    UIPreviewActionGroup *group2 = [UIPreviewActionGroup actionGroupWithTitle:@"group2" style:UIPreviewActionStyleDestructive actions:@[action1,action3]];
    UIPreviewActionGroup *group3 = [UIPreviewActionGroup actionGroupWithTitle:@"group3" style:UIPreviewActionStyleSelected actions:@[action2,action3]];
    NSArray *actions = @[group1,group2,group3];
     */

    return actions;
}


@end
