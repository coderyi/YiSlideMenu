# YiSlideMenu
[![Pod Version](http://img.shields.io/cocoapods/v/YiSlideMenu.svg?style=flat)](http://cocoadocs.org/docsets/YiSlideMenu/)
[![Pod Platform](http://img.shields.io/cocoapods/p/YiSlideMenu.svg?style=flat)](http://cocoadocs.org/docsets/YiSlideMenu/)
[![Pod License](http://img.shields.io/cocoapods/l/YiSlideMenu.svg?style=flat)](https://opensource.org/licenses/MIT)

SlideMenu，简洁的侧边菜单，清爽风格。

YiSlideView是用UIScrollView实现的侧边菜单，左菜单、右菜单以及中间视图加在UIScrollView上。

#### Podfile

```ruby
platform :ios, '7.0'
pod "YiSlideMenu", "~> 0.1"
```

使用方法

    YiSlideMenu *slideMenu = [[YiSlideMenu alloc] initWithFrame:CGRectMake(0, 0, WScreen, HScreen)];
    [self.view addSubview:slideMenu];
    slideMenu.slideMenuDelegate=self;
    slideMenu.navTitleLabel.text=@"YiSlideMenu";
    
    UITableView *tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0 , WScreen, HScreen-64) style:UITableViewStylePlain];
    [slideMenu.centerView addSubview:tableView];
    
    
    
    
    
    
![YiRefresh](http://7u2k5i.com1.z0.glb.clouddn.com/github_yislidemenu1.gif?imageMogr2/thumbnail/370x662!) 

![YiRefresh](http://7u2k5i.com1.z0.glb.clouddn.com/github_yislidemenu2.gif?imageMogr2/thumbnail/370x662!) 

copyright (c) 2015 coderyi.all rights reserved.
