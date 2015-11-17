//
//  ViewController.swift
//  TeamProject
//
//  Created by LEA NATHAN H on 10/22/15.
//  Copyright © 2015 LEA NATHAN H. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let repository = HotelRepository()
        var hotels = [HotelModel]()
        repository.Get(Table.Name.Hotels, models: hotels)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

