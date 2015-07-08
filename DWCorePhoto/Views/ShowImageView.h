//
//  ShowImageView.h
//  DWCorePhoto
//
//  Created by mac on 15/7/8.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PCHeader.h"

@protocol ShowImageDelegate <NSObject>

-(void)BackOnclick;

@end

@interface ShowImageView : UIView<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) NSString *url;

@property (weak, nonatomic) id<ShowImageDelegate> delegate;

@end
