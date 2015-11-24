//
//  ReservationPackage.swift
//  Banquet Helper
//
//  Created by Connor Eaves on 11/22/15.
//  Copyright © 2015 Okstate. All rights reserved.
//

import UIKit

class ReservationPackage {

    var dateOfEvent: NSDate?
    var startTime: NSDate?
    var endTime: NSDate?
    var eventType: String?
    var headCount: Int?
    
    init () {
        dateOfEvent = NSDate()
        startTime = NSDate()
        endTime = NSDate()
        eventType = ""
        headCount = 0
    }
    
    func containsRequiredFields() -> Bool {
        if let _ = dateOfEvent {
            if let _ = startTime {
                if let _ = endTime {
                    if let _ = eventType {
                        if let _ = headCount {
                            return true
                        }
                    }
                }
            }
        }
        return false
    }

}
