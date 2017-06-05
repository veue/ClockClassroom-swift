//
//  SchoolModel.swift
//  ClockClassroom
//
//  Created by YUYUNPENG on 2017/6/5.
//  Copyright © 2017年 YUYUNPENG. All rights reserved.
//

import ObjectMapper

class SchoolModel: Mappable {
    
    var address : String?
    var can_schedule : String?
    var cate : String?
    var confirm_type : String?
    var course_recommend : String?
    var end_time : String?
    var id : String?
    var instruction : String?
    var is_test : String?
    var lat_g : String?
    var lng_g : String?
    var name : String?
    var phone : String?
    var pic_big : String?
    var pic_small : String?
    var room_type : String?
    var school_type : String?
    var tags : String?
    var teacher_recommend : String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        address <- map["address"]
        can_schedule <- map["can_schedule"]
        cate <- map["cate"]
        confirm_type <- map["confirm_type"]
        course_recommend <- map["course_recommend"]
        id <- map["id"]
        instruction <- map["instruction"]
        is_test <- map["is_test"]
        lat_g <- map["lat_g"]
        lng_g <- map["lng_g"]
        name <- map["name"]
        phone <- map["phone"]
        pic_big <- map["pic_big"]
        pic_small <- map["pic_small"]
        room_type <- map["room_type"]
        school_type <- map["school_type"]
        tags <- map["tags"]
        teacher_recommend <- map["teacher_recommend"]

    }
}

