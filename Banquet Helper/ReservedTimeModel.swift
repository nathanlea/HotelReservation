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
    
    init(id: Int, roomId: Int, reservationTime: String, customerId : Int)
    {
        self.Id = id
        self.RoomId = roomId
        self.ReservedTime = reservationTime
        self.CustomerId = customerId
    }
    
    func getJsonString()->String{
        return "{\"RoomId\" : \"\(self.RoomId!)\", \"CustomerId\" : \"\(self.CustomerId!)\", \"ReservationStatus\" : \"\(3)\", \"ReservedTime\" : \"\(self.ReservedTime!)\"}"
    }
    
    func getReservationUrlString()->String{
        return "https://cs.okstate.edu/~kevinda/getCustomerInfo.php/apps15blue/LBGam/apps15blue/"+Table.Name.RoomReservation.rawValue
    }
    func setReservationUrlString()->String{
        return "https://cs.okstate.edu/~kevinda/reserve.php/apps15blue/LBGam/apps15blue/"
    }
    func getTableName()->Table.Name{
        return Table.Name.RoomReservation
    }
    
}