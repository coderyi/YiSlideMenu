//
//  YiSlideMenu.m
//  YiSlideMenu
//
//  Created by apple on 15/3/9.
//  Copyright (c) 2015年 www.coderyi.com. All rights reserved.
//

#import "YiSlideMenu.h"
#import "YiLeftView.h"
#import "YiRightView.h"
#define LeftWidth ([[UIScreen mainScreen] bounds].size.width/2.0+50)

#define RightWidth ([[UIScreen mainScreen] bounds].size.width/2.0+50)


@interface YiSlideMenu ()<UIScrollViewDelegate,YiLeftViewDelegate,YiRightViewDelegate>{
    

    UIView *leftBgView;
     UIView *centerBgView;
    UIView *rightBgView;
    float viewWidth;
    float viewHeight;

}


@end

@implementation YiSlideMenu
@synthesize centerView,navLeftBt,navRightBt,navTitleLabel;
- (id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        //        添加界面元素。
        
         viewWidth=frame.size.width;
         viewHeight=frame.size.height;
       
        self.alwaysBounceHorizontal=YES;
        self.bounces = YES;
        self.pagingEnabled = YES;
        self.delegate=self;
        self.userInteractionEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        
        
        
        leftBgView=[[UIView alloc] init];
        leftBgView.frame = CGRectMake((viewWidth * 0) , 0, viewWidth, viewHeight);
        leftBgView.clipsToBounds=YES;
        [self addSubview:leftBgView];
        
        YiLeftView *leftView=[[YiLeftView alloc] initWithFrame:CGRectMake(WScreen-LeftWidth , 0, LeftWidth, viewHeight)];
        leftView.clipsToBounds=YES;
        leftView.delegate=self;
        [leftBgView addSubview:leftView];
        
        
        
        centerBgView=[[UIView alloc] init];
        centerBgView.frame = CGRectMake(viewWidth , 0, viewWidth, viewHeight);
        centerBgView.clipsToBounds=YES;
        [self addSubview:centerBgView];
        
        centerView=[[UIView alloc] init];
        centerView.frame = CGRectMake(0 , 64, viewWidth, viewHeight-64);
        [centerBgView addSubview:centerView];
        centerView.backgroundColor=[UIColor whiteColor];
        
        UIView *navBar=[[UIView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, 64)];
        navBar.backgroundColor=StyleColor;
        [centerBgView addSubview:navBar];
        
        navLeftBt=[UIButton buttonWithType:UIButtonTypeCustom];
        [navBar addSubview:navLeftBt];
        navLeftBt.frame=CGRectMake(0, 22, 40, 40);
        [navLeftBt setImage:[UIImage imageNamed:@"left"] forState:UIControlStateNormal];
        navLeftBt.layer.masksToBounds=YES;
        navLeftBt.layer.cornerRadius=15;
        [navLeftBt addTarget:self action:@selector(navLeftBtAction) forControlEvents:UIControlEventTouchUpInside];
        
        
        navRightBt=[UIButton buttonWithType:UIButtonTypeCustom];
        [navBar addSubview:navRightBt];
        navRightBt.frame=CGRectMake(viewWidth-40, 22, 40, 40);
        [navRightBt setImage:[UIImage imageNamed:@"right"] forState:UIControlStateNormal];
        [navRightBt addTarget:self action:@selector(navRightBtAction) forControlEvents:UIControlEventTouchUpInside];
        
        
        navTitleLabel=[[UILabel alloc] initWithFrame:CGRectMake((viewWidth-120)/2, 20, 120, 44)];
        [navBar addSubview:navTitleLabel];
        navTitleLabel.font=[UIFont boldSystemFontOfSize:19];
        navTitleLabel.textAlignment=UITextAlignmentCenter;
        navTitleLabel.textColor=[UIColor whiteColor];
        
        
        
        rightBgView=[[UIView alloc] init];
        rightBgView.frame = CGRectMake((viewWidth * 2), 0, viewWidth, viewHeight);
        rightBgView.clipsToBounds=YES;
        [self addSubview:rightBgView];
        rightBgView.backgroundColor=[UIColor whiteColor];

        
        
        YiRightView *rightView=[[YiRightView alloc] initWithFrame:CGRectMake(0 , 0, RightWidth, viewHeight)];
        rightView.clipsToBounds=YES;
        rightView.delegate=self;
        [rightBgView addSubview:rightView];
        
        
        
        [self setContentSize:CGSizeMake(viewWidth * (3), 0)];
        [self scrollRectToVisible:CGRectMake(viewWidth,0,viewWidth,viewHeight) animated:NO];
        [self setContentOffset:CGPointMake(viewWidth,0)];
        
        
        
    }
    return self;
}
-(void)navLeftBtAction{

    if (self.contentOffset.x<=(viewWidth-LeftWidth)) {
         [self setContentOffset:CGPointMake(viewWidth,0) animated:YES];
        
       

    }else if (self.contentOffset.x>=(WScreen+0)){
             [self setContentOffset:CGPointMake(viewWidth-LeftWidth,0) animated:YES];


    }
}
-(void)navRightBtAction{

    if (self.contentOffset.x>=(viewWidth+RightWidth)) {
        [self scrollRectToVisible:CGRectMake(viewWidth+0,0,viewWidth,viewHeight-64) animated:YES];
        [self setContentOffset:CGPointMake(viewWidth,0) animated:YES];

        
    }else if (self.contentOffset.x<=(viewWidth+0)){
        [self scrollRectToVisible:CGRectMake(viewWidth+RightWidth,0,viewWidth,viewHeight-64) animated:YES];
        [self setContentOffset:CGPointMake(viewWidth+RightWidth,0) animated:YES];

        
        
    }
}

//只要滚动了就会触发
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
{

   
        if (scrollView.contentOffset.x<(viewWidth-LeftWidth)) {
            scrollView.contentOffset=CGPointMake(viewWidth-LeftWidth, 0);
        }else if (scrollView.contentOffset.x>(viewWidth+RightWidth)){
            scrollView.contentOffset=CGPointMake(viewWidth+RightWidth, 0);
        }
 
   

    
  }


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pagewidth = self.frame.size.width;
    int currentPage= floor((self.contentOffset.x - pagewidth/ (3)) / pagewidth) +1;


    if (currentPage==0)
    {
       
        [self scrollRectToVisible:CGRectMake(viewWidth-LeftWidth,0,viewWidth,viewHeight-64) animated:NO]; // 最后+1,循环第1页
    }
    else if (currentPage==(2))
    {
        
        [self scrollRectToVisible:CGRectMake(viewWidth+RightWidth,0,viewWidth,viewHeight-64) animated:NO]; // 序号0 最后1页
    }
 
}


-(void)leftViewDidSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([_slideMenuDelegate respondsToSelector:@selector(didSelectRowAtIndexPath:slide:)]) {
        [_slideMenuDelegate didSelectRowAtIndexPath:indexPath slide:YiLeftDirection];
    }

}
-(void)rightDidSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([_slideMenuDelegate respondsToSelector:@selector(didSelectRowAtIndexPath:slide:)]) {
        [_slideMenuDelegate didSelectRowAtIndexPath:indexPath slide:YiRightDirection];
    }
    
}
@end
