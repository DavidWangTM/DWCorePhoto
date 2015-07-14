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

@protocol MixCellDelegate <NSObject>

-(void)singleImgOnclick:(NSIndexPath *)indexPath row:(NSInteger) row imgview:(UIImageView *)imgview;

@end

@interface MixCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *showImg;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *contentLab;
@property (weak, nonatomic) IBOutlet UIView *addView;
@property (strong, nonatomic) MixModel *info;
@property (strong, nonatomic) NSArray *imgdata;
@property (strong, nonatomic) NSIndexPath *indexPath;
@property (weak, nonatomic) id<MixCellDelegate> delegate;

-(CGFloat)GetHight;
-(void)setContent;

@property (weak, nonatomic) IBOutlet UIImageView *singleImg;

@property (weak, nonatomic) IBOutlet UIImageView *imgone;
@property (weak, nonatomic) IBOutlet UIImageView *imgtwo;
@property (weak, nonatomic) IBOutlet UIImageView *imgthree;
@property (weak, nonatomic) IBOutlet UIImageView *imgfour;
@property (weak, nonatomic) IBOutlet UIImageView *imgfive;
@property (weak, nonatomic) IBOutlet UIImageView *imgsix;
@property (weak, nonatomic) IBOutlet UIImageView *imgseven;
@property (weak, nonatomic) IBOutlet UIImageView *imgeight;
@property (weak, nonatomic) IBOutlet UIImageView *imgnine;



@end
