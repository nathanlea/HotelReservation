//
//  DataTypeExtensions.swift
//  Banquet Helper
//
//  Created by KEVIN ANGEL on 11/21/15.
//  Copyright © 2015 Okstate. All rights reserved.
//

import Foundation


extension Double {
    func formatToMoneyPrecision()->String{
        return String(NSString(format: "%.2f", self))
    }
}

extension NSDate{
    func convertToSqlDateTime()->String{
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.stringFromDate(self)
    }
    
}

extension String{
    func convertFromSqlToNSDate()->NSDate{
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.dateFromString(self)!
    }
}