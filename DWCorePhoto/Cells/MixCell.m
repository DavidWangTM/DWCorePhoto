//
//  MixCell.m
//  DWCorePhoto
//
//  Created by mac on 15/7/13.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "MixCell.h"
#import "MixView.h"


@implementation MixCell

- (void)awakeFromNib {
    // Initialization code
    _showImg.layer.cornerRadius = 25;
    _showImg.contentMode = UIViewContentModeScaleAspectFill;
    _showImg.clipsToBounds = YES;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    [_showImg sd_setImageWithURL:[NSURL URLWithString:_info.showimgurl]];
    _nameLab.text = _info.name;
    _contentLab.text = _info.content;
    [self setAddViewImage];
}

-(void)setAddViewImage{
    NSArray *data = _info.data;
    if ([data count] == 1) {
        MixView *mixview = [[[NSBundle mainBundle] loadNibNamed:@"MixView" owner:self options:nil] firstObject];
        mixview.frame = CGRectMake(0, 0, [self GetWight], [self ImageOne]);
        NSString *url = [[data objectAtIndex:0] objectAtIndex:0];
        mixview.showimg.contentMode = UIViewContentModeScaleAspectFill;
        mixview.showimg.clipsToBounds = YES;
        [mixview.showimg sd_setImageWithURL:[NSURL URLWithString:url]];
        [_addView addSubview:mixview];
    }
}


-(CGFloat)GetHight{
    CGFloat hight;
    NSArray *data = _info.data;
    switch ([data count]) {
        case 0:
            hight = 66;
            break;
        case 1:
            hight = 66 + [self ImageOne] + 8;
            break;
       
        default:
            break;
    }
    
    return hight;
}

-(CGFloat)GetWight{
    NSArray *data = _info.data;
    CGFloat width;
    NSArray *dic = [data objectAtIndex:0];
    CGFloat w = [[dic objectAtIndex:1] floatValue];
    CGFloat h = [[dic objectAtIndex:2] floatValue];
    
    if (w > h) {
        width = BOUNDS.width - 132;
    }else if (w < h){
        width = BOUNDS.width/3;
    }else if (w == h){
        width = BOUNDS.width/2;
    }

    return width;
}

-(CGFloat)ImageOne{
    NSArray *data = _info.data;
    CGFloat width = [self GetWight];
    NSArray *dic = [data objectAtIndex:0];
    CGFloat w = [[dic objectAtIndex:1] floatValue];
    CGFloat h = [[dic objectAtIndex:2] floatValue];
    if (w > h) {
        return width*h/w;
    }else if (w < h){
        return width*h/w ;
    }else{
        return width*h/w;
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
