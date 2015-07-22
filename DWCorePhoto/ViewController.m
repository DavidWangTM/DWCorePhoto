//
//  ViewController.m
//  DWCorePhoto
//
//  Created by mac on 15/7/8.
//  Copyright (c) 2015年 DavidWang. All rights reserved.
//

#import "ViewController.h"
#import "MainCell.h"

@interface ViewController (){
    NSArray *arr;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    arr = @[@[@"SingleShow", @"single"],
            @[@"TableViewShow", @"list"],
              @[@"CollectionShow", @"grid"],
            @[@"MixShow", @"mix"]];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [arr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"MainCell";
    MainCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.showLab.text = [arr[indexPath.row] firstObject];
    return cell;
}
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:[arr[indexPath.row] lastObject] sender:nil];
    
}


@end
