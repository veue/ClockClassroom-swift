//
//  YYPUtils.swift
//  ClockClassroom
//
//  Created by YUYUNPENG on 2017/6/2.
//  Copyright © 2017年 YUYUNPENG. All rights reserved.
//

import UIKit
import Foundation

let kScreenWidth = UIScreen.main.bounds.width
let kScreenHeight = UIScreen.main.bounds.height

func x(object : UIView) -> CGFloat {
    return object.frame.origin.x
}

func y(object : UIView) -> CGFloat {
    return object.frame.origin.y
}

func width(object : UIView) -> CGFloat {
    return object.bounds.width
}

func height(object : UIView) -> CGFloat {
    return object.bounds.height
}
