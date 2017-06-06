//
//  YYPOrderClassCell.swift
//  ClockClassroom
//
//  Created by YUYUNPENG on 2017/6/6.
//  Copyright © 2017年 YUYUNPENG. All rights reserved.
//

import UIKit
import Kingfisher

class YYPOrderClassCell: UITableViewCell {

    @IBOutlet weak var tipsImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var distanceButton: UIButton!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var storeImageView: UIImageView!
    @IBOutlet weak var willReserveLAbel: UILabel!
    @IBOutlet weak var nameLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var cover: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func resetCellWith(model : SchoolModel) -> Void {
        self.nameLabel.text = model.name
        self.tagsLabel.text = model.tags
        self.distanceButton.setTitle("1KM", for: UIControlState.normal)
        self.addressLabel.text = model.address
        self.storeImageView.kf.setImage(with: URL.init(string: model.pic_small!), placeholder: UIImage.init(named: "placeHolder4v3"), options: nil, progressBlock: nil, completionHandler: nil)
    }

}
