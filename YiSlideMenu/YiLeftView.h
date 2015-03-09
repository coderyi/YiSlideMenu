//
//  YiLeftView.h
//  YiSlideMenu
//
//  Created by coderyi on 15/3/8.
//  Copyright (c) 2015年 www.coderyi.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol YiLeftViewDelegate;
@interface YiLeftView : UIView{
    id<YiLeftViewDelegate> delegate;
}
@property id<YiLeftViewDelegate> delegate;

@end
@protocol YiLeftViewDelegate<NSObject>
- (void)leftViewDidSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end