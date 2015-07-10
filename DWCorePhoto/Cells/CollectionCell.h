//
//  CollectionCell.h
//  DWCorePhoto
//
//  Created by mac on 15/7/8.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CollectionCellDelegate <NSObject>

-(void)backindexPath:(NSIndexPath *)indexPath;

@end

@interface CollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *showImage;
@property (strong, nonatomic) NSIndexPath *indexPath;
@property (weak, nonatomic) id<CollectionCellDelegate> delegate;

@end
