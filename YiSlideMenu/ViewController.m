//
//  ViewController.m
//  YiSlideMenu
//
//  Created by coderyi on 15/3/7.
//  Copyright (c) 2015年 www.coderyi.com. All rights reserved.
//

#import "ViewController.h"
#import "YiLeftView.h"
#import "YiRightView.h"
#import "YiSlideMenu.h"
#import "NextViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,YiSlideMenuDelegate>{
    UITableView *tableView;
    YiSlideMenu *slideMenu;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if (iOS7) {
        self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
  
    }
    self.navigationController.navigationBar.hidden=YES;

    slideMenu = [[YiSlideMenu alloc] initWithFrame:CGRectMake(0, 0, WScreen, HScreen)];
    [self.view addSubview:slideMenu];
    slideMenu.slideMenuDelegate=self;
    slideMenu.navTitleLabel.text=@"YiSlideMenu";


    tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0 , WScreen, HScreen-64) style:UITableViewStylePlain];
    [slideMenu.centerView addSubview:tableView];
    
    
    
    
    
    
    tableView.rowHeight=120;
    tableView.dataSource=self;
    tableView.delegate=self;

    if (iOS7) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    tableView.showsVerticalScrollIndicator=NO;
    
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 15;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *CellId = @"CellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellId];
        
//        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
    }
    cell.textLabel.text=slideMenu.navTitleLabel.text;
    cell.detailTextLabel.text=@"I am a 22 year old developer who works primarily on iOS. I love building creative products that are beneficial to people's lives.";
    cell.detailTextLabel.numberOfLines=0;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NextViewController *next=[[NextViewController alloc] init];
    
    [self.navigationController pushViewController:next animated:YES];
    


}

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath slide:(YiSlideDirection)slideDirection{
    if (slideDirection==YiLeftDirection) {
        slideMenu.navTitleLabel.text=[NSString stringWithFormat:@"Menu%d",indexPath.row];

        [slideMenu navLeftBtAction];
        [tableView reloadData];
    }else if (slideDirection==YiRightDirection){
    
        slideMenu.navTitleLabel.text=[NSString stringWithFormat:@"Notify%d",indexPath.row];
        NextViewController *next=[[NextViewController alloc] init];
        
        [self.navigationController pushViewController:next animated:YES];
    }


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
