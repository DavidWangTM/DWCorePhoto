//
//  SingleShowImage.m
//  DWCorePhoto
//
//  Created by mac on 15/7/8.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "SingleShowImage.h"
#import "PCHeader.h"
#import "ShowImageController.h"

@interface SingleShowImage (){
     NSMutableArray *data;
}

@end

@implementation SingleShowImage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    data = [NSMutableArray new];
    ImageModel *model = [ImageModel new];
    model.imageurl = @"http://img4q.duitang.com/uploads/item/201408/11/20140811141753_iNtAF.jpeg";
    model.width = 1280;
    model.height = 720;
    [data addObject:model];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ImageOnclick:)];
    [_showImage addGestureRecognizer:tap];
    _showImage.contentMode = UIViewContentModeScaleAspectFill;
    _showImage.clipsToBounds = YES;
    [_showImage sd_setImageWithURL:[NSURL URLWithString:model.imageurl]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)ImageOnclick:(UITapGestureRecognizer *)tap{
    [self performSegueWithIdentifier:@"showimage" sender:nil];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier compare:@"showimage"] == NSOrderedSame ) {
        ShowImageController *img = (ShowImageController*)segue.destinationViewController;
        img.data = data;
        //动画类型，目前只有2种.0和1
        img.pop_type = 0;
        [img showImageView:_showImage.frame image:_showImage.image w:1280 h:720];
    }
}


@end
