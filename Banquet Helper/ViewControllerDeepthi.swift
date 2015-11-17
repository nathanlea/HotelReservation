//
//  ViewController.swift
//  mypages
//
//  Created by KASUVAJJALA DEEPTHI  on 10/21/15.
//  Copyright © 2015 KASUVAJJALA DEEPTHI . All rights reserved.
//

import UIKit

class ViewControllerDeepthi: UIViewController {

    @IBAction func clickbutton(sender: AnyObject) {
        self.performSegueWithIdentifier("mysegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let _ = segue.destinationViewController as? ViewController1 {
            
        }
    }

   
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

