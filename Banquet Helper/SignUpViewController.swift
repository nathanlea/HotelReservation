//
//  SignUpViewController.swift
//  Hotel 2
//
//  Created by GLYNN DERRIAN V on 11/5/15.
//  Copyright © 2015 GLYNN DERRIAN V. All rights reserved.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var user = userAccount(name: "JeffWinger", number: "2145556987", email: "fake@doesntwork.com", password: "hahaha")
    
    override func viewDidLoad()
    {
        /*
        Commenting out becuse I don't know what these are - Nathan
        if let savedInfo = loadInfo()
        {
        
        }
        else
        {
            loadSampleInfo()
        }*/
        
        func loadSampleInfo()
        {
            
           
        }
        //super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}