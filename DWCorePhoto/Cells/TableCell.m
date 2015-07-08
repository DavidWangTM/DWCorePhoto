//
//  TableCell.m
//  DWCorePhoto
//
//  Created by mac on 15/7/8.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "TableCell.h"

@implementation TableCell

- (void)awakeFromNib {
    // Initialization code
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onclick:)];
    [_showImage addGestureRecognizer:tap];
    _showImage.contentMode = UIViewContentModeScaleAspectFill;
    _showImage.clipsToBounds = YES;
}

-(void)onclick:(UITapGestureRecognizer *)tap{
    [_delegate backindexPath:_indexPath];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
