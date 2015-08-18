//
//  MixViewController.m
//  DWCorePhoto
//
//  Created by mac on 15/7/13.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "MixViewController.h"
#import "MixCell.h"
#import "ShowImageController.h"
#import "NewShowImageController.h"

#define identifiercell @"MixCell"
#define kDefaultHeaderFrame CGRectMake(0, 0, self.mainTop.frame.size.width, self.mainTop.frame.size.height)

@interface MixViewController ()<MixCellDelegate>{
    NSMutableArray *data;
    NSInteger index;
    UIImageView *imageview;
    CGRect frame_first;
    NSArray *dataimg;
}

@end

@implementation MixViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    data = [NSMutableArray new];
    [self inData];
    
    
    _bgImageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _bgImageView.contentMode = UIViewContentModeScaleAspectFill;
    [_bgImageView sd_setImageWithURL:[NSURL URLWithString:@"http://img2.duitang.com/uploads/item/201208/22/20120822155433_ZLnhS.jpeg"]];
    _userImage.contentMode = UIViewContentModeScaleAspectFill;
    _userImage.clipsToBounds = YES;
    [_userImage sd_setImageWithURL:[NSURL URLWithString:@"http://imgsrc.baidu.com/forum/pic/item/8b82b9014a90f603fa18d50f3912b31bb151edca.jpg"]];
    
    
    
}

-(void)inData{
    NSArray *imgdata = @[@[@"http://img4q.duitang.com/uploads/item/201408/11/20140811141753_iNtAF.jpeg",@"1280",@"720"]];
    MixModel *info = [[MixModel alloc] initWithData:@"DavidWang" content:@"这是一个单张的演示" showimgurl:@"http://imgsrc.baidu.com/forum/pic/item/8b82b9014a90f603fa18d50f3912b31bb151edca.jpg" data:imgdata];
    [data addObject:info];
    
    NSArray *imgdata1 = @[@[@"http://article.joyme.com/article/uploads/allimg/140812/101I01291-10.jpg",@"640",@"960"]];
    MixModel *info1 = [[MixModel alloc] initWithData:@"DavidWang" content:@"这是一个单张的演示" showimgurl:@"http://imgsrc.baidu.com/forum/pic/item/8b82b9014a90f603fa18d50f3912b31bb151edca.jpg" data:imgdata1];
    [data addObject:info1];
    
    NSArray *imgdata0 = @[@[@"http://pic2.52pk.com/files/150402/1283568_110713_1_lit.jpg",@"271",@"400"]];
    MixModel *info0 = [[MixModel alloc] initWithData:@"DavidWang" content:@"这是一个单张的演示" showimgurl:@"http://imgsrc.baidu.com/forum/pic/item/8b82b9014a90f603fa18d50f3912b31bb151edca.jpg" data:imgdata0];
    [data addObject:info0];

    NSArray *imgdata2 = @[@[@"http://article.joyme.com/article/uploads/allimg/140812/101I01291-10.jpg",@"640",@"960"],@[@"http://h.hiphotos.baidu.com/album/scrop%3D236%3Bq%3D90/sign=2fab0be130adcbef056a3959dc921cee/4b90f603738da977c61bb40eb151f8198618e3db.jpg",@"236",@"236"]];
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
    MixCell *cell = (MixCell *)[tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:identifiercell];
    }
    cell.info = info;
    cell.indexPath = indexPath;
    cell.delegate = self;
    [cell setContent];
    return cell;
}
 
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(void)singleImgOnclick:(NSIndexPath *)indexPath row:(NSInteger)row imgview:(UIImageView *)imgview{
    index = row;
    MixModel *info = [data objectAtIndex:[indexPath row]];
    NSArray *data_i = info.data;
    MixCell *cell = (MixCell *)[_tableView cellForRowAtIndexPath:indexPath];
    imageview = imgview;
    NSMutableArray *addimg = [NSMutableArray new];
    for (int i = 0; i < [data_i count]; i++) {
        ImageModel *model = [ImageModel new];
        model.imageurl = [[data_i objectAtIndex:i] objectAtIndex:0];
        model.width = [[[data_i objectAtIndex:i] objectAtIndex:1] floatValue];
        model.height = [[[data_i objectAtIndex:i] objectAtIndex:2] floatValue];
        [addimg addObject:model];
    }
    dataimg = (NSArray *)addimg;
    frame_first = CGRectMake(cell.frame.origin.x+ cell.addView.frame.origin.x+imageview.frame.origin.x, cell.frame.origin.y+cell.addView.frame.origin.y+imageview.frame.origin.y-self.tableView.contentOffset.y, imageview.frame.size.width, imageview.frame.size.height);
    [self performSegueWithIdentifier:@"showimage1" sender:nil];
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier compare:@"showimage"] == NSOrderedSame ) {
        ShowImageController *img = (ShowImageController*)segue.destinationViewController;
        img.data = dataimg;
        if ([dataimg count] > 1) {
            img.type = 3;
            if ([dataimg count] == 4) {
                img.type = 4;
            }
        }else{
            img.type = 0;
        }
        img.index = index;
        //动画类型，目前只有2种.0和1
        img.pop_type = 0;
        
        
        ImageModel *model = [dataimg objectAtIndex:index];
        
        [img showImageView:frame_first image:imageview.image w:model.width h:model.height];
    }else if ([segue.identifier compare:@"showimage1"] == NSOrderedSame ) {
        NewShowImageController *img = (NewShowImageController*)segue.destinationViewController;
        img.data = dataimg;
        if ([dataimg count] > 1) {
            img.type = 3;
            if ([dataimg count] == 4) {
                img.type = 4;
            }
        }else{
            img.type = 0;
        }
        img.index = index;
        //动画类型，目前只有2种.0和1
        img.pop_type = 0;
        
        
        ImageModel *model = [dataimg objectAtIndex:index];
        
        [img showImageView:frame_first image:imageview.image w:model.width h:model.height];
    }

}

//top

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == _tableView)
    {
        [self layoutHeaderViewForScrollViewOffset:scrollView.contentOffset];
        [self.view bringSubviewToFront:_userImage];
        [self.view bringSubviewToFront:_usernameLab];
    }
}

- (void)layoutHeaderViewForScrollViewOffset:(CGPoint)offset
{
    CGRect frame = self.imageScrollView.frame;
    
    if (offset.y > 0)
    {
        self.imageScrollView.frame = frame;
        self.mainTop.clipsToBounds = YES;
    }
    else
    {
        CGFloat delta = 0.0f;
        CGRect rect = kDefaultHeaderFrame;
        delta = fabs(MIN(0.0f, offset.y));
        rect.origin.y -= delta;
        rect.size.height += delta;
        self.imageScrollView.frame = rect;
        self.mainTop.clipsToBounds = NO;
    }
}


@end
