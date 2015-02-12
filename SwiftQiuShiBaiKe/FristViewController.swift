//
//  FristViewController.swift
//  SwiftQiuShiBaiKe
//
//  Created by 邢现庆 on 15-2-11.
//  Copyright (c) 2015年 邢现庆. All rights reserved.
//

import UIKit

class FristViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource,YRRefreshViewDelegate{

    var page = 1
    
    var listArray = NSMutableArray()
    
    var tableView:UITableView?
    
    var refreshView:YRRefreshView?
    
    var timer: NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "最新"
        var width = self.view.frame.size.width
        var height = self.view.frame.size.height
        self.tableView = UITableView(frame:CGRectMake(0,0,width,height))
        
        self.tableView!.delegate = self;
        self.tableView!.dataSource = self;
        
        var arr =  NSBundle.mainBundle().loadNibNamed("YRRefreshView" ,owner: self, options: nil) as Array
        self.refreshView = arr[0] as? YRRefreshView
        self.refreshView!.delegate = self
        self.tableView!.tableFooterView = self.refreshView
        var nib = UINib(nibName:"FristTableViewCell", bundle: nil)
        self.tableView?.registerNib(nib, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView!)
        
       
       
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: "runTimer", userInfo: nil, repeats: true)
        
        self.loadData()
    }
    func runTimer(){
        var i = arc4random()%3+1
        if i == 1 {
            self.title = "加载中."
        }
        if i == 2 {
            self.title = "加载中.."
        }
        if i == 3 {
            self.title = "加载中..."
        }
        
    }
    
    func refreshView(refreshView:YRRefreshView,didClickButton btn:UIButton)
    {
        self.page++
        loadData()
    }
    
    func loadData(){
        
        YRHttpRequest.requestWithURL("http://m2.qiushibaike.com/article/list/suggest?count=20&page=\(page)", completionHandler: { (data)  in
            
            println("\(data)")
            
            self.title = "最新"
            
            self.timer?.invalidate()
            
            if data as NSObject == NSNull(){
                
                let alert =  UIAlertView(title: "提示", message: "加载失败", delegate: nil, cancelButtonTitle: "确定")
                
                alert.show()
                return
            }
            var arr = data["items"] as NSArray
            
            for data : AnyObject  in arr
            {
                self.listArray.addObject(data)
            }

            self.tableView?.reloadData()
            
            
        })
        
    }
    
    //TableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    
        return self.listArray.count
    
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as FristTableViewCell
        var index = indexPath.row
        var data = self.listArray[index] as NSDictionary
        cell.data = data
        return cell

    
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var index = indexPath.row
        var data = self.listArray[index] as NSDictionary
        var content = data["content"] as NSString
        var size = self.getSize(content)
        return size.height+130
    }
    //计算size
    func getSize(content:NSString)->CGSize{
        var font = UIFont.systemFontOfSize(14)
        var  attributes = [NSFontAttributeName:font,]
        let size = content.boundingRectWithSize(CGSizeMake(UIScreen.mainScreen().bounds.width-60, 999), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: attributes, context: nil).size
        
        return size
        
    }
    //TableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
