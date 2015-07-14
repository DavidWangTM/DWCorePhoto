//
//  MixCell.m
//  DWCorePhoto
//
//  Created by mac on 15/7/13.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "MixCell.h"

#define GRIDMAR 90
#define GRIDSPA 8

@implementation MixCell

- (void)awakeFromNib {
    // Initialization code
    _showImg.layer.cornerRadius = 25;
    _showImg.contentMode = UIViewContentModeScaleAspectFill;
    _showImg.clipsToBounds = YES;
    _imgdata = @[_imgone,_imgtwo,_imgthree,_imgfour,_imgfive,_imgsix,_imgseven,_imgeight,_imgnine];
    
    for (int i = 0 ; i < [_imgdata count]; i++) {
        UIImageView *imageview = [_imgdata objectAtIndex:i];
        imageview.contentMode = UIViewContentModeScaleAspectFill;
        imageview.clipsToBounds = YES;
        UITapGestureRecognizer *sigtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gridImgOnclick:)];
        [imageview addGestureRecognizer:sigtap];
        
    }
    UITapGestureRecognizer *sigtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleImgOnclick)];
    [_singleImg addGestureRecognizer:sigtap];
}

-(void)gridImgOnclick:(UITapGestureRecognizer*)recognizer{
    UIImageView *imageview = (UIImageView *)recognizer.view;
    NSArray *data = _info.data;
    for (int i = 0;i < [_imgdata count];i++) {
        UIImageView *img = [_imgdata objectAtIndex:i];
        if (img == imageview) {
            int num = i;
            if ([data count] == 4) {
                if (i > 2) {
                    num --;
                }
            }
            [_delegate singleImgOnclick:_indexPath row:num imgview:img];
            return;
        }
    }
    
}

-(void)singleImgOnclick{
    [_delegate singleImgOnclick:_indexPath row:0 imgview:_singleImg];
}

-(void)setContent{
    [_showImg sd_setImageWithURL:[NSURL URLWithString:_info.showimgurl]];
    _nameLab.text = _info.name;
    _contentLab.text = _info.content;
    [self setAddViewImage];
}

-(void)drawRect:(CGRect)rect{
    _addView.frame = CGRectMake(_addView.frame.origin.x, _addView.frame.origin.y, _addView.frame.size.width, _addView.frame.size.width);
}

-(void)setAddViewImage{
    NSArray *data = _info.data;
     [self setGridImgHide];
    if ([data count] == 1) {
        [_singleImg setHidden:NO];
        _singleImg.frame = CGRectMake(0, 0, [self GetWight], [self ImageOne]);
        NSString *url = [[data objectAtIndex:0] objectAtIndex:0];
        [_singleImg sd_setImageWithURL:[NSURL URLWithString:url]];
    }else {
        [_singleImg setHidden:YES];
        
        [self SelectGridNum];
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
            hight = 66 + [self ImageOne] + GRIDSPA + GRIDSPA/2;
            break;
        case 2:
            hight = 66 + (BOUNDS.width - GRIDMAR + GRIDSPA)/3 + GRIDSPA/2;
            break;
        case 3:
            hight = 66 + (BOUNDS.width - GRIDMAR + GRIDSPA)/3 + GRIDSPA/2;
            break;
        case 4:
            hight = 66 + (BOUNDS.width - GRIDMAR + GRIDSPA)/3 * 2 + GRIDSPA/2;
            break;
        case 5:
            hight = 66 + (BOUNDS.width - GRIDMAR + GRIDSPA)/3 * 2 + GRIDSPA/2;
            break;
        case 6:
            hight = 66 + (BOUNDS.width - GRIDMAR + GRIDSPA)/3 * 2 + GRIDSPA/2;
            break;
        case 7:
            hight = 66 + (BOUNDS.width - GRIDMAR + GRIDSPA)/3 * 3 + GRIDSPA;
            break;
        case 8:
            hight = 66 + (BOUNDS.width - GRIDMAR + GRIDSPA)/3 * 3 + GRIDSPA;
            break;
        case 9:
            hight = 66 + (BOUNDS.width - GRIDMAR + GRIDSPA)/3 * 3 + GRIDSPA;
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

-(void)SelectGridNum{
    NSArray *data = _info.data;

        switch ([data count]) {
            case 2:
                [self setShowImgContent:2 data:data];
                break;
            case 3:
                [self setShowImgContent:3 data:data];
                break;
            case 4:
                for (int i = 0 ; i < 4; i++) {
                    int num = i;
                    if (i == 2 || i == 3){num++;}
                    UIImageView *img = [_imgdata objectAtIndex:num];
                    [img setHidden:NO];
                    [img sd_setImageWithURL:[NSURL URLWithString:[[data objectAtIndex:i] objectAtIndex:0]]];
                }
                break;
            case 5:
                [self setShowImgContent:5 data:data];
                break;
            case 6:
                [self setShowImgContent:6 data:data];
                break;
            case 7:
                [self setShowImgContent:7 data:data];
                break;
            case 8:
                [self setShowImgContent:8 data:data];
                break;
            case 9:
                [self setShowImgContent:9 data:data];
                break;
            default:
                break;
        }
}

-(void)setShowImgContent:(int) num data:(NSArray *)data{
    for (int i = 0 ; i < num; i++) {
        UIImageView *img = [_imgdata objectAtIndex:i];
        [img setHidden:NO];
        [img sd_setImageWithURL:[NSURL URLWithString:[[data objectAtIndex:i] objectAtIndex:0]]];
    }
}

-(void)setGridImgHide{
    [_imgone setHidden:YES];
    [_imgtwo setHidden:YES];
    [_imgthree setHidden:YES];
    [_imgfour setHidden:YES];
    [_imgfive setHidden:YES];
    [_imgsix setHidden:YES];
    [_imgseven setHidden:YES];
    [_imgeight setHidden:YES];
    [_imgnine setHidden:YES];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}






@end
