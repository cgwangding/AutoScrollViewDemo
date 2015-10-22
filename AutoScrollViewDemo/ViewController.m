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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    WDScrollView *scrollView = [[WDScrollView alloc]initWithFrame:self.view.bounds];
    NSArray *imageURL = @[@"http://wenwen.soso.com/p/20091001/20091001123707-792857275.jpg",@"http://d.hiphotos.baidu.com/image/pic/item/342ac65c10385343f853ef2b9113b07eca80881f.jpg",@"http://c.hiphotos.baidu.com/image/pic/item/3b292df5e0fe99258613015a36a85edf8db17198.jpg",@"http://e.hiphotos.baidu.com/image/pic/item/1ad5ad6eddc451daa5a58903b2fd5266d1163282.jpg"];
    NSMutableArray *muImageArr = [NSMutableArray array];
    for (NSString *str in imageURL) {
        NSURL *url = [NSURL URLWithString:str];
        [muImageArr addObject:url];
    }
    scrollView.imageArr = muImageArr;
    scrollView.autoScrollTimeinterval = 5;
    [self.view addSubview:scrollView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
