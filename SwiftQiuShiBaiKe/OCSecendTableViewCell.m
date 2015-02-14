//
//  OCSecendTableViewCell.m
//  SwiftQiuShiBaiKe
//
//  Created by 邢现庆 on 15-2-14.
//  Copyright (c) 2015年 邢现庆. All rights reserved.
//

#import "OCSecendTableViewCell.h"

@implementation OCSecendTableViewCell

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        
        self.contentTV = [[UITextView alloc]initWithFrame:CGRectZero];
        self.contentTV.selectable=NO;
        self.contentTV.userInteractionEnabled=NO;
        self.contentTV.editable=NO;
        self.contentTV.scrollEnabled=NO;
        self.contentTV.font=[UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.contentTV];
        
        self.dingLable =[[UILabel alloc]initWithFrame:CGRectZero];
        self.dingLable.text = @"顶（100）";
        [self.contentView addSubview:self.dingLable];
        
        self.caiLable =[[UILabel alloc]initWithFrame:CGRectZero];
        self.caiLable.text = @"踩（100）";
        [self.contentView addSubview:self.caiLable];
   
        
        self.pinglunLable = [[UILabel alloc]initWithFrame:CGRectZero];
        self.pinglunLable.text = @"评论（100）";
        [self.contentView addSubview:self.pinglunLable];
        
        self.lineLable = [[UILabel alloc]initWithFrame:CGRectZero];
        self.lineLable.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.lineLable];
        
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height;
    self.namelable.text = self.model.name;
    
    self.contentTV.text = self.model.content;
    
    CGSize size = [self getSize];
    
    self.contentTV.frame = CGRectMake(20, 55, size.width+10, size.height+10);
    
    self.caiLable.frame = CGRectMake(20, h-30, 100, 30);
    self.dingLable.frame = CGRectMake(w/2-50, h-30, 100, 30);
    self.pinglunLable.frame = CGRectMake(w-120, h-30, 100, 30);
    self.lineLable.frame=CGRectMake(0, self.frame.size.height-1, self.frame.size.width, 0.5f);
}

-(CGSize)getSize{
    CGSize size = [self.model.content boundingRectWithSize:CGSizeMake(self.frame.size.width-40, 999) options:NSStringDrawingUsesLineFragmentOrigin  attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size;
    return size;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
