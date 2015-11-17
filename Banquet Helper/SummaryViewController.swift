//
//  SummaryViewController.swift
//  Banquet Helper
//
//  Created by Nathan on 11/15/15.
//  Copyright © 2015 Okstate. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {
    
    @IBOutlet weak var roomRateLabel: UILabel!
    @IBOutlet weak var roomRateCost: UILabel!
    @IBOutlet weak var roomTotalCost: UILabel!
    
    @IBOutlet weak var equipmentRateLabel: UILabel!
    @IBOutlet weak var equipmentRateCost: UILabel!
    @IBOutlet weak var equipmentTotalCost: UILabel!
    
    @IBOutlet weak var foodRateLabel: UILabel!
    @IBOutlet weak var foodRateCost: UILabel!
    @IBOutlet weak var foodTotalCost: UILabel!
    
    @IBOutlet weak var totalCost: UILabel!
    
    @IBAction func sumbitAction(sender: AnyObject) {
        
        //Package Some Stuff Fire spinning, push to server?
        
        
    }
    
    //Variable to be set before loading page
    var roomRate: Int = 40
    var equipRate: Int = 40
    var foodRate: Int = 40
    var hoursReserved: Float = 8

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        roomRateCost.text = String(roomRate)
        equipmentRateCost.text = String(equipRate)
        foodRateCost.text = String(foodRate)
        
        let roomRateLabelText = String(hoursReserved) + " HR - $/hour"
        let foodLableText = String(hoursReserved) + " HR - $/person"
        
        roomRateLabel.text = roomRateLabelText
        equipmentRateLabel.text = roomRateLabelText
        foodRateLabel.text = foodLableText
        
        roomTotalCost.text = String(hoursReserved * Float( roomRate ))
        equipmentTotalCost.text = String(hoursReserved * Float( equipRate ))
        foodTotalCost.text = String(hoursReserved * Float( foodRate ))
        
        totalCost.text = String(
            hoursReserved * Float( roomRate ) + hoursReserved * Float( equipRate ) + hoursReserved * Float( foodRate ))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
