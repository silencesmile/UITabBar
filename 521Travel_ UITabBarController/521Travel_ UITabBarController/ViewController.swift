//
//  ViewController.swift
//  521Travel_ UITabBarController
//
//  Created by youngstar on 16/11/4.
//  Copyright © 2016年 521Travel.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITabBarDelegate {
    
    // TabBar控件
    var tabBar:UITabBar!
    
    // 创建TabBar数组
    var tabs = ["首页", "个人中心", "更多"]
    var images = ["aa", "bb", "cc"]
    var selectedImages = ["eee", "fff", "ggg"]
    
    
    
    // TabBar上方的容器
    var contentView:UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tabBar = UITabBar.init(frame: CGRect(x:0, y:667-64, width:375, height:44))
        var items:[UITabBarItem] = []
        
        for i in 0..<3 {
            print(i)
            
            let tabItem = UITabBarItem()
            tabItem.title = tabs[i]
            // 改变图片 保证图片不失真
            let image = UIImage(named:images[i])?.withRenderingMode(.alwaysOriginal)
            let selectedImage = UIImage(named:selectedImages[i])?.withRenderingMode(.alwaysOriginal)
            tabItem.image = image
            tabItem .selectedImage = selectedImage
            items.append(tabItem)
            
        }
        
        // 设置标签页
        tabBar.setItems(items, animated: true)
        
        // 本类实现UITabBarDelegate代理，切换标签页时能响应事件
        tabBar.delegate = self
        self.view .addSubview(tabBar)
        
        // 上方容器
        contentView = UIView.init(frame: CGRect(x:0, y:0, width:375, height:667-44))
        self.view .addSubview(contentView)
        
        let label = UILabel.init(frame: CGRect(x:100, y:200, width:100, height:20))
        label.text = "首页"
        // 定义tag
        label.tag = 101
        contentView.addSubview(label)
        
        // 默认选中的item
        tabBar.selectedItem = items[0]
        
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item.title as Any)
        //通过tag查询到上方容器的label，并设置为当前选择的标签页的名称
      (contentView.viewWithTag(101) as! UILabel).text = item.title
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

