//
//  ShowImageView.m
//  DWCorePhoto
//
//  Created by mac on 15/7/8.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "ShowImageView.h"

@implementation ShowImageView{
    CGFloat currentScale;
    UIImageView *imageView;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    imageView = [UIImageView new];
    [imageView sd_setImageWithURL:[NSURL URLWithString:_url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        CGRect rect;
        rect.size.width = image.size.width;
        rect.size.height = image.size.height;
        [imageView setFrame:rect];
        
    }];
    
    [_scrollview setContentSize:[imageView frame].size];
    [_scrollview setMinimumZoomScale:[_scrollview frame].size.width / [imageView frame].size.width];
    [_scrollview setZoomScale:[_scrollview minimumZoomScale]];
    [_scrollview addSubview:imageView];
    
    UITapGestureRecognizer *tapImgView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImgViewHandle)];
    tapImgView.numberOfTapsRequired = 1;
    tapImgView.numberOfTouchesRequired = 1;
    [self addGestureRecognizer:tapImgView];
    
    UITapGestureRecognizer *tapImgViewTwice = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImgViewHandleTwice:)];
    tapImgViewTwice.numberOfTapsRequired = 2;
    tapImgViewTwice.numberOfTouchesRequired = 1;
    [self addGestureRecognizer:tapImgViewTwice];
    [tapImgView requireGestureRecognizerToFail:tapImgViewTwice];
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
    currentScale = scale;
    NSLog(@"回调-%f",currentScale);
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return imageView;
}

#pragma mark - tap
-(void)tapImgViewHandle{
    
    
    if (currentScale > 0.25) {
        currentScale = 0.0;
        [self.scrollview setZoomScale:0.0 animated:YES];
    }else{
        [_delegate BackOnclick];
    }
}

-(IBAction)tapImgViewHandleTwice:(UIGestureRecognizer *)sender{
    
    CGPoint touchPoint = [sender locationInView:self.scrollview];
    NSLog(@"%f",touchPoint.x);
    if(currentScale > 0.25){
        currentScale = 0.0;
        [self.scrollview setZoomScale:0.0 animated:YES];
    }else{
        currentScale = 2.0;
        [self.scrollview zoomToRect:CGRectMake(touchPoint.x*4, touchPoint.y*4, 1, 1) animated:YES];
    }
    
}

//实现图片在缩放过程中居中

- (void)scrollViewDidZoom:(UIScrollView *)scrollView1
{
    
    CGFloat offsetX = (scrollView1.bounds.size.width > scrollView1.contentSize.width)?(scrollView1.bounds.size.width - scrollView1.contentSize.width)/2 : 0.0;
    
    CGFloat offsetY = (scrollView1.bounds.size.height > scrollView1.contentSize.height)?(scrollView1.bounds.size.height - scrollView1.contentSize.height)/2 : 0.0;
    
    imageView.center = CGPointMake(scrollView1.contentSize.width/2 + offsetX,scrollView1.contentSize.height/2 + offsetY);

}


@end
