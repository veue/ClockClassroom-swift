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
        
        self.tableView.frame = CGRect(x:0 , y: 0, width:kScreenWidth , height: kScreenHeight)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 80
        self.view.addSubview(self.tableView)
        self.tableView.register(UINib(nibName: "YYPOrderClassCell", bundle: nil), forCellReuseIdentifier: "orderclasscell")

        
        let urlString = "\(JavaUrl)/dubboServiceConsumer/v2.6/school/findSchool.action"
        let dict = ["is_ios":"1","is_test":"1"]
        
        YYPRequestManager.sharedInstance.postRequest(urlString: urlString, parameters:dict, success: { (result) in
//            print("------------\(result)")
            let schools = result["obj"]?["flagship"]
            self.schoolArray =  Mapper<SchoolModel>().mapArray(JSONArray: schools as! [[String : Any]])!
            self.tableView.reloadData()
            
        }) { (Error) in
            print("====\(Error)")
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.schoolArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellid = "orderclasscell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid) as! YYPOrderClassCell
        
        let model = self.schoolArray[indexPath.row] as! SchoolModel
        cell.resetCellWith(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
