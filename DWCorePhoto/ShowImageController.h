//
//  ShowImageController.h
//  DWCorePhoto
//
//  Created by mac on 15/7/8.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import <UIKit/UIKit.h>

//type ,0为单张，1为列表，2为网格,3为混合网格,4为混合网格4方格。

@interface ShowImageController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
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
