//
//  OCSecendTableViewCell.h
//  SwiftQiuShiBaiKe
//
//  Created by 邢现庆 on 15-2-14.
//  Copyright (c) 2015年 邢现庆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ObjectModel.h"
@interface OCSecendTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *namelable;
@property(nonatomic,strong)UITextView* contentTV;
@property(nonatomic,strong)UILabel* dingLable;
@property(nonatomic,strong)UILabel* caiLable;
@property(nonatomic,strong)UILabel* pinglunLable;
@property(nonatomic,strong)UILabel* lineLable;
@property(nonatomic,strong)ObjectModel* model;
@end
