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
            case Table.Name.RoomReservation:
                models.append(ReservedTimeModel(jsonObject: item as! NSDictionary))
                break
            default:
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
                completion(jsonArray: jsonObjects)
                return
            }
            //print("The returned data for Table "+TableName.rawValue+": \(jsonObjects.description)")
            
            
            
            
        }
        
        
        
        task.resume()
        
    }
    func GetSpecific(table: Table.Name, parameters: String , completion: (jsonArray : NSDictionary) -> Void)
    {
        
        var jsonObjects = NSDictionary()
        let setUrl = "https://cs.okstate.edu/~kevinda/getwhere.php/apps15blue/LBGam/apps15blue"
        guard let url = NSURL(string: setUrl) else
            
        {print("Error: cannot create URL")
            return}
        let urlRequest = NSMutableURLRequest(URL: url)
        let jsonString = "{\"Table\" : \"\(table.rawValue)\",  \"Parameters\" : \"\(parameters)\"}"
        print(jsonString)
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
                jsonObjects =
                    try (NSJSONSerialization.JSONObjectWithData(resultData, options: []) as? NSDictionary)!
                
                completion(jsonArray: jsonObjects)
                
                
            }
            catch
            {
                
                print("Error trying to convert returned data to JSON")
                completion(jsonArray: jsonObjects)
            }
            //print("The returned data for Table "+TableName.rawValue+": \(jsonObjects.description)")
            
            
            
            
        }
        
        
        
        task.resume()
        
    }
    
    
    func addToDataBase(jsonString : String, urlString: String, completion: (successMessage: Bool) -> Void )
    {
        guard let url = NSURL(string: urlString) else
            
        {print("Error: cannot create URL")
            return}
        let urlRequest = NSMutableURLRequest(URL: url)
        
        
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
                
                completion(successMessage: true)
                
                
            }
            catch
            {
                print("Error trying to convert returned data to JSON")
                completion(successMessage: false)
            }
            let encodedData = String(data: data!, encoding: NSUTF8StringEncoding)
            print("The returned data is \(encodedData)")
            //print("The returned data is \(response)")
            
        }
        task.resume()
    }
    
    
    
    
    
    
    
}