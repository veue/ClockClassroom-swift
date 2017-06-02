//
//  YYPRequestManager.swift
//  ClockClassroom
//
//  Created by YUYUNPENG on 2017/6/2.
//  Copyright © 2017年 YUYUNPENG. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class YYPRequestManager: NSObject {
    
    let urlString = "https://api.51shizhong.com/api_v9/"
    
    func getRequest(parameters : [String : Any], success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()) {
        Alamofire.request(urlString, method: .get, parameters: [:], encoding: JSONEncoding.default).responseJSON { response in
                debugPrint(response)
            switch response.result
            {
                case .success:
                    if let value = response.result.value {
                        success(value as! [String : AnyObject])
                    }
                case .failure:
                    failture(response.result.error!)
            }
        }
    }
}
