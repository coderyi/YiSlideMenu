//
//  NextViewController.m
//  YiSlideMenu
//
//  Created by apple on 15/3/9.
//  Copyright (c) 2015年 www.coderyi.com. All rights reserved.
//

#import "NextViewController.h"
@interface NextViewController ()
@end
@implementation NextViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if (iOS7) {
        self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
        
    }
    self.navigationController.navigationBar.barTintColor=StyleColor;
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake((WScreen-300)/2, 100, 300, 220)];
    [self.view addSubview:label];
    label.textColor=StyleColor;
    label.text=@"Hi! Coder!";
    label.font=[UIFont boldSystemFontOfSize:50];
    label.textAlignment=UITextAlignmentCenter;
}
-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
}
-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden=YES;
}
@end
