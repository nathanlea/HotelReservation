//
//  MeetingRoomModel.swift
//  Banquet Helper
//
//  Created by KEVIN ANGEL on 11/16/15.
//  Copyright © 2015 Okstate. All rights reserved.
//

import Foundation

class MeetingRoomModel : BaseModel {
    var delegate : BaseModel?
    var Area: Int?
    var Id: Int?
    var HotelId: Int?
    var RoomName: String?
    var BanquetCapacity: Int?
    var ReceptionCapacity: Int?
    var ConferenceCapacity: Int?
    var ClassRoomCapacity: Int?
    var ImageString: String?
    var MaxCapacity: Int?
    var UShapeCapacity: Int?
    var TheaterCapacity: Int?
    var CostPerHour : Double?
    var RoomDescription: String?
    
    init(jsonObject: NSDictionary) {
        self.Area = jsonObject["Area"]?.integerValue
        self.Id = jsonObject["Id"]?.integerValue
        self.ImageString = jsonObject["ImageString"] as? String
        self.HotelId = jsonObject["HotelId"]?.integerValue
        self.RoomName = jsonObject["RoomName"] as? String
        self.BanquetCapacity = jsonObject["BanquetCapacity"]?.integerValue
        self.ReceptionCapacity = jsonObject["ReceptionCapacity"]?.integerValue
        self.ConferenceCapacity = jsonObject["ConferenceCapacity"]?.integerValue
        self.ClassRoomCapacity = jsonObject["ClassRoomCapacity"]?.integerValue
        self.MaxCapacity = jsonObject["MaxCapacity"]?.integerValue
        self.UShapeCapacity = jsonObject["UShapeCapacity"]?.integerValue
        self.TheaterCapacity = jsonObject["TheaterCapacity"]?.integerValue
        self.CostPerHour = jsonObject["CostPerHour"]?.doubleValue
        self.RoomDescription = jsonObject["RoomDescription"] as? String
        
    }
    
    func getSingleMeetingRoomJsonString()->String{
        
        return "{\"Table\" : \"MeetingRooms\",  \"Id\" : \"\(self.Id!)\"}"
    }
    
    init() {}
    
}