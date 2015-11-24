//
//  EquipmentForReservation.swift
//  Banquet Helper
//
//  Created by LEA NATHAN H on 11/23/15.
//  Copyright © 2015 Okstate. All rights reserved.
//

import Foundation

class EquipmentForReservation : BaseModel {
    var Id : Int?
    var ReservationId: Int?
    var Name : String?
    var Quantity : Int?
    var PricePerUnit : Double?
    
    
    init(jsonObject: NSDictionary) {
        self.Id = jsonObject["Id"]?.integerValue
        self.ReservationId = jsonObject["ReservationId"]?.integerValue
        self.Name = jsonObject["Name"] as? String
        self.Quantity = jsonObject["Quantity"]?.integerValue
        self.PricePerUnit = jsonObject["PricePerUnit"]?.doubleValue
    }
    
    init(id: Int, reservationId: Int, name: String, quantity: Int, pricePerUnit: Double) {
        self.Id = id
        self.ReservationId = reservationId
        self.Name = name
        self.Quantity = quantity
        self.PricePerUnit = pricePerUnit
    }
    
    init () {
        
    }
    
    func getEquipmentUrlString()->String{
        return "https://cs.okstate.edu/~kevinda/hotels.php/apps15blue/LBGam/apps15blue/"+Table.Name.AvailableEquipment.rawValue
    }
    
    func getTableName()->Table.Name{
        return Table.Name.AvailableEquipment
    }
}