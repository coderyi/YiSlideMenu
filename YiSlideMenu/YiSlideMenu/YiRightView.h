//
//  YiRightView.h
//  YiSlideMenu
//
//  Created by coderyi on 15/3/8.
//  Copyright (c) 2015年 www.coderyi.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol YiRightViewDelegate;
@interface YiRightView : UIView{
    id<YiRightViewDelegate> delegate;
}
@property id<YiRightViewDelegate> delegate;
@end
@protocol YiRightViewDelegate<NSObject>
- (void)rightDidSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end

