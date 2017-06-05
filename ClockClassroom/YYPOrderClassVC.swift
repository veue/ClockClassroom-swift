//
//  OrderClassVC.swift
//  ClockClassroom
//
//  Created by YUYUNPENG on 2017/6/1.
//  Copyright © 2017年 YUYUNPENG. All rights reserved.
//

import UIKit
import ObjectMapper

class YYPOrderClassVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let tableView = UITableView()
    var schoolArray = Array<Any>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        tableView.frame = CGRect(x:0 , y: 0, width:kScreenWidth , height: kScreenHeight)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        let urlString = "\(JavaUrl)/dubboServiceConsumer/v2.6/school/findSchool.action"
        let dict = ["is_ios":"1","is_test":"1"]
        
        YYPRequestManager.sharedInstance.postRequest(urlString: urlString, parameters:dict, success: { (result) in
//            print("------------\(result)")
            let schools = result["obj"]?["flagship"]
            self.schoolArray =  Mapper<SchoolModel>().mapArray(JSONArray: schools as! [[String : Any]])!
            
            let model = self.schoolArray[0] as! SchoolModel
            
            print(model.address as Any)
            
        }) { (Error) in
            print("====\(Error)")
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "cellid"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
        if (cell == nil) {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: cellid)
        }
        return cell!
    }

}
