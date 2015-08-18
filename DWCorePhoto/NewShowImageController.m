//
//  NewShowImageController.m
//  DWCorePhoto
//
//  Created by DavidWang on 15/8/18.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "NewShowImageController.h"

#define SCROLLMAR 20
#define TABLEVIEWMAR 10
#define COLLECTIONMAR 8
#define MXIMAR 4

@interface NewShowImageController (){
    CGSize bigSize;
    CGSize smallSize;
    UIImageView *imageview;
    CGRect zframe;
    CGRect wyrame;
}

@end

@implementation NewShowImageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _swipeView.pagingEnabled = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark -
#pragma mark iCarousel methods

- (NSInteger)numberOfItemsInSwipeView:(SwipeView *)swipeView
{
    //return the total number of items in the carousel
    return [_data count];
}

- (UIView *)swipeView:(SwipeView *)swipeView viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    NewShowImageView *showimage;
    if (view == nil)
    {
        showimage = [[[NSBundle mainBundle] loadNibNamed:@"NewShowImageView" owner:self options:nil] lastObject];
        showimage.model = [_data objectAtIndex:index];
        showimage.delegate = self;
    }else{
        showimage = (NewShowImageView *)view;
        showimage.model = [_data objectAtIndex:index];
        showimage.delegate = self;
        [showimage changeView];
    }
    
    
    return showimage;
}

- (CGSize)swipeViewItemSize:(SwipeView *)swipeView
{
    return self.swipeView.bounds.size;
}

- (void)swipeViewCurrentItemIndexDidChange:(SwipeView *)swipeView
{
    //update page control page
    NSLog(@"%ld",swipeView.currentPage);
    NSUInteger page = swipeView.currentPage;
    ImageModel *model = [_data objectAtIndex:page];
    [imageview sd_setImageWithURL:[NSURL URLWithString:model.imageurl]];
    if (_type == 1) {
        NSInteger cha = page - _index;
        CGFloat y = zframe.origin.y + (cha * (zframe.size.height + TABLEVIEWMAR));
        wyrame = CGRectMake(zframe.origin.x, y, zframe.size.width, zframe.size.height);
    }else if(_type == 2){
        NSInteger a1 = _index % 3;
        NSInteger a = page % 3;
        NSInteger chax = a - a1;
        NSInteger b1 = _index /3;
        NSInteger b = page / 3;
        NSInteger chay = b - b1;
        CGFloat x = zframe.origin.x + (chax * (zframe.size.width + COLLECTIONMAR));
        CGFloat y = zframe.origin.y + (chay * (zframe.size.height + COLLECTIONMAR));
        wyrame = CGRectMake(x, y, zframe.size.width, zframe.size.height);
    }else if (_type == 3){
        NSInteger a1 = _index % 3;
        NSInteger a = page % 3;
        NSInteger chax = a - a1;
        NSInteger b1 = _index /3;
        NSInteger b = page / 3;
        NSInteger chay = b - b1;
        CGFloat x = zframe.origin.x + (chax * (zframe.size.width + MXIMAR));
        CGFloat y = zframe.origin.y + (chay * (zframe.size.height + MXIMAR));
        wyrame = CGRectMake(x, y, zframe.size.width, zframe.size.height);
    }else if (_type == 4){
        NSInteger a1 = _index % 2;
        NSInteger a = page % 2;
        NSInteger chax = a - a1;
        NSInteger b1 = _index /2;
        NSInteger b = page / 2;
        NSInteger chay = b - b1;
        CGFloat x = zframe.origin.x + (chax * (zframe.size.width + MXIMAR));
        CGFloat y = zframe.origin.y + (chay * (zframe.size.height + MXIMAR));
        wyrame = CGRectMake(x, y, zframe.size.width, zframe.size.height);
    }
}

- (void)swipeView:(SwipeView *)swipeView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"Selected item at index %ld", index);
}


- (void)dealloc
{
    _swipeView.delegate = nil;
    _swipeView.dataSource = nil;
}

