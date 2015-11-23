//
//  SignInTestController.swift
//  Hotel 2
//
//  Created by GLYNN DERRIAN V on 11/16/15.
//  Copyright © 2015 GLYNN DERRIAN V. All rights reserved.
//

import UIKit

class SignInTestController: UIViewController {
    
    
    var name:String = "Jeff Winger"
    var email:String = ""
    var phone:String = ""
    var password:String = ""
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var passLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailLabel.text = email
        
        passLabel.text = password
        
        // Do any additional setup after loading the view.
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
