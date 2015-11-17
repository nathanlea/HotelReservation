//
//  userAccount.swift
//  Hotel 2
//
//  Created by GLYNN DERRIAN V on 11/5/15.
//  Copyright © 2015 GLYNN DERRIAN V. All rights reserved.
//

import Foundation
import UIKit

class userAccount: NSObject, NSCoding {
// MARK: Properties
    
    var name: String
    var number: String
    var email: String
    var password: String
    
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("userInfo")
    
    struct PropertyKey {
        static let nameKey = "name"
        static let numberKey = "number"
        static let emailKey = "email"
        static let passwordKey = "password"
        
    }
    // MARK: Initialization
    
    init?(name: String, number: String, email: String, password: String) {
        // Initialize stored properties.
        self.name = name
        self.email = email
        self.number = number
        self.password = password
        
        super.init()
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || password.isEmpty {
            return nil
        }
    }
    // MARK: NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(number, forKey: PropertyKey.numberKey)
        aCoder.encodeObject(email, forKey: PropertyKey.emailKey)
        aCoder.encodeObject(password, forKey: PropertyKey.passwordKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder)
    {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let number = aDecoder.decodeObjectForKey(PropertyKey.numberKey) as! String
        let email = aDecoder.decodeObjectForKey(PropertyKey.emailKey) as! String
        let password = aDecoder.decodeObjectForKey(PropertyKey.passwordKey) as! String
        
        
        // Must call designated initializer.
        self.init(name: name, number: number, email: email, password: password )
    }


}