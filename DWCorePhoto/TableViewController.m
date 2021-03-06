//
//  TableViewController.m
//  DWCorePhoto
//
//  Created by mac on 15/7/8.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "TableViewController.h"
#import "TableCell.h"
#import "PCHeader.h"
#import "ShowImageController.h"
#import "NewShowImageController.h"

@interface TableViewController ()<TableCellDelegate>{
    NSMutableArray *data;
    NSInteger index;
    UIImageView *imageview;
    CGRect frame_first;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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

-(void)backconclick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [data count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"TableCell";
    TableCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    ImageModel *model = [data objectAtIndex:indexPath.row];
    cell.delegate = self;
    cell.indexPath = indexPath;
    [cell.showImage sd_setImageWithURL:[NSURL URLWithString:model.imageurl]];
    return cell;
}


-(void)backindexPath:(NSIndexPath *)indexPath{
    index = [indexPath row];
     TableCell *cell = (TableCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    imageview = cell.showImage;
    frame_first = CGRectMake(cell.frame.origin.x+imageview.frame.origin.x, cell.frame.origin.y+imageview.frame.origin.y-self.tableView.contentOffset.y, imageview.frame.size.width, imageview.frame.size.height);
    [self performSegueWithIdentifier:@"showimage1" sender:nil];
}



#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
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
        img.type = 1;
        //动画类型，目前只有2种.0和1
        img.pop_type = 0;
        ImageModel *model = [data objectAtIndex:index];
        [img showImageView:frame_first image:imageview.image w:model.width h:model.height];
    }else if ([segue.identifier compare:@"showimage1"] == NSOrderedSame ) {
        NewShowImageController *img = (NewShowImageController*)segue.destinationViewController;
        img.data = data;
        img.index = index;
        img.type = 1;
        //动画类型，目前只有2种.0和1
        img.pop_type = 0;
        ImageModel *model = [data objectAtIndex:index];
        [img showImageView:frame_first image:imageview.image w:model.width h:model.height];
    }
}


@end
