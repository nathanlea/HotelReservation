//
//  view2controller.swift
//  mypages
//
//  Created by KASUVAJJALA DEEPTHI  on 10/25/15.
//  Copyright © 2015 KASUVAJJALA DEEPTHI . All rights reserved.
//

import Foundation
import UIKit
//Main View Controller Class
class ViewController2: UIViewController {
    //Outlets to access the View's Title and to display
      
    @IBOutlet weak var textview3: UITextView!
    
    //few internal properties associated with the selected state
   
    var newColor = UIColor.lightGrayColor().CGColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textview3.layer.borderColor = newColor
        textview3.layer.borderWidth = 1.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
