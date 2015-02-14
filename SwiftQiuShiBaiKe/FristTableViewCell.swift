//
//  FristTableViewCell.swift
//  SwiftQiuShiBaiKe
//
//  Created by 邢现庆 on 15-2-11.
//  Copyright (c) 2015年 邢现庆. All rights reserved.
//

import UIKit

class FristTableViewCell: UITableViewCell {

    var data : NSDictionary!
      @IBOutlet var nameLabel:UILabel?
    
     var contentTV: UITextView!
    
    @IBOutlet weak var headerImg: UIImageView!

     var contentImg: UIImageView!
     var dingLable: UILabel!
     var pinglunlable: UILabel!
    
     var caiLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.contentTV = UITextView(frame: CGRectZero)
        self.contentTV.selectable = false
        self.contentTV.editable = false
        self.contentTV.font=UIFont.systemFontOfSize(14)
        self.contentTV.scrollEnabled = false
        self.contentView.addSubview(self.contentTV)
        
//        self.contentImg = UIImageView(frame: CGRectZero)
//        self.contentView.addSubview(self.contentImg)
        
        self.dingLable = UILabel(frame: CGRectZero)
        self.dingLable.text = "顶（100）"
        self.contentView.addSubview(self.dingLable)
        
        self.caiLable = UILabel(frame: CGRectZero)
        self.caiLable.text = "踩（100）"
        self.contentView.addSubview(self.caiLable)
        
        self.pinglunlable = UILabel(frame: CGRectZero)
        self.pinglunlable.text = "评论（100）"
        self.contentView.addSubview(self.pinglunlable)
        
        
    }
    
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        //昵称
        var user : AnyObject!  = self.data["user"]
        if user as NSObject != NSNull()
        {
            var userDict = user as NSDictionary
            self.nameLabel!.text = userDict["login"] as NSString
            
            self.headerImg!.image =  UIImage(named: "avatar.jpg")
           
        }
        else
        {
            self.nameLabel!.text = "匿名"
            self.headerImg!.image =  UIImage(named: "avatar.jpg")
            
        }
        
        
        //内容
        var content = self.data["content"]? as NSString
        
        var size = self.getSize(content)
        
        self.contentTV.frame = CGRectMake(20, 60, UIScreen.mainScreen().bounds.width-40,size.height+10)
       
        self.contentTV.text = content
        
        self.caiLable.frame = CGRectMake(20, self.frame.size.height-30, 100, 30)
        self.dingLable.frame = CGRectMake(self.frame.size.width/2-50, self.frame.size.height-30, 100, 30)
        self.pinglunlable.frame = CGRectMake(self.frame.size.width-120, self.frame.size.height-30, 100, 30)
        
        
        
        
    }
    //计算size
    func getSize(content:NSString)->CGSize{
        var font = UIFont.systemFontOfSize(14)
        var  attributes = [NSFontAttributeName:font,]
        let size = content.boundingRectWithSize(CGSizeMake(UIScreen.mainScreen().bounds.width-60, 999), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: attributes, context: nil).size
        
        return size
    
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
