//
//  MenuViewController.swift
//  Banquet Helper
//
//  Created by GLYNN DERRIAN V on 11/17/15.
//  Copyright © 2015 Okstate. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    internal var customerModel : CustomerModel?
    internal var reservationFullModel = ReservationFullModel()
    var name:String = "User"
    var email:String = ""
    var phone:String = ""
    var password:String = ""

    @IBOutlet weak var helloLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        

    helloLabel.text = "Hello, " + (customerModel?.FirstName)!
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        
        self.navigationController?.toolbarHidden = true
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        switch(segue.identifier!) {
        case "reserveRoomSegue":
        let navc = segue.destinationViewController as! UINavigationController
        let hotelListVC = navc.viewControllers.first as! HotelListTableViewController
        hotelListVC.customerModel = customerModel!
        hotelListVC.reservationFullModel = reservationFullModel
        
        case "meetwithaplannersegue":
            
            let navc = segue.destinationViewController as! UINavigationController
            let destinationVC = navc.viewControllers.first as! CVCalendarViewController
            destinationVC.customerModel = customerModel
            destinationVC.reservationFullModel = reservationFullModel
            //pass variables if you need them
        case "itinerarysegue":
            let navc = segue.destinationViewController as! UINavigationController
            let destinationVC = navc.viewControllers.first as! TableViewController
            destinationVC.customerModel = customerModel
            destinationVC.reservationFullModel = reservationFullModel
            //passvariables if you need them
            
        default:
            break
            
        }
    }
}
