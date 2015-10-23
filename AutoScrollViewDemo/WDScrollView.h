//
//  WDScrollView.h
//  AutoScrollViewDemo
//
//  Created by AD-iOS on 15/10/20.
//  Copyright © 2015年 Adinnet. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickedIndexBlock)(NSInteger index);

typedef NS_ENUM(NSUInteger, WDScrollViewLayout) {
    WDScrollViewLayoutDefault = 1,
    WDScrollViewLayoutTiltleTopLeftPageControlBottomCenter,
    WDScrollViewLayoutTitleBottomLeftPageControlBottomRight = WDScrollViewLayoutDefault,
};

@protocol WDScrollViewDelegate;

@interface WDScrollView : UIView

@property (weak, nonatomic) id<WDScrollViewDelegate>delegate;

/**
 *  初始化方法
 *
 *  @param frame  滚动视图的大小
 *  @param layout 滚动视图上标题和PageControl的布局
 *
 *  @return 实例化的对象
 */
- (instancetype)initWithFrame:(CGRect)frame andLayout:(WDScrollViewLayout)layout;

/**
 *  图片源数组，可以添加 图片对象（UIImage类型）、图片名称（NSString类型）、图片的URL(NSURL类型)。所有
 *  的三种类型可以混合使用，但是必须对应相应的类型，否则图片加载不出来。
 */
@property (copy, nonatomic) NSArray *imageArr;

/**
 *  每张图片对应的标题的
 */
@property (copy, nonatomic) NSArray <NSString*>*titleArr;

/**
 *  是否自动滚动。默认为YES.
 */
@property (assign, nonatomic) BOOL shouldAutoScoll;

/**
 *  自动滚动的间隔,默认2s
 */
@property (assign, nonatomic) NSInteger  autoScrollTimeinterval;

/**
 * 当有一页的时候自动隐藏pageControl,默认YES。
 */
@property (assign, nonatomic) BOOL hidePageControlWhenSinglePage;


/**
 *  点击的位置，可通过这个方法获取，也可通过代理获取
 */
- (void)didClickedIndexBlock:(ClickedIndexBlock)block;


@end

@protocol WDScrollViewDelegate <NSObject>

@optional

- (void)wdScrollView:(WDScrollView*)scrollView didClickedAtIndex:(NSInteger)index;

@end