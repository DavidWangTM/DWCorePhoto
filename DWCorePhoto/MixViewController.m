//
//  MixViewController.m
//  DWCorePhoto
//
//  Created by mac on 15/7/13.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "MixViewController.h"
#import "MixCell.h"

#define identifier @"MixCell"

@interface MixViewController (){
    NSMutableArray *data;
}

@end

@implementation MixViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    data = [NSMutableArray new];
    [self inData];
}

-(void)inData{
    for (int  i = 0; i< 2; i++) {
    NSArray *imgdata = @[@[@"http://img4q.duitang.com/uploads/item/201408/11/20140811141753_iNtAF.jpeg",@"1280",@"720"]];
    MixModel *info = [[MixModel alloc] initWithData:@"DavidWang" content:@"这是一个单张的演示" showimgurl:@"http://imgsrc.baidu.com/forum/pic/item/8b82b9014a90f603fa18d50f3912b31bb151edca.jpg" data:imgdata];
    [data addObject:info];
    
    NSArray *imgdata1 = @[@[@"http://article.joyme.com/article/uploads/allimg/140812/101I01291-10.jpg",@"640",@"960"]];
    MixModel *info1 = [[MixModel alloc] initWithData:@"DavidWang" content:@"这是一个单张的演示" showimgurl:@"http://imgsrc.baidu.com/forum/pic/item/8b82b9014a90f603fa18d50f3912b31bb151edca.jpg" data:imgdata1];
    [data addObject:info1];
    
    NSArray *imgdata2 = @[@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"]];
    MixModel *info2 = [[MixModel alloc] initWithData:@"DavidWang" content:@"这是一个单张的演示" showimgurl:@"http://imgsrc.baidu.com/forum/pic/item/8b82b9014a90f603fa18d50f3912b31bb151edca.jpg" data:imgdata2];
    [data addObject:info2];
    }

    NSArray *imgdata2 = @[@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"]];
    MixModel *info2 = [[MixModel alloc] initWithData:@"DavidWang" content:@"这是二张的演示" showimgurl:@"http://imgsrc.baidu.com/forum/pic/item/8b82b9014a90f603fa18d50f3912b31bb151edca.jpg" data:imgdata2];
    [data addObject:info2];
    
    NSArray *imgdata3 = @[@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"]];
    MixModel *info3 = [[MixModel alloc] initWithData:@"DavidWang" content:@"这是三张的演示" showimgurl:@"http://imgsrc.baidu.com/forum/pic/item/8b82b9014a90f603fa18d50f3912b31bb151edca.jpg" data:imgdata3];
    [data addObject:info3];
    
    NSArray *imgdata4 = @[@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"]];
    MixModel *info4 = [[MixModel alloc] initWithData:@"DavidWang" content:@"这是四张的演示" showimgurl:@"http://imgsrc.baidu.com/forum/pic/item/8b82b9014a90f603fa18d50f3912b31bb151edca.jpg" data:imgdata4];
    [data addObject:info4];
    
    NSArray *imgdata5 = @[@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"]];
    MixModel *info5 = [[MixModel alloc] initWithData:@"DavidWang" content:@"这是五张的演示" showimgurl:@"http://imgsrc.baidu.com/forum/pic/item/8b82b9014a90f603fa18d50f3912b31bb151edca.jpg" data:imgdata5];
    [data addObject:info5];
    
    NSArray *imgdata6 = @[@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"]];
    MixModel *info6 = [[MixModel alloc] initWithData:@"DavidWang" content:@"这是六张的演示" showimgurl:@"http://imgsrc.baidu.com/forum/pic/item/8b82b9014a90f603fa18d50f3912b31bb151edca.jpg" data:imgdata6];
    [data addObject:info6];
    
    NSArray *imgdata7 = @[@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"]];
    MixModel *info7 = [[MixModel alloc] initWithData:@"DavidWang" content:@"这是七张的演示" showimgurl:@"http://imgsrc.baidu.com/forum/pic/item/8b82b9014a90f603fa18d50f3912b31bb151edca.jpg" data:imgdata7];
    [data addObject:info7];
    
    NSArray *imgdata8 = @[@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"]];
    MixModel *info8 = [[MixModel alloc] initWithData:@"DavidWang" content:@"这是八张的演示" showimgurl:@"http://imgsrc.baidu.com/forum/pic/item/8b82b9014a90f603fa18d50f3912b31bb151edca.jpg" data:imgdata8];
    [data addObject:info8];
    
    NSArray *imgdata9 = @[@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"]];
    MixModel *info9 = [[MixModel alloc] initWithData:@"DavidWang" content:@"这是九张的演示" showimgurl:@"http://imgsrc.baidu.com/forum/pic/item/8b82b9014a90f603fa18d50f3912b31bb151edca.jpg" data:imgdata9];
    [data addObject:info9];
    
    [_tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [data count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    MixModel *info = [data objectAtIndex:[indexPath row]];
    MixCell *cell = [[MixCell alloc] init];
    cell.info = info;
    return [cell GetHight];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MixModel *info = [data objectAtIndex:[indexPath row]];
    MixCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.info = info;
    cell.index = [indexPath row];
    [cell setContent];
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
