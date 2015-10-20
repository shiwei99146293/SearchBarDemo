//
//  ViewController.m
//  UISearchBarDemo
//
//  Created by shiwei on 15/9/29.
//  Copyright © 2015年 ___Shiwei___. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (instancetype)init
{
    self = [super init];
    self.data = [[NSMutableArray alloc] init];
    if (self) {
        for (int i=0; i<40; i++) {
            [self.data addObject:[NSString stringWithFormat:@"首页显示数据---%zd",i]];
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    CGSize size = [UIScreen mainScreen].bounds.size;
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0,0, size.width, 49)];
    self.searchBar.placeholder = @"请输入搜索内容";
    self.searchBar.delegate = self;
    
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height) style:UITableViewStylePlain];
    [self.myTableView setTableHeaderView:self.searchBar];
    [self.myTableView setDataSource:self];
    [self.myTableView setDelegate:self];
    [self.view addSubview:self.myTableView];
    
     self.searchController = [[SearchViewController alloc] initWithStyle:UITableViewStylePlain];
    [self.searchController.view setFrame:CGRectZero];
    [self.view addSubview:self.searchController.view];
}


#pragma mark UISearchBarDelegate

//搜索框中的内容发生改变时 回调（即要搜索的内容改变）
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    NSLog(@"changed");
    if (_searchBar.text.length == 0) {
        [self setSearchControllerHidden:YES]; //控制下拉列表的隐现
    }else{
        [self setSearchControllerHidden:NO];
    }
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    searchBar.showsCancelButton = YES;
    for(id cc in [searchBar subviews])
    {
        if ([cc isKindOfClass:[UIView class]]) {
            
            for (id vv  in [cc subviews]) {
                
                if([vv isKindOfClass:[UIButton class]])
                {
                    UIButton *btn = (UIButton *)vv;
                    [btn setTitle:@"取消"  forState:UIControlStateNormal];
                }
                
            }
            
        }
    }
    NSLog(@"shuould begin");
    return YES;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    searchBar.text = @"";
    NSLog(@"did begin");
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    NSLog(@"did end");
    searchBar.showsCancelButton = NO;
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"search clicked");
}

//点击搜索框上的 取消按钮时 调用
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"cancle clicked");
    _searchBar.text = @"";
    [_searchBar resignFirstResponder];
    [self setSearchControllerHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)setSearchControllerHidden:(BOOL)hidden {
    NSInteger height = hidden ? 0: 280;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    CGFloat y = self.myTableView.tableHeaderView.frame.origin.y+self.myTableView.tableHeaderView.frame.size.height+59;
    [self.searchController.view setFrame:CGRectMake(0, y , size.width, height)];
    [UIView commitAnimations];
}


#pragma mark UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellName = @"TestCellName";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    
    cell.textLabel.text= [self.data objectAtIndex:[indexPath row]];
    
    return cell;
}

@end
