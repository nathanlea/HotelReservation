//
//  CustomerModel.swift
//  Marriot_app
//
//  Created by KEVIN ANGEL on 11/2/15.
//  Copyright © 2015 KEVIN ANGEL. All rights reserved.
//

import Foundation
class CustomerModel : BaseModel {
    var Id: Int?
    var FirstName: String?
    var LastName: String?
    var LoginId : String?
    var LoginPassword: String?
    var StreetAddress: String?
    var City: String?
    var State: String?
    var ZipCode: Int?
    
    init(){
        
    }
    
    init(jsonObject: NSDictionary) {
        self.Id = jsonObject["Id"]?.integerValue
        self.FirstName = jsonObject["FirstName"] as? String
        self.LastName = jsonObject["LastName"] as? String
        self.LoginId = jsonObject["LoginId"] as? String
        self.LoginPassword = jsonObject["LoginPassword"] as? String
        self.StreetAddress = jsonObject["StreetAddress"] as? String
        self.City = jsonObject["City"] as? String
        self.State = jsonObject["State"] as? String
        self.ZipCode = jsonObject["ZipCode"]?.integerValue
    }
}
