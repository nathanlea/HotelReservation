//
//  HotelListTableViewController.swift
//  Banquet Helper
//
//  Created by NATHAN LEA on 11/20/15.
//  Copyright © 2015 Okstate. All rights reserved.
//

import UIKit

class RoomListTableViewController: UITableViewController {
    
    let repository = HotelRepository()
    var genericArray = [Any]()
    var hotelModels = [HotelModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        repository.Get(Table.Name.Hotels) {
            //I am going to leave this for you to change Kevin
            //@TODO Kevin
            (jsonObjectArray: NSArray) in
            self.genericArray = self.repository.ConvertToModels(jsonObjectArray, TableName: Table.Name.Hotels)
            for genericType in self.genericArray{
                self.hotelModels.append(genericType as! HotelModel)
            }
            
            let seconds = 0.1
            let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
            let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            
            dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                self.tableView.reloadData()
            })
            
            
        }*/
        
        
        
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
        /*if(hotelModels.count>0){
            return hotelModels.count
        }*/
        return 4 //Hard Coded @KEVIN
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HotelCell", forIndexPath: indexPath) as! HotelListCell
        
        if(true){//hotelModels.count > 0){
            /*cell.HotelNameLabel.text = hotelModels[indexPath.row].HotelName
            cell.HotelAddress.text = hotelModels[indexPath.row].StreetAddress*/
            cell.HotelNameLabel.text = "Main Ballrom"
            cell.HotelAddress.text = "Max Occupancy: 950"
            cell.HotelNameLabel.textColor = UIColor.whiteColor()
            cell.HotelAddress.textColor = UIColor.whiteColor()
            
            switch ((indexPath.item+1))//hotelModels[indexPath.row].Id!)
            {
            case 1:
                cell.backgroundView = UIImageView.init(image: UIImage(named: "MainBallroomSmall"))
                break
            case 2:
                cell.backgroundView = UIImageView.init(image: UIImage(named: "CypressRoom"))
                break
            case 3:
                cell.backgroundView = UIImageView.init(image: UIImage(named: "SalonA"))
                break
            case 4:
                cell.backgroundView = UIImageView.init(image: UIImage(named: "SalonAB"))
                break
            default:
                cell.backgroundView = UIImageView.init(image: UIImage(named: "MainBallroomSmall"))
                break
            }
        }
        
        
        // Configure the cell...
        
        return cell
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
