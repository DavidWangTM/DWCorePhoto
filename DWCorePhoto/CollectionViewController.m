//
//  CollectionViewController.m
//  DWCorePhoto
//
//  Created by mac on 15/7/8.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionCell.h"
#import "PCHeader.h"
#import "ShowImageController.h"

#import "NewShowImageController.h"
@interface CollectionViewController ()<CollectionCellDelegate>{
    NSMutableArray *data;
    NSInteger index;
    UIImageView *imageview;
    CGRect frame_first;
}

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    data = [NSMutableArray new];
    for (int i = 0 ; i < 5; i++) {
        ImageModel *model = [ImageModel new];
        model.imageurl = @"http://img4q.duitang.com/uploads/item/201408/11/20140811141753_iNtAF.jpeg";
        model.width = 1280;
        model.height = 720;
        [data addObject:model];
        ImageModel *model1 = [ImageModel new];
        model1.imageurl = @"http://imgsrc.baidu.com/forum/pic/item/8b82b9014a90f603fa18d50f3912b31bb151edca.jpg";
        model1.width = 1280;
        model1.height = 720;
        [data addObject:model1];
        ImageModel *model2 = [ImageModel new];
        model2.imageurl = @"http://imgsrc.baidu.com/forum/pic/item/8e230cf3d7ca7bcb3acde5a2be096b63f724a8b2.jpg";
        model2.width = 1280;
        model2.height = 720;
        [data addObject:model2];
        ImageModel *model3 = [ImageModel new];
        model3.imageurl = @"http://att.bbs.duowan.com/forum/201210/20/210446opy9p5pghu015p9u.jpg";
        model3.width = 1280;
        model3.height = 720;
        [data addObject:model3];
        ImageModel *model4 = [ImageModel new];
        model4.imageurl = @"http://img5.duitang.com/uploads/item/201404/11/20140411214939_XswXa.jpeg";
        model4.width = 1280;
        model4.height = 720;
        [data addObject:model4];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier compare:@"showimage"] == NSOrderedSame ) {
        ShowImageController *img = (ShowImageController*)segue.destinationViewController;
        img.data = data;
        img.index = index;
        img.type = 2;
        //动画类型，目前只有2种.0和1
        img.pop_type = 0;
        ImageModel *model = [data objectAtIndex:index];
        [img showImageView:frame_first image:imageview.image w:model.width h:model.height];
    }else if ([segue.identifier compare:@"showimage1"] == NSOrderedSame){
        NewShowImageController *img = (NewShowImageController*)segue.destinationViewController;
        img.data = data;
        img.index = index;
        img.type = 2;
        //动画类型，目前只有2种.0和1
        img.pop_type = 0;
        ImageModel *model = [data objectAtIndex:index];
        [img showImageView:frame_first image:imageview.image w:model.width h:model.height];
    }
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [data count];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (BOUNDS.width - 10*4)/3;
    return CGSizeMake(width, width);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    ImageModel *model = [data objectAtIndex:indexPath.row];
    cell.indexPath = indexPath;
    cell.delegate = self;
    [cell.showImage sd_setImageWithURL:[NSURL URLWithString:model.imageurl]];
    
    return cell;
}

-(void)backindexPath:(NSIndexPath *)indexPath{
    index = [indexPath row];
    CollectionCell *cell = (CollectionCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    imageview = cell.showImage;
    
    frame_first = CGRectMake(cell.frame.origin.x+imageview.frame.origin.x, cell.frame.origin.y+imageview.frame.origin.y-self.collectionView.contentOffset.y, imageview.frame.size.width, imageview.frame.size.height);
    [self performSegueWithIdentifier:@"showimage1" sender:nil];
}


#pragma mark <UICollectionViewDelegate>
// 选中某个cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}


@end
