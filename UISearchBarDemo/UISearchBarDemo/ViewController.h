//
//  ViewController.h
//  UISearchBarDemo
//
//  Created by shiwei on 15/9/29.
//  Copyright © 2015年 ___Shiwei___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchViewController.h"

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>

//搜索框
@property(nonatomic,strong) UISearchBar *searchBar;

//列表页数据显示表格
@property(nonatomic,strong) UITableView *myTableView;

@property(nonatomic,strong) NSMutableArray *data;

//搜索结果视图
@property(nonatomic,strong) SearchViewController *searchController;

@end
