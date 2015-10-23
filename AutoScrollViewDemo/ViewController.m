//
//  ViewController.m
//  AutoScrollViewDemo
//
//  Created by AD-iOS on 15/10/20.
//  Copyright © 2015年 Adinnet. All rights reserved.
//

#import "ViewController.h"
#import "WDScrollView.h"

@interface ViewController ()
{
    WDScrollView *myScrollView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    WDScrollView *scrollView = [[WDScrollView alloc]initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 300) andLayout:WDScrollViewLayoutDefault];
    myScrollView = scrollView;
    NSArray *imageURL = @[@"http://wenwen.soso.com/p/20091001/20091001123707-792857275.jpg",@"http://d.hiphotos.baidu.com/image/pic/item/342ac65c10385343f853ef2b9113b07eca80881f.jpg",@"http://c.hiphotos.baidu.com/image/pic/item/3b292df5e0fe99258613015a36a85edf8db17198.jpg",@"http://e.hiphotos.baidu.com/image/pic/item/1ad5ad6eddc451daa5a58903b2fd5266d1163282.jpg"];
    NSMutableArray *muImageArr = [NSMutableArray array];
    for (NSString *str in imageURL) {
        NSURL *url = [NSURL URLWithString:str];
        [muImageArr addObject:url];
    }
    scrollView.imageArr = muImageArr;
    scrollView.titleArr = @[@"1",@"2",@"3",@"4"];
    scrollView.autoScrollTimeinterval = 2;
    [self.view addSubview:scrollView];
    scrollView.shouldAutoScoll = NO;
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(scrollView.frame) + 50, CGRectGetWidth(self.view.frame), 30)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"尚未点击";
    [self.view addSubview:label];
    
    [scrollView setClickedIndexBlock:^(NSInteger index) {
        label.text = [NSString stringWithFormat:@"点击了第%lu页",index];
    }];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(0, CGRectGetHeight(self.view.frame) - 50, 100, 40);
    button1.tag = 100;
    [button1 setTitle:@"停止自动滚动" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    button2.frame = CGRectMake(CGRectGetWidth(self.view.frame) - 100, CGRectGetHeight(self.view.frame) - 50, 100, 40);
    button2.tag = 200;
    [button2 setTitle:@"开始自动滚动" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonClicked:(UIButton*)button
{
    if (button.tag == 100) {
        myScrollView.shouldAutoScoll = NO;
    }else{
        myScrollView.shouldAutoScoll = YES;
    }
}

@end
