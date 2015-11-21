//
//  HotelModel.swift
//  Marriot_app
//
//  Created by KEVIN ANGEL on 10/31/15.
//  Copyright © 2015 KEVIN ANGEL. All rights reserved.
//

import UIKit

class HotelModel : BaseModel {
    var Id: Int?
    var HotelName: String?
    var StreetAddress: String?
    var City: String?
    var State: String?
    var ZipCode: Int?
    var Descriptions: String?
    var ImageString: String?
    
    
    init(jsonObject: NSDictionary) {
        self.Id = jsonObject["Id"]?.integerValue
        self.ImageString = jsonObject["ImageString"] as? String
        self.HotelName = jsonObject["HotelName"] as? String
        self.StreetAddress = jsonObject["StreetAddress"] as? String
        self.City = jsonObject["City"] as? String
        self.State = jsonObject["State"] as? String
        self.ZipCode = jsonObject["ZipCode"]?.integerValue
    }
    
    
    
}