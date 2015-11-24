//
//  EventPlannerModel.swift
//  Banquet Helper
//
//  Created by LEA NATHAN H on 11/24/15.
//  Copyright © 2015 Okstate. All rights reserved.
//

import UIKit
import CVCalendar

class EventPlannerModel : BaseModel {
    var Id: Int?
    var EventPlanner: String?
    var Date: CVDate?
    var Time: String?
    
    
    init(jsonObject: NSDictionary) {
        self.Id = jsonObject["Id"]?.integerValue
        self.EventPlanner = jsonObject["EventPlanner"] as? String
        //self.Date = jsonObject["Date"] as? NSDate
        self.Time = jsonObject["Time"] as? String
    }
    
    init() {
        
    }
    
    init(eventPlanner: String, date : CVDate, time: String) {
        self.EventPlanner = eventPlanner
        self.Date = date
        self.Time = time
    }
}
