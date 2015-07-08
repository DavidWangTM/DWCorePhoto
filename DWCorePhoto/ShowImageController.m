
//
//  ShowImageController.m
//  DWCorePhoto
//
//  Created by mac on 15/7/8.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "ShowImageController.h"
#import "ShowImageView.h"
#import "PCHeader.h"

@interface ShowImageController ()<ShowImageDelegate>{
    ShowImageView *showimage;
}

@end

@implementation ShowImageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initData];
}

-(void)initData{
    for (int i = 0 ; i < [_data count]; i++) {
        showimage = [[[NSBundle mainBundle] loadNibNamed:@"ShowImageView" owner:self options:nil] firstObject];
        showimage.frame = CGRectMake(showimage.frame.size.width*i,showimage.frame.origin.y, showimage.frame.size.width,showimage.frame.size.height);
        showimage.url = [_data objectAtIndex:i];
        showimage.delegate = self;
        [_scrollView addSubview:showimage];
    }
    [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width* [_data count],_scrollView.frame.size.height)];
    
    [_scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width*_index, 0)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)BackOnclick{
    [self dismissViewControllerAnimated:YES completion:nil];
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
