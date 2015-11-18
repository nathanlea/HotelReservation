//
//  GetJSONObjects.swift
//  Marriot_app
//
//  Created by KEVIN ANGEL on 10/31/15.
//  Copyright © 2015 KEVIN ANGEL. All rights reserved.
//

import Foundation

class HotelRepository {
    
    var tableName : String?
    var delegate : BaseModel?
    
    
    func ConvertToModels(jsonObjects : NSArray, TableName : Table.Name)-> [Any]
    {
        var models = [Any]()
        for item in jsonObjects{
            
            switch(TableName){
            case Table.Name.Customers :
                models.append(CustomerModel(jsonObject: item as! NSDictionary))
                break
            case Table.Name.Hotels:
                models.append(HotelModel(jsonObject: item as! NSDictionary))
                break
            case Table.Name.MeetingRooms:
                models.append(MeetingRoomModel(jsonObject: item as! NSDictionary))
                break
            case Table.Name.ReservedTimes:
                models.append(ReservedTimeModel(jsonObject: item as! NSDictionary))
                break
                
            }
        }
        return models
    }
    
    func Get(TableName : Table.Name, completion: (jsonArray : NSArray) -> Void)
    {
        tableName = TableName.rawValue
        var jsonObjects = NSArray()
        
        let getUrl = "https://cs.okstate.edu/~kevinda/hotels.php/apps15blue/LBGam/apps15blue/"+tableName!
        guard let url = NSURL(string: getUrl) else
            
        {print("Error: cannot create URL")
            return}
        let urlRequest = NSURLRequest(URL: url)
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)
        let task = session.dataTaskWithRequest(urlRequest){(data, response, error) in
            guard let resultData = data
                else
            {
                print("Error: Did not receive data")
                return}
            guard error == nil else
            {
                print("Error making call")
                print(error)
                return
            }
            
            do
            {
                jsonObjects =
                    try (NSJSONSerialization.JSONObjectWithData(resultData, options: []) as? NSArray)!
                
                completion(jsonArray: jsonObjects)
                
                
            }
            catch
            {
                print("Error trying to convert returned data to JSON")
                return
            }
            //print("The returned data for Table "+TableName.rawValue+": \(jsonObjects.description)")
            
            
            
            
        }
        
        
        
        task.resume()
        
    }
    
    
    func SetReservation(meetingRoomId : Int, customerId : Int, dateTime : String)
    {
        
        let setUrl = "https://cs.okstate.edu/~kevinda/reserve.php/apps15blue/LBGam/apps15blue/"+Table.Name.ReservedTimes.rawValue
        guard let url = NSURL(string: setUrl) else
            
        {print("Error: cannot create URL")
            return}
        let urlRequest = NSMutableURLRequest(URL: url)
        
        let jsonString = "{\"RoomId\":\" \(meetingRoomId)\",\"CustomerId\":\" \(customerId) \",\"ReservedTime\":\" \(dateTime) \"}"
        urlRequest.HTTPBody = jsonString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        urlRequest.HTTPMethod = "POST"
        urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)
        let task = session.dataTaskWithRequest(urlRequest){(data, response, error) in
            guard let resultData = data
                else
            {
                print("Error: Did not receive data")
                return}
            guard error == nil else
            {
                print("Error making call")
                print(error)
                return
            }
            
            do
            {
                
                var jsonObjects =
                try (NSJSONSerialization.JSONObjectWithData(resultData, options: []) as? NSArray)!
                print(jsonObjects.description)
                
            }
            catch
            {
                print("Error trying to convert returned data to JSON")
                return
            }
            print("The returned data is \(response)")
            
        }
        task.resume()
    }
    
    
    
    
    
    
}