-(void)showImageView:(CGRect) initframe image:(UIImage *) image w:(CGFloat )w h :(CGFloat) h{
    if (w == 0) {
        w = 1000;
    }
    if (h == 0) {
        h = 1000;
    }
    CGRect frame = [UIScreen mainScreen].bounds;
    zframe = initframe;
    imageview = [[UIImageView alloc] initWithFrame:initframe];
    imageview.image = image;
    imageview.clipsToBounds = YES;
    imageview.backgroundColor = [UIColor lightGrayColor];
    imageview.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageview];
    CGFloat iwidth = w;
    CGFloat iheight = h;
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

-(void)defaultImage:(CGRect) initframe frame:(CGRect )frame{
    UIImage *mrimg = [UIImage imageNamed:@"default"];
    CGFloat iwidth = mrimg.size.width;
    CGFloat iheight = mrimg.size.height;
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
    mrimg = nil;
}

-(void)goBig{
    //    img.center = CGPointMake(bigSize.width/2.0, bigSize.height/2.0);
    imageview.bounds = CGRectMake(0, 0, bigSize.width, bigSize.height);
    //markwyb隐藏NavBar
    CGFloat d = smallSize.height / bigSize.height;
    if (smallSize.width > smallSize.height) {
        d = smallSize.width / bigSize.width;
    }
    imageview.layer.transform = CATransform3DMakeScale(d, d, 1);
    [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:d initialSpringVelocity:d options:UIViewAnimationOptionCurveEaseInOut animations:^{
        imageview.layer.transform = CATransform3DIdentity;
    } completion:^(BOOL finished) {
        [_swipeView setHidden:NO];
        [_swipeView scrollToPage:_index duration:0.0];
        [imageview setHidden:YES];
    }];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if (_pop_type == 1) {
        [self goNewBig];
    }else{
        CGPoint point = self.view.center;
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            imageview.center = point;
        } completion:^(BOOL finished) {
            imageview.clipsToBounds = false;
            [self goBig];
            
        }];
    }
}

-(void)NewBackOnclick{
    if (_pop_type == 1) {
        [self didNewbig];
    }else{
        [self didbig];
    }
}

-(void)didbig{
    [imageview setHidden:NO];
    [_swipeView setHidden:YES];
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

-(void)goNewBig{
    imageview.clipsToBounds = YES;
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    positionAnimation.toValue = [NSValue valueWithCGPoint:self.view.center];
    [imageview.layer pop_addAnimation:positionAnimation forKey:@"layerPositionAnimation"];
    POPSpringAnimation *boundsAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
    boundsAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, bigSize.width, bigSize.height)];
    boundsAnimation.springBounciness = 20.f;
    [imageview.layer pop_addAnimation:boundsAnimation forKey:@"boundsAnimation"];
    [boundsAnimation setCompletionBlock:^(POPAnimation *animation, BOOL finished) {
        [_swipeView setHidden:NO];
        [_swipeView scrollToPage:_index duration:0.0];
        [imageview setHidden:YES];
    }];
}

-(void)didNewbig{
    [_swipeView setHidden:YES];
    [imageview setHidden:NO];
    imageview.clipsToBounds = YES;
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    CGPoint point = CGPointMake(zframe.origin.x + zframe.size.width/2, zframe.origin.y + zframe.size.height/2);
    if (wyrame.size.width != 0) {
        point = CGPointMake(wyrame.origin.x + wyrame.size.width/2, wyrame.origin.y + wyrame.size.height/2);
    }
    positionAnimation.toValue = [NSValue valueWithCGPoint:point];
    [imageview.layer pop_addAnimation:positionAnimation forKey:@"layerPositionAnimation"];
    POPSpringAnimation *boundsAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
    if (wyrame.size.width != 0) {
        boundsAnimation.toValue = [NSValue valueWithCGRect:wyrame];
    }else{
        boundsAnimation.toValue = [NSValue valueWithCGRect:zframe];
    }
    [imageview.layer pop_addAnimation:boundsAnimation forKey:@"boundsAnimation"];
    [positionAnimation setCompletionBlock:^(POPAnimation *animation, BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
    
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
