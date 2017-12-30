//
//  HGViewController.m
//  HGTabView
//
//  Created by  ZhuHong on 16/3/26.
//  Copyright © 2016年 HG. All rights reserved.
//

#import "HGViewController.h"
#import "HGMainView.h"
#import "HGTabMode.h"
#import "HGSelectView.h"

#pragma mark - 用于例子展示
#import "HGWebView.h"
#import "HGTableTableViewController.h"

@interface HGViewController () <HGMainViewDelegate, HGTableTableViewControllerDelegate, HGSelectViewDelegate>

@property (nonatomic, weak) HGMainView* tabView;
@property (nonatomic, strong) NSMutableArray* contentArrM;

@end

@implementation HGViewController

// 懒加载
- (NSMutableArray *)contentArrM {
    if (!_contentArrM) {
        _contentArrM = [NSMutableArray array];
        
        NSArray* arr = @[@"UILabel实例", @"自定义的视图实例", @"自定义的控制器实例"];
        for (NSInteger i=0; i<arr.count; i++) {
            NSString* value = arr[i];
            HGTabMode* mode = [[HGTabMode alloc] init];
            mode.contentStr = value;
            [_contentArrM addObject:mode];
        }
    }
    return _contentArrM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"联动效果";
    
    HGMainView* tabView = [HGMainView mainView];
    tabView.delegate = self;
    tabView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tabView];
    self.tabView = tabView;
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

#pragma mark - HGMainViewDelegate
// 这个代理方法类似于UITableView的(sectionIndexTitlesForTableView:)代理方法
- (NSArray *)tabMainView:(HGMainView *)view {
    return self.contentArrM;
}

// 这个代理方法类似于UITableView的(tableView:cellForRowAtIndexPath:)代理方法
- (HGContentMode*)mainView:(HGMainView *)view viewForPage:(NSInteger)page {
    if (page == 0) {
        return [self labelForPage:page];
    } else if (page == 1) {
        return [self webViewForPage:page];
    }
    return [self tableTableViewControllerForPage:page];
}

// 这个代理方法的功能是:返回自定义的选择弹框.
- (UIView *)showViewMainView:(HGMainView *)mainView {
    HGSelectView* view = [HGSelectView selectView];
    view.delegate = self;
    view.items = @[@"不用", @"太在", @"意这里", @"的样式", @"真正", @"的开发", @"中是", @"需要", @"看需", @"求的"];
    return view;
}

#pragma mark - HGSelectViewDelegate
- (void)selectView:(HGSelectView *)view didSelectItem:(NSString *)item {
    UIView* selectView = view.superview;
    // selectView就是选择弹框的有阴影的背景视图
    // 所以.....你懂的
    [selectView removeFromSuperview];
    NSLog(@"你点击了: %@", item);
}

#pragma mark - HGTableTableViewController
- (HGContentMode*)tableTableViewControllerForPage:(NSInteger)page {
    HGContentMode* mode = [[HGContentMode alloc] init];
    mode.hgCls = HGTableTableViewController.class;
    
    // 回调
    mode.hgBlock = ^(HGTableTableViewController* hgVC) {
        // 用于刷新数据用的.
        hgVC.delegate = self;
    };
    
    return mode;
}

#pragma mark - HGTableTableViewControllerDelegate
- (void)didSelectItem:(NSString *)text {
    NSLog(@"你点击了:%@", text);
}

#pragma mark - HGWebView
- (HGContentMode*)webViewForPage:(NSInteger)page {
    HGContentMode* mode = [[HGContentMode alloc] init];
    mode.hgCls = HGWebView.class;
    mode.hgBlock = ^(HGWebView* webView) {
        webView.urlStr = @"https://www.jianshu.com/p/c0e611fc0548";
    };
    
    return mode;
}

#pragma mark - UILabel
- (HGContentMode*)labelForPage:(NSInteger)page {
    HGContentMode* mode = [[HGContentMode alloc] init];
    mode.hgCls = UILabel.class;
    mode.hgBlock = ^(UILabel* label) {
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"这里是直接用的系统的UILabel";
    };
    
    return mode;
}

// 布局
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.tabView.frame = HGCGM(0, 44.0+HG_STATUS_HEIGHT, self.view.width, self.view.height - (44.0+HG_STATUS_HEIGHT));
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

