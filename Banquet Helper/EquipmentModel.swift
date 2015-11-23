//
//  EquipmentModel.swift
//  Banquet Helper
//
//  Created by KEVIN ANGEL on 11/23/15.
//  Copyright © 2015 Okstate. All rights reserved.
//

import Foundation

class EquipmentModel : BaseModel {
var Id : Int?
var Name : String?
var PricePerUnit : Double?


init(jsonObject: NSDictionary) {
    self.Id = jsonObject["Id"]?.integerValue
    self.Name = jsonObject["Name"] as? String
    self.PricePerUnit = jsonObject["PricePerUnit"]?.doubleValue
}



func getEquipmentUrlString()->String{
    return "https://cs.okstate.edu/~kevinda/hotels.php/apps15blue/LBGam/apps15blue/"+Table.Name.AvailableEquipment.rawValue
}

func getTableName()->Table.Name{
    return Table.Name.AvailableEquipment
}
}