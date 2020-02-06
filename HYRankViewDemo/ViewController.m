//
//  ViewController.m
//  HYRankViewDemo
//
//  Created by JackXu on 2020/2/6.
//  Copyright © 2020 JXRice. All rights reserved.
//

#import "ViewController.h"
#import "HYRankView.h"

@interface ViewController ()
@property (weak,nonatomic) HYRankView *view1;
@property (weak,nonatomic) HYRankView *view2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HYRankView *view = [HYRankView viewWithTitle:@"价格" frame:CGRectMake(0,100,80,40)];
    [view addTarget:self action:@selector(clickPrice:) forControlEvents:UIControlEventTouchUpInside];
    [view makeOpposite];
    [self.view addSubview:view];
    self.view1 = view;
    
    HYRankView *view2 = [HYRankView viewWithTitle:@"销量" frame:CGRectMake(200,100,120,40)];
    view2.textFont = [UIFont systemFontOfSize:20 weight:UIFontWeightBold];
    view2.triangleW = 20;
    view2.selectColor = [UIColor redColor];
    view2.unselectColor = [UIColor blackColor];
    [view2 addTarget:self action:@selector(clickSaleCount:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:view2];
    self.view2 = view2;

}

-(void)clickPrice:(HYRankView*)sender{
    [sender makeOpposite];
    self.view2.type = HYRankTypeNone;
}

-(void)clickSaleCount:(HYRankView*)sender{
    [sender makeOpposite];
    self.view1.type = HYRankTypeNone;
}
@end
