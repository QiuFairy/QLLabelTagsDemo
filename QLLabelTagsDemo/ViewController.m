//
//  ViewController.m
//  QLLabelTagsDemo
//
//  Created by qiu on 2018/4/11.
//  Copyright © 2018年 QiuFairy. All rights reserved.
//

#import "ViewController.h"
#import "QLTagListView.h"

@interface ViewController ()
//按钮
@property (nonatomic, weak) QLTagListView *tagList;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *tagScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 100, 320, 500)];
    tagScrollView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:tagScrollView];
    
    NSArray *tagArr = @[@"大神快捷键",@"分为老客户",@"肉干即可",@"欧派如果基金斧头",@"发海阔天空北极光",@"放到",@"顺丰到付几日后",@"反倒是你进房间了可通过",@"飞机",@"的佛教"];
    
    QLTagListView *tagList=[[QLTagListView alloc]initWithFrame:CGRectMake(0, 10, 320, 0)];
    tagList.backgroundColor = [UIColor whiteColor];
    /**允许点击 */
    tagList.canTouch = YES;
    tagList.signalTagColor=[UIColor whiteColor];
    tagList.titleNormalColor = [UIColor blueColor];
    tagList.titleSelectColor = [UIColor yellowColor];
    [tagList setTagWithTagArray:tagArr];
    [tagList setTagWithSelectTagArr:@[]];
    [tagList setDidselectItemBlock:^(NSArray *arr) {
        //选中的结果
        NSLog(@">>>arr = %@",arr);
    }];
    
    [tagScrollView addSubview:tagList];
    _tagList = tagList;
    
    tagScrollView.contentSize = CGSizeMake(320, tagList.frame.origin.y+ tagList.frame.size.height);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
