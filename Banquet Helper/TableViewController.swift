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
    var selectedIndex = 0
    
    
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
            vc.reservationFullModel = reservationFullModel!
        }
        if let vc = segue.destinationViewController as? SummaryViewController {
            vc.customerModel = customerModel
            vc.hotelModel = ((reservationFullModel?.hotelModel)! as [HotelModel])[selectedIndex]
            vc.cateringModel = ((reservationFullModel?.cateringModel)! as [CateringModel])[selectedIndex]
            vc.reservationModel = ((reservationFullModel?.reservationModel)! as [ReservationPackage])[selectedIndex]
            vc.equipmentForReservation = ((reservationFullModel?.equipmentForReservation)! as [[EquipmentForReservation]])[selectedIndex]
            vc.meetingRoomModel = ((reservationFullModel?.meetingRoomModel)! as [MeetingRoomModel])[selectedIndex]
            vc.reservationFullModel = reservationFullModel!
            vc.hideButton = true
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if((reservationFullModel?.hotelModel.count)! == 1) {
            return 0
        } else {
            return (reservationFullModel?.hotelModel.count)! - 1
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("IternaryCard", forIndexPath: indexPath) as! CustomTableViewCell

        
        let item = indexPath.item + 1
        
        cell.NameLabel.text = ((reservationFullModel?.hotelModel)! as [HotelModel])[item].HotelName
        
        let formatter = NSDateFormatter()
        
        formatter.dateStyle = .NoStyle
        formatter.timeStyle = .ShortStyle
        
        cell.TimeLabel.text = formatter.stringFromDate(((reservationFullModel?.reservationModel)! as [ReservationPackage])[item].startTime)
        cell.LocationLabel.text = ((reservationFullModel?.hotelModel)! as [HotelModel])[item].StreetAddress!
        
        var day = ((reservationFullModel?.reservationModel)! as [ReservationPackage])[item].dateOfEvent
        
        let calendar = NSCalendar.currentCalendar()
        let comp = calendar.components([.Month, .Day], fromDate: day)
        
        cell.DayLabel.text = String(comp.day)
        cell.MonthLabel.text = String(comp.month)
        
        /* This is just going to have to be a bug
        if(cell.NameLabel.text == "The Ritz Carlton") {
            //cell.imageView?.image = UIImage
            //mugShotImageView.frame = CGRectMake(frame.origin.x, frame.origin.y, 50, 50)
            cell.imageView?.image = UIImage(named: "Map1")
            cell.imageView?.contentMode = .ScaleAspectFit
        } else if (cell.NameLabel.text == "Dallas Marriot Citz Center"){
            cell.imageView?.image = UIImage(named: "Map2")
            cell.imageView?.contentMode = .ScaleAspectFit
            
        } else if (cell.NameLabel.text == "Renaissance Dallas Hotel"){
            cell.imageView?.image = UIImage(named: "Map3")
            cell.imageView?.contentMode = .ScaleAspectFit
        } */

        // Configure the cell...
        
        //reservationFullModel
        
        //cell.contentView.layer.borderWidth = 1
        //cell.contentView.layer.borderColor = UIColor.blackColor().CGColor//UIColor(red: 227, green: 134, blue: 114, alpha: 1).CGColor
        

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.dequeueReusableCellWithIdentifier("IternaryCard", forIndexPath: indexPath)
        
        selectedIndex = indexPath.item + 1
        performSegueWithIdentifier("ItineraryToSummary", sender: nil)
        
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
