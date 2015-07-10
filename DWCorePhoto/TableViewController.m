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

@interface TableViewController ()<TableCellDelegate>{
    NSArray *data;
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
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    data = @[@"http://img4q.duitang.com/uploads/item/201408/11/20140811141753_iNtAF.jpeg",@"http://imgsrc.baidu.com/forum/pic/item/8b82b9014a90f603fa18d50f3912b31bb151edca.jpg",@"http://imgsrc.baidu.com/forum/pic/item/8e230cf3d7ca7bcb3acde5a2be096b63f724a8b2.jpg",@"http://att.bbs.duowan.com/forum/201210/20/210446opy9p5pghu015p9u.jpg",@"http://img5.duitang.com/uploads/item/201404/11/20140411214939_XswXa.jpeg",@"http://img4q.duitang.com/uploads/item/201408/11/20140811141753_iNtAF.jpeg",@"http://imgsrc.baidu.com/forum/pic/item/8b82b9014a90f603fa18d50f3912b31bb151edca.jpg",@"http://imgsrc.baidu.com/forum/pic/item/8e230cf3d7ca7bcb3acde5a2be096b63f724a8b2.jpg",@"http://att.bbs.duowan.com/forum/201210/20/210446opy9p5pghu015p9u.jpg",@"http://img5.duitang.com/uploads/item/201404/11/20140411214939_XswXa.jpeg",@"http://img4q.duitang.com/uploads/item/201408/11/20140811141753_iNtAF.jpeg",@"http://imgsrc.baidu.com/forum/pic/item/8b82b9014a90f603fa18d50f3912b31bb151edca.jpg",@"http://imgsrc.baidu.com/forum/pic/item/8e230cf3d7ca7bcb3acde5a2be096b63f724a8b2.jpg",@"http://att.bbs.duowan.com/forum/201210/20/210446opy9p5pghu015p9u.jpg",@"http://img5.duitang.com/uploads/item/201404/11/20140411214939_XswXa.jpeg"];
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
    NSString *url = data[indexPath.row];
    cell.delegate = self;
    cell.indexPath = indexPath;
    [cell.showImage sd_setImageWithURL:[NSURL URLWithString:url]];
    return cell;
}


-(void)backindexPath:(NSIndexPath *)indexPath{
    index = [indexPath row];
     TableCell *cell = (TableCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    imageview = cell.showImage;
    frame_first = CGRectMake(cell.frame.origin.x+imageview.frame.origin.x, cell.frame.origin.y+imageview.frame.origin.y-self.tableView.contentOffset.y, imageview.frame.size.width, imageview.frame.size.height);
    [self performSegueWithIdentifier:@"showimage" sender:nil];
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
        [img showImageView:frame_first image:imageview.image];
    }
}


@end
