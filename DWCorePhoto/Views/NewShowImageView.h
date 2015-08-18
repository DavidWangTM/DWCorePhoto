//
//  NewShowImageView.h
//  DWCorePhoto
//
//  Created by DavidWang on 15/8/18.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PCHeader.h"

@protocol NewShowImageDelegate <NSObject>

-(void)NewBackOnclick;

@end

@interface NewShowImageView : UIView

@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (strong, nonatomic) ImageModel *model;
@property (strong ,nonatomic) UIImageView *imageView;
@property (weak, nonatomic) id<NewShowImageDelegate> delegate;

-(void)changeView;

@end
