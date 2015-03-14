# YiSlideMenu
SlideMenu，简洁的侧边菜单，清爽风格。

YiSlideView是用UIScrollView实现的侧边菜单，左菜单、右菜单以及中间视图加在UIScrollView上。

iOS Slide Menu with ability to add both left and right menu, and built in UIScrollView.

使用方法

    YiSlideMenu *slideMenu = [[YiSlideMenu alloc] initWithFrame:CGRectMake(0, 0, WScreen, HScreen)];
    [self.view addSubview:slideMenu];
    slideMenu.slideMenuDelegate=self;
    slideMenu.navTitleLabel.text=@"YiSlideMenu";
    
    UITableView *tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0 , WScreen, HScreen-64) style:UITableViewStylePlain];
    [slideMenu.centerView addSubview:tableView];
    
    
    
    
    
    
![YiRefresh](http://7u2k5i.com1.z0.glb.clouddn.com/github_yislidemenu1.gif?imageMogr2/thumbnail/370x662!) 

![YiRefresh](http://7u2k5i.com1.z0.glb.clouddn.com/github_yislidemenu2.gif?imageMogr2/thumbnail/370x662!) 
