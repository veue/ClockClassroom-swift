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

let BaseUrl = "https://api.51shizhong.com/api_v9/"
let H5BaseUrl = "http://api.51shizhong.com"
let BasePicUrl = "http://i.upload.file.dc.cric.com/"
let JavaUrl = "https://api2.51shizhong.com"

let KVersion = "api_v9"
let KVersionH = "h5_v12"
let CCAppVersion = "v2.6"

private let YYPRequestShareInstance = YYPRequestManager()

class YYPRequestManager: NSObject {
    class var sharedInstance : YYPRequestManager {
        return YYPRequestShareInstance
    }
}

extension YYPRequestManager {
    func getRequest(urlString : String, parameters : [String : Any], success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()) {
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
    
    func postRequest(urlString : String, parameters : [String : Any], success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()) {
        Alamofire.request(urlString, method: .post, parameters: [:], encoding: JSONEncoding.default).responseJSON { response in
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

