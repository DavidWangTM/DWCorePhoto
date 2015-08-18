//
//  PCHeader.h
//  LonelyChat
//
//  Created by davidwang on 14/12/18.
//  Copyright (c) 2014年 davidwang. All rights reserved.
//

#import <pop/POP.h>
#import "UIImageView+WebCache.h"
#import "ImageModel.h"
#import "SwipeView.h"
#import "ShowImageView.h"
#import "NewShowImageView.h"

#define BOUNDS [[UIScreen mainScreen] bounds].size


#define ISIOS7LATER [[[UIDevice currentDevice] systemVersion] floatValue]>=7
#define ISIOS8LATER [[[UIDevice currentDevice] systemVersion] floatValue]>=8

#define IS_PHONE5 (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)
#define IS_PHONE4   (([[UIScreen mainScreen] bounds].size.height-480)?NO:YES)
#define IS_PHONE6   (([[UIScreen mainScreen] bounds].size.height-1334)?NO:YES)
#define IS_PHONE6PIS (([[UIScreen mainScreen] bounds].size.height-2208)?NO:YES)



#if TARGET_IPHONE_SIMULATOR
#define SIMULATOR 1
#elif TARGET_OS_IPHONE
#define SIMULATOR 0
#endif
