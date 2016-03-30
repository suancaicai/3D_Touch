//
//  TestTouchViewController.m
//  Touch_3D
//
//  Created by yumingming on 16/3/22.
//  Copyright © 2016年 MM. All rights reserved.
//

#import "TestTouchViewController.h"

#import "WebViewController.h"

@interface TestTouchViewController ()<UIViewControllerPreviewingDelegate,UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property (assign,nonatomic)BOOL isOpen3DTouch;

@end

@implementation TestTouchViewController
/**
 *  首先是检测设备是否支持3D Touch
 *
 *  @param animated
 */
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if(self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable){
        self.isOpen3DTouch = YES;
    }
}
/**
 *  为了防止用户在程序运行过程中修改3D Touch设置
 *
 *  @return
 */
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{

    if(self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable){
        self.isOpen3DTouch = YES;
    }
}


-(void)viewDidLoad{
    [super viewDidLoad];

    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (NSMutableArray *)dataArray{

    NSMutableArray *  dataArray1 = [[NSMutableArray alloc]init];
    int i = 0;
    while (i < 30) {  //模拟数据
        [dataArray1 addObject:@"http://www.baidu.com"];
        i ++;
    }
    return dataArray1;
}


#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self dataArray].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }

    cell.textLabel.text = [NSString stringWithFormat:@"%@",[self dataArray][indexPath.row]];

    /**************************************/
    /**
     *  UIForceTouchCapability 检测是否支持3D Touch
     */
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)
    {
        //支持3D Touch
        //系统  <所有cell> 可实现预览（peek）
        [self registerForPreviewingWithDelegate:self sourceView:cell]; //注册cell
    }
     /**************************************/
    //想在哪实现预览就在哪注册  ［ registerForPreviewingWithDelegate： sourceView：］


    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    WebViewController *webVC = [[WebViewController alloc]init];
    webVC.urlStr =[self dataArray][indexPath.row];  //传数据
    webVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:webVC animated:YES];
}




#pragma mark - UIViewControllerPreviewingDelegate

- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location{

    WebViewController *webVC = [WebViewController new];
    //转化坐标
    location = [self.tableView convertPoint:location fromView:[previewingContext sourceView]];
    //根据locaton获取位置
    NSIndexPath *path = [self.tableView indexPathForRowAtPoint:location];
    //根据位置获取字典数据传传入控制器
    webVC.urlStr =[self dataArray][path.row];

    return webVC;
}



- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{

    viewControllerToCommit.hidesBottomBarWhenPushed = YES;

    [self.navigationController pushViewController:viewControllerToCommit animated:YES];
}

@end
