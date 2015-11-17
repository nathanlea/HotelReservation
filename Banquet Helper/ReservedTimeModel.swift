//
//  ReservedTimeModel.swift
//  Marriot_app
//
//  Created by KEVIN ANGEL on 10/31/15.
//  Copyright © 2015 KEVIN ANGEL. All rights reserved.
//

import UIKit

class ReservedTimeModel : BaseModel{
    var Id : Int?
    var RoomId : Int?
    var ReservedTime : String?
    var CustomerId : Int?
    
    func SetReservationTime(meetingRoomModel: MeetingRoomModel, date: String, customerModel : CustomerModel){
        //let dateFormatter = NSDateFormatter()
        RoomId = meetingRoomModel.Id
        ReservedTime = date
        CustomerId = customerModel.Id
        
        //let dateTime = String(date)
        
        //print(dateTime)
    }
    
    init(jsonObject: NSDictionary) {
        self.Id = jsonObject["Id"]?.integerValue
        self.RoomId = jsonObject["RoomId"]?.integerValue
        self.ReservedTime = jsonObject["ReservedTime"] as? String
        self.CustomerId = jsonObject["CustomerId"]?.integerValue
    }
    
}