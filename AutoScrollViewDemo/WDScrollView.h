//
//  WDScrollView.h
//  AutoScrollViewDemo
//
//  Created by AD-iOS on 15/10/20.
//  Copyright © 2015年 Adinnet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WDScrollView : UIView

/**
 *  图片源数组，可以添加 图片对象（UIImage类型）、图片名称（NSString类型）、图片的URL(NSURL类型)。所有
 *  的三种类型可以混合使用，但是必须对应相应的类型，否则图片加载不出来。
 */
@property (copy, nonatomic) NSArray *imageArr;

/**
 *  自动滚动的间隔
 */
@property (assign, nonatomic) NSInteger  autoScrollTimeinterval;


@property (nonatomic, strong) void(^ClickedIndexBlock)(NSInteger index);

@end
