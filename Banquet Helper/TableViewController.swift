//
//  TableViewController.swift
//  TeamProject
//
//  Created by Nathan on 10/22/15.
//  Copyright © 2015 LEA NATHAN H. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    internal var customerModel : CustomerModel?
    internal var reservationFullModel : ReservationFullModel?
    internal var hotelModel : HotelModel?
    internal var cateringModel : CateringModel?
    internal var reservationModel : ReservationPackage?
    internal var equipmentForReservation : [EquipmentForReservation]?
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = .None

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? MenuViewController {
            vc.customerModel = customerModel
            
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1//(reservationFullModel?.hotelModel?.count)!
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("IternaryCard", forIndexPath: indexPath) as! CustomTableViewCell
        
        cell.NameLabel.text = ((reservationFullModel?.hotelModel)! as [HotelModel])[indexPath.item].HotelName
        
        let formatter = NSDateFormatter()
        
        formatter.dateStyle = .NoStyle
        formatter.timeStyle = .ShortStyle
        
        cell.TimeLabel.text = formatter.stringFromDate(((reservationFullModel?.reservationModel)! as [ReservationPackage])[indexPath.item].startTime)
        cell.LocationLabel.text = ((reservationFullModel?.hotelModel)! as [HotelModel])[indexPath.item].StreetAddress!
        
        var day = ((reservationFullModel?.reservationModel)! as [ReservationPackage])[indexPath.item].dateOfEvent
        
        let calendar = NSCalendar.currentCalendar()
       var cal = calendar.component([.Month, .Day], fromDate: day)
        
        

        // Configure the cell...
        
        //reservationFullModel
        
        //cell.contentView.layer.borderWidth = 1
        //cell.contentView.layer.borderColor = UIColor.blackColor().CGColor//UIColor(red: 227, green: 134, blue: 114, alpha: 1).CGColor
        

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.dequeueReusableCellWithIdentifier("IternaryCard", forIndexPath: indexPath)
        
        print("Touched Cell")
        
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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
