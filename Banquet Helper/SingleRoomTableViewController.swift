//
//  SingleRoomTableViewController.swift
//  Banquet Helper
//
//  Created by KEVIN ANGEL on 11/22/15.
//  Copyright © 2015 Okstate. All rights reserved.
//

import UIKit

class SingleRoomTableViewController: UITableViewController {
    internal var customerModel : CustomerModel?
    internal var reservationFullModel : ReservationFullModel?
    internal var hotelModel : HotelModel?
    internal var meetingRoomModel :MeetingRoomModel?
    var equipmentModels = [EquipmentModel]()
    var genericArray = [Any]()
    let repository = HotelRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Customer Test: \(customerModel?.FirstName), \(customerModel?.LastName), \(hotelModel?.HotelName), \(meetingRoomModel?.RoomName)")
    
        
        self.title = meetingRoomModel?.RoomName
        repository.Get(Table.Name.AvailableEquipment){
            (jsonObjects: NSArray) in
            
            self.genericArray = self.repository.ConvertToModels(jsonObjects, TableName: Table.Name.AvailableEquipment)
            for genericType in self.genericArray{
                self.equipmentModels.append(genericType as! EquipmentModel)
            }
            
            let seconds = 0.1
            let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
            let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            
            dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                self.tableView.reloadData()
            })
            
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        if(meetingRoomModel != nil){
            switch(indexPath.row)
            {
            case 0:
                let cell = tableView.dequeueReusableCellWithIdentifier("PictureCell") as! GenericHotelListCell
                cell.DetailLabel.text = "$"+Int(meetingRoomModel!.CostPerHour!).description+"/hr"
                cell.backgroundView = UIImageView.init(image: UIImage(named: meetingRoomModel!.ImageString!))
                tableView.rowHeight = 450
                return cell
            case 1:
                let cell = tableView.dequeueReusableCellWithIdentifier("RoomDescriptionCell") as! GenericHotelListCell
                cell.DetailLabel.text = meetingRoomModel!.RoomDescription
                tableView.rowHeight = 340
                return cell
            case 2:
                let cell = tableView.dequeueReusableCellWithIdentifier("OccupancyCell") as! GenericHotelListCell
                cell.DetailLabel.text = meetingRoomModel!.MaxCapacity!.description
                tableView.rowHeight = 60
                return cell
            case 3:
                let cell = tableView.dequeueReusableCellWithIdentifier("EquipmentAvailableCell") as! GenericHotelListCell
                if(equipmentModels.count>0){
                    cell.DetailLabel.text = equipmentModels[0].Name!
                    for(var i=1; i<equipmentModels.count; i++){
                        cell.DetailLabel.text!+="\n\(equipmentModels[i].Name!)"
                    }
                    cell.DetailLabel.sizeToFit()
                    tableView.rowHeight = 340
                    
                }
                cell.MoreDetailsIfNeeded.text = meetingRoomModel!.Area!.description+" Ft."
                return cell
            default:
                let cell = tableView.dequeueReusableCellWithIdentifier("OccupancyCell")
                return cell!
                
            }
        }
        let cell = tableView.dequeueReusableCellWithIdentifier("OccupancyCell")
        return cell!
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destVC = segue.destinationViewController as! ReservationValidationViewController
        destVC.customerModel = customerModel
        destVC.hotelModel = hotelModel
        destVC.meetingRoomModel = meetingRoomModel
        destVC.equipmentModels = equipmentModels
        destVC.reservationFullModel = reservationFullModel!
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    
    */
    
    
}
