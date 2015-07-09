//
//  ShowImageController.h
//  DWCorePhoto
//
//  Created by mac on 15/7/8.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import <UIKit/UIKit.h>

//type ,0为单张，1为列表，2为网格。

@interface ShowImageController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) NSArray *data;
@property NSInteger index;
@property NSInteger type;
-(void)showImageView:(CGRect) frame image:(UIImage *) image;

@end
