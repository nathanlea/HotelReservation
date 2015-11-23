//
//  MenuViewController.swift
//  Banquet Helper
//
//  Created by GLYNN DERRIAN V on 11/17/15.
//  Copyright © 2015 Okstate. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    var name:String = "Jeff Winger"
    var email:String = ""
    var phone:String = ""
    var password:String = ""

    @IBOutlet weak var helloLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    helloLabel.text = "Hello, " + name
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

}
