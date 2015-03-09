//
//  YiLeftView.m
//  YiSlideMenu
//
//  Created by coderyi on 15/3/8.
//  Copyright (c) 2015年 www.coderyi.com. All rights reserved.
//

#import "YiLeftView.h"
@interface YiLeftView ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *tableView;
    
}

@end
@implementation YiLeftView
- (id)initWithFrame:(CGRect)frame
{

    self = [super initWithFrame:frame];
    if (self) {

        float viewWidth=frame.size.width;
        float viewHeight=frame.size.height;
        
        self.backgroundColor=[UIColor whiteColor];
        
        tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 64 , viewWidth, viewHeight-64) style:UITableViewStylePlain];
        [self addSubview:tableView];
        tableView.dataSource=self;
        tableView.delegate=self;
        if (iOS7) {
            [tableView setSeparatorInset:UIEdgeInsetsZero];
        }
        tableView.showsVerticalScrollIndicator=NO;
        
        UIView *line=[[UIView alloc] initWithFrame:CGRectMake(viewWidth-1, 64, 1, viewHeight-64)];
        [self addSubview:line];
        line.backgroundColor=[UIColor grayColor];
        

        
        
        UIView *titleView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, 64)];
        titleView.backgroundColor=StyleColor;
        
        UIImageView *titleIV=[[UIImageView alloc]initWithFrame:CGRectMake(10, 27, 30, 30)];
        titleIV.image=[UIImage imageNamed:@"jobs"];
        titleIV.layer.masksToBounds=YES;
        titleIV.layer.cornerRadius=20;
        [titleView addSubview:titleIV];
        
        UILabel *titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(50, 20, 140, 40)];
        [titleView addSubview:titleLabel];
        titleLabel.text=@"@coderyi";
        titleLabel.font=[UIFont boldSystemFontOfSize:16];
        titleLabel.textColor=[UIColor whiteColor];
        [self addSubview:titleView];
        
    
        
        
          }
    return self;
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
       
        
    }
    cell.textLabel.text=[NSString stringWithFormat:@"Menu%d",indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
    if ([_delegate respondsToSelector:@selector(leftViewDidSelectRowAtIndexPath:)]) {
        [_delegate leftViewDidSelectRowAtIndexPath:indexPath];
    }
    
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
