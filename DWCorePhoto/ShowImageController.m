
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

#define SCROLLMAR 20

@interface ShowImageController ()<ShowImageDelegate>{
    ShowImageView *showimage;
    CGSize bigSize;
    CGSize smallSize;
    UIImageView *imageview;
    CGRect zframe;
    CGRect wyrame;
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
        showimage.frame = CGRectMake(_scrollView.frame.size.width*i ,_scrollView.frame.origin.y, _scrollView.frame.size.width - SCROLLMAR,_scrollView.frame.size.height);
        showimage.url = [_data objectAtIndex:i];
        showimage.delegate = self;
        [_scrollView addSubview:showimage];
    }
    [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width* [_data count],_scrollView.frame.size.height)];
    [_scrollView setHidden:YES];
}

-(void)showImageView:(CGRect) initframe image:(UIImage *) image{
    CGRect frame = [UIScreen mainScreen].bounds;
    zframe = initframe;
    imageview = [[UIImageView alloc] initWithFrame:initframe];
    imageview.image = image;
    imageview.clipsToBounds = YES;
    imageview.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageview];
    CGFloat iwidth = image.size.width;
    CGFloat iheight = image.size.height;
    if (iwidth > iheight) {
        CGFloat h = initframe.size.height;
        CGFloat w = iwidth / iheight * h;
        smallSize = CGSizeMake(w, h);
    }else{
        CGFloat w = initframe.size.width;
        CGFloat h = iheight / iwidth * w;
        smallSize = CGSizeMake(w, h);
    }
    if ((frame.size.height / frame.size.width) < (iheight / iwidth)) {
        CGFloat h = frame.size.height;
        CGFloat w = iwidth / iheight * h;
        bigSize = CGSizeMake(w, h);
    }else{
        CGFloat w = frame.size.width;
        CGFloat h = iheight / iwidth * w;
        bigSize = CGSizeMake(w, h);
    }
}

-(void)goBig:(UIImageView *)img{
//    img.center = CGPointMake(bigSize.width/2.0, bigSize.height/2.0);
    img.bounds = CGRectMake(0, 0, bigSize.width, bigSize.height);
    //markwyb隐藏NavBar
    CGFloat d = smallSize.height / bigSize.height;
    if (smallSize.width > smallSize.height) {
        d = smallSize.width / bigSize.width;
    }
    img.layer.transform = CATransform3DMakeScale(d, d, 1);
    [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:d initialSpringVelocity:d options:UIViewAnimationOptionCurveEaseInOut animations:^{
        img.layer.transform = CATransform3DIdentity;
    } completion:^(BOOL finished) {
        [_scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width*_index, 0)];
        [_scrollView setHidden:NO];
        [img setHidden:YES];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    CGPoint point = self.view.center;
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        imageview.center = point;
    } completion:^(BOOL finished) {
        imageview.clipsToBounds = false;
        [self goBig:imageview];
    }];
}

-(void)BackOnclick{
    [self didbig];
}

-(void)didbig{
    [imageview setHidden:NO];
    [_scrollView setHidden:YES];
    CGFloat d = smallSize.height / bigSize.height;
    if (smallSize.width > smallSize.height) {
        d = smallSize.width / bigSize.width;
    }
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        imageview.layer.transform = CATransform3DMakeScale(d,d,1.0);
        imageview.clipsToBounds = YES;
    } completion:^(BOOL finished) {
        [self goSmall];
    }];
}

-(void)goSmall{
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        if (wyrame.size.width != 0) {
            imageview.frame = wyrame;
        }else{
            imageview.frame = zframe;
        }
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
}

/*
 *  scrollView代理方法区
 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    //    NSUInteger page = [self pageCalWithScrollView:scrollView];
}


//10为图片的间距
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSUInteger page = [self pageCalWithScrollView:scrollView];
    [imageview sd_setImageWithURL:[NSURL URLWithString:[_data objectAtIndex:page]]];
    if (_type == 1) {
        NSInteger cha = page - _index;
        CGFloat y = zframe.origin.y + (cha * (zframe.size.height + 10));
        wyrame = CGRectMake(zframe.origin.x, y, zframe.size.width, zframe.size.height);
    }else if(_type == 2){
        NSInteger a1 = _index % 3;
        NSInteger a = page % 3;
        NSInteger chax = a - a1;
        NSInteger b1 = _index /3;
        NSInteger b = page / 3;
        NSInteger chay = b - b1;
        CGFloat x = zframe.origin.x + (chax * (zframe.size.width + 10));
        CGFloat y = zframe.origin.y + (chay * (zframe.size.height + 10));
        wyrame = CGRectMake(x, y, zframe.size.width, zframe.size.height);
    }
}

-(NSUInteger)pageCalWithScrollView:(UIScrollView *)scrollView{
    
    NSUInteger page = scrollView.contentOffset.x / scrollView.bounds.size.width + .5f;
    
    return page;
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
