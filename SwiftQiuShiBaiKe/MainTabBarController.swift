//
//  MainTabBarController.swift
//  SwiftQiuShiBaiKe
//
//  Created by 邢现庆 on 15-2-11.
//  Copyright (c) 2015年 邢现庆. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    let itemArray = ["最新","热门","关于"]
    
    let tabbarGroud = ["zuixin","remen","gengduo"]
    
    let tabbarGroudHeight = ["zuixin2","remen2","gengduo2"];
    
    let ScreenHeight = UIScreen.mainScreen().bounds.height
    
    let ScreenWidth = UIScreen.mainScreen().bounds.width
    
    var tabView : UIView?

    var lables : NSMutableArray?
    
    var buttons : NSMutableArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lables = NSMutableArray()
        self.buttons = NSMutableArray()
        
        self.initTabBar()
        self.initViewControllers()
        self.selectTabAtIndex(0)
        
    }

    
    func initTabBar(){
        self.tabBar.hidden=true
        
        self.tabView = UIView(frame: CGRectMake(0, ScreenHeight-49, ScreenWidth, 49))
        
        self.tabView?.backgroundColor=UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0)
        
        for (var i=0; i < self.itemArray.count;i++) {
            
            let groud = self.tabbarGroud[i];
            
            let groudHeight = self.tabbarGroudHeight[i];
            
            var button = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
            
            button.tag = i
            
            button.setImage(UIImage(named: groud), forState: UIControlState.Normal)
            
            button.setImage(UIImage(named: groudHeight), forState: UIControlState.Selected)
            button.showsTouchWhenHighlighted=true;//点击按钮 亮光
            
            button.addTarget(self, action: "clickTabBar:", forControlEvents: UIControlEvents.TouchUpInside)

            let  w = ScreenWidth/3
            
            button.frame = CGRectMake(CGFloat(i * (Int(w))) ,5,ScreenWidth/3,28)
            self.buttons?.addObject(button)
            self.tabView?.addSubview(button)
            
            var lable = UILabel(frame: CGRectMake(CGFloat(i * (Int(w))) ,32,ScreenWidth/3,20))
            lable.tag = i
            lable.text = self.itemArray[i]
            lable.textColor=UIColor.grayColor()
            lable.font = UIFont.systemFontOfSize(12)
            lable.textAlignment = NSTextAlignment.Center
            self.lables?.addObject(lable)
            self.tabView?.addSubview(lable)
        }
        self.view.addSubview(self.tabView!)
    }
    
    
    
    func initViewControllers()
    {
        var vc1 = FristViewController(nibName: "FristViewController", bundle: nil)
        
        var nav1 = UINavigationController(rootViewController: vc1)
        
        var vc2 = SecendViewController(nibName: "SecendViewController", bundle: nil)
        var nav2 = UINavigationController(rootViewController: vc2)
        
        var vc3 = MoreViewController (nibName: "MoreViewController", bundle: nil)
        var nav3 = UINavigationController(rootViewController: vc3)

        self.viewControllers = [nav1,nav2,nav3]
    }

    func clickTabBar(sender:UIButton){
        let index = sender.tag
        self.selectTabAtIndex(index)
        
    }
    
    func selectTabAtIndex(index : Int){
        self.selectedIndex=index;
        for (var i = 0; i < 3; i++){
            var b = self.buttons![i] as UIButton
            b.selected = false;
            b.userInteractionEnabled = true;
            var lable = self.lables![i] as UILabel
            lable.textColor = UIColor.grayColor()
        }
        var lable = self.lables![index] as UILabel
        lable.textColor=UIColor.redColor()
        var btn = self.buttons![index] as UIButton
        btn.selected = true
        btn.userInteractionEnabled = false
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    
}
