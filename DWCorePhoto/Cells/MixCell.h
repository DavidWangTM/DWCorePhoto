//
//  MixCell.h
//  DWCorePhoto
//
//  Created by mac on 15/7/13.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PCHeader.h"
#import "MixModel.h"

@interface MixCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *showImg;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *contentLab;
@property (weak, nonatomic) IBOutlet UIView *addView;
@property (strong, nonatomic) MixModel *info;


-(CGFloat)GetHight;

@end
