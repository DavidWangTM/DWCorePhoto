//
//  TableCell.h
//  DWCorePhoto
//
//  Created by mac on 15/7/8.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TableCellDelegate <NSObject>

-(void)backindexPath:(NSIndexPath *)indexPath;

@end

@interface TableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *showImage;
@property (weak, nonatomic) id<TableCellDelegate> delegate;
@property (strong, nonatomic) NSIndexPath *indexPath;

@end
