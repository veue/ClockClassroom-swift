//
//  CCTabbarController.swift
//  ClockClassroom
//
//  Created by YUYUNPENG on 2017/6/1.
//  Copyright © 2017年 YUYUNPENG. All rights reserved.
//

import UIKit

class YYPTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item1 = self.tabBar.items?.first
        item1?.image = UIImage.init(named: "orderClass_tabbar_deselect")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        item1?.selectedImage = UIImage.init(named: "orderClass_tabbar_select")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        let item2 = self.tabBar.items?[1]
        item2?.image = UIImage.init(named: "theme_tabbar_deselect")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        item2?.selectedImage = UIImage.init(named: "theme_tabbar_select")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        let item3 = self.tabBar.items?[2]
        item3?.image = UIImage.init(named: "experienceCourse_tabbar_deselect")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        item3?.selectedImage = UIImage.init(named: "experienceCourse_tabbar_select")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        for item in self.tabBar.items! {
            item.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.black], for: UIControlState.normal)
            item.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.green], for: UIControlState.selected)
        }
    }

}
