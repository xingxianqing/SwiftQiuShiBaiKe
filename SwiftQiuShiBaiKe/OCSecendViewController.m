//
//  OCSecendViewController.m
//  SwiftQiuShiBaiKe
//
//  Created by 邢现庆 on 15-2-14.
//  Copyright (c) 2015年 邢现庆. All rights reserved.
//

#import "OCSecendViewController.h"
#import "OCHttpRequest.h"
#import "Json.h"
#import "OCSecendTableViewCell.h"
#import "ObjectModel.h"

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define Screenheight [UIScreen mainScreen].bounds.size.height

@interface OCSecendViewController ()
@property(nonatomic,assign)int page;
@property(nonatomic,strong)NSMutableArray* listArray;
@property(nonatomic,strong)UITableView* tableView;
@end

@implementation OCSecendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"热门";
    self.page = 1;
    self.listArray=[NSMutableArray array];
    
    [self updateUI];
    
    [self loadData:self.page];
}
-(void)updateUI{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth , Screenheight)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle= UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
}
-(void)loadData:(int)page{
    
    [OCHttpRequest requestGetByURL:[NSString stringWithFormat:@"http://m2.qiushibaike.com/article/list/latest?count=20&page=%d",page] andBlock:^(id result) {
    
        NSLog(@"%@",result);
        self.listArray = [Json jsonData:result];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    }];
    

}


#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identity=@"cell";
    OCSecendTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identity];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"OCSecendTableViewCell" owner:self options:nil]lastObject];
    }
    cell.model = self.listArray[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ObjectModel* model = self.listArray[indexPath.row];
    
    return [self getSize:model.content].height+100;
}

#pragma mark UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(CGSize)getSize:(NSString*)content{
    CGSize size = [content boundingRectWithSize:CGSizeMake(ScreenWidth-40, 999) options:NSStringDrawingUsesLineFragmentOrigin  attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size;
    return size;
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
