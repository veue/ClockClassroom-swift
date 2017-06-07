//
//  OrderClassVC.swift
//  ClockClassroom
//
//  Created by YUYUNPENG on 2017/6/1.
//  Copyright © 2017年 YUYUNPENG. All rights reserved.
//

import UIKit
import ObjectMapper

class YYPOrderClassVC: UIViewController,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate {
    let tableView = UITableView.init(frame: CGRect.zero, style: .grouped)
    var schoolArray = Array<Any>()
    var headerSchoolArray = Array<Any>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        self.tableView.frame = CGRect(x:0 , y: 0, width:kScreenWidth , height: kScreenHeight)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 80
        self.view.addSubview(self.tableView)
        self.tableView.register(UINib(nibName: "YYPOrderClassCell", bundle: nil), forCellReuseIdentifier: "orderclasscell")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.loadData()
    }
    
    func loadData() -> Void {
        
        let urlString = "\(JavaUrl)/dubboServiceConsumer/v2.6/school/findSchool.action"
        let dict = ["is_ios":"1","is_test":"1"]
        
        YYPRequestManager.sharedInstance.postRequest(urlString: urlString, parameters:dict, success: { (result) in
            
            let schools = result["obj"]?["flagship"]
            self.schoolArray =  Mapper<SchoolModel>().mapArray(JSONArray: schools as! [[String : Any]])!
            self.configTableViewHeader()
            self.tableView.reloadData()
            
        }) { (Error) in
            print("====\(Error)")
        }
    }
    
    func configTableViewHeader() -> Void {
        self.tableView.tableHeaderView = nil
        
        self.headerSchoolArray = self.schoolArray
        self.headerSchoolArray.insert(self.schoolArray.last!, at: 0)
        self.headerSchoolArray.append(self.schoolArray.first!)
        
        let bgView = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenWidth*10.0/16.0 + 100))
        bgView.backgroundColor = UIColor.white
        let scrollView = UIScrollView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenWidth*10.0/16.0))
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: kScreenWidth * CGFloat(self.headerSchoolArray.count), height: kScreenWidth*10.0/16.0)
        scrollView.contentOffset = CGPoint(x: kScreenWidth, y: 0)
        bgView.addSubview(scrollView)
        for i in (0...self.headerSchoolArray.count - 1) {
            let imageView = UIImageView.init(frame: CGRect(x: kScreenWidth * CGFloat(i), y: 0, width: kScreenWidth, height: kScreenWidth*10.0/16.0))
            let model = self.headerSchoolArray[i] as! SchoolModel
            imageView.kf.setImage(with: URL.init(string: model.pic_big!))
            scrollView.addSubview(imageView)
        }
        
        let model = self.headerSchoolArray[1] as! SchoolModel
        
        let nameLabel = UILabel.init(frame: CGRect(x: 20, y: scrollView.bottom() + 15, width: 200, height: 20))
        nameLabel.font = UIFont.systemFont(ofSize: 18)
        nameLabel.tag = 100
        nameLabel.textColor = UIColor.black
        nameLabel.textAlignment = NSTextAlignment.left
        nameLabel.text = model.name
        bgView.addSubview(nameLabel)
        
        let addressLabel = UILabel.init(frame: CGRect(x: 20, y: nameLabel.bottom() + 5, width: kScreenWidth - 40, height: 20))
        addressLabel.font = UIFont.systemFont(ofSize: 13)
        addressLabel.tag = 101
        addressLabel.textColor = UIColor.gray
        addressLabel.textAlignment = NSTextAlignment.left
        addressLabel.text = "地址：\(model.address ?? "")"
        bgView.addSubview(addressLabel)
        
        let tagsLabel = UILabel.init(frame: CGRect(x: 20, y: addressLabel.bottom() + 5, width: kScreenWidth - 40, height: 20))
        tagsLabel.font = UIFont.systemFont(ofSize: 13)
        tagsLabel.tag = 102
        tagsLabel.textColor = UIColor.gray
        tagsLabel.textAlignment = NSTextAlignment.left
        tagsLabel.text = "\(model.tags ?? "")"
        bgView.addSubview(tagsLabel)
        
        
        self.tableView.tableHeaderView = bgView
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.schoolArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
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
    
//MARK: -  UIScrollViewDelegate
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.isKind(of: UITableView.self) {
            return
        }
        var index = scrollView.contentOffset.x/kScreenWidth
        if index == 0 {
            scrollView.contentOffset = CGPoint(x: kScreenWidth * CGFloat(self.headerSchoolArray.count - 2), y: 0)
        } else if index == CGFloat(self.headerSchoolArray.count - 1) {
            scrollView.contentOffset = CGPoint(x: kScreenWidth, y: 0)
        }
        
        index = scrollView.contentOffset.x/kScreenWidth
        
        let model = self.headerSchoolArray[Int(index)] as! SchoolModel
        
        var label = self.tableView.tableHeaderView?.viewWithTag(100) as! UILabel
        label.text = model.name
        
        label = self.tableView.tableHeaderView?.viewWithTag(101) as! UILabel
        label.text = "地址：\(model.address ?? "")"
        
        label = self.tableView.tableHeaderView?.viewWithTag(102) as! UILabel
        label.text = model.tags
    }
}
