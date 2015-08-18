//
//  MixModel.h
//  DWCorePhoto
//
//  Created by mac on 15/7/13.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MixModel : NSObject

@property (strong ,nonatomic) NSString *name;
@property (strong ,nonatomic) NSString *content;
@property (strong ,nonatomic) NSString *showimgurl;
@property (strong ,nonatomic) NSArray *data;

-(MixModel *)initWithData:(NSString *)name content:(NSString *)content showimgurl:(NSString *)showimgurl data:(NSArray *)data;

@end
