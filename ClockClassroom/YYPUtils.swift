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

extension UIView {
    public func x() -> CGFloat {
        return self.frame.origin.x
    }
    public func y() -> CGFloat {
        return self.frame.origin.y
    }
    public func width() -> CGFloat {
        return self.bounds.width
    }
    public func height() -> CGFloat {
        return self.bounds.height
    }
    public func right() -> CGFloat {
        return self.frame.origin.x + self.bounds.width
    }
    public func bottom() -> CGFloat {
        return self.frame.origin.y + self.bounds.height
    }
    public func centerX() -> CGFloat {
        return self.center.x
    }
    public func centerY() -> CGFloat {
        return self.center.y
    }

}







