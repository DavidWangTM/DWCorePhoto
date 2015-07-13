//
//  MixModel.m
//  DWCorePhoto
//
//  Created by mac on 15/7/13.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "MixModel.h"

@implementation MixModel

-(MixModel *)initWithData:(NSString *)name content:(NSString *)content showimgurl:(NSString *)showimgurl data:(NSArray *)data{
    _name = name;
    _content = content;
    _showimgurl = showimgurl;
    _data = data;
    return self;
}

@end
