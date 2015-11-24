//
//  CateringModel.swift
//  Banquet Helper
//
//  Created by LEA NATHAN H on 11/23/15.
//  Copyright © 2015 Okstate. All rights reserved.
//

import UIKit

class CateringModel : BaseModel {
    var Id: Int?
    var FoodOption: String?
    var FoodAdditionalNotes: String?
    var AlcoholAdditionalNotes: String?
    var AlcoholChoice: String?
    
    
    init(jsonObject: NSDictionary) {
        self.Id = jsonObject["Id"]?.integerValue
        self.FoodOption = jsonObject["FoodOption"] as? String
        self.FoodAdditionalNotes = jsonObject["FoodAdditionalNotes"] as? String
        self.AlcoholAdditionalNotes = jsonObject["AlcoholAdditionalNotes"] as? String
        self.AlcoholChoice = jsonObject["AlcoholChoice"] as? String
    }
    
    init() {
        
    }
}
