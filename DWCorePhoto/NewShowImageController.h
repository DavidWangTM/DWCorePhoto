//
//  NewShowImageController.h
//  DWCorePhoto
//
//  Created by DavidWang on 15/8/18.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PCHeader.h"

@interface NewShowImageController : UIViewController <SwipeViewDelegate, SwipeViewDataSource,NewShowImageDelegate>

@property (nonatomic, weak) IBOutlet SwipeView *swipeView;
//图片存储数据
@property (weak, nonatomic) NSArray *data;
//页标
@property NSInteger index;
//类型
@property NSInteger type;
//动画类型
@property NSInteger pop_type;

//创建动画单张图片
-(void)showImageView:(CGRect) frame image:(UIImage *) image w:(CGFloat )w h :(CGFloat) h;

@end
