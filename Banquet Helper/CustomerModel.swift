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
    
    init(firstname: String, lastName : String, loginId: String, loginPassword : String, streetAddress: String, city: String, state: String, zipCode: Int ){
        self.FirstName = firstname
        self.LastName = lastName
        self.LoginId = loginId
        self.LoginPassword = loginPassword
        self.StreetAddress = streetAddress
        self.City = city
        self.State = state
        self.ZipCode = zipCode
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
    
    func setNewCustomerJsonString()->String{
        return "{\"FirstName\" : \"\(self.FirstName!)\", \"LastName\" : \"\(self.LastName!)\", \"LoginId\" : \"\(self.LoginId!)\", \"Password\" : \"\(self.LoginPassword!)\", \"StreetAddress\" : \"\(self.StreetAddress!)\", \"City\" : \"\(self.City!)\", \"State\" : \"\(self.State!)\", \"ZipCode\" : \"\(self.ZipCode!)\"}"
    }
    
    func getExistingCustomerJsonParameters(login : String, password: String)->String{
        return "LoginId = '\(login)' AND Password ='\(password)'"
    }
    
    func checkExistingCustomerLoginIdJsonParameters(login:String)->String{
        return "LoginId = '\(login)'"
    }
    
    func setNewCustomerUrlString()->String{
        return "https://cs.okstate.edu/~kevinda/addcustomer.php/apps15blue/LBGam/apps15blue/"+Table.Name.Customers.rawValue
    }
    func getTable()->Table.Name{
        return Table.Name.Customers
    }
}
