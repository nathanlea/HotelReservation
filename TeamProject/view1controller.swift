//
//  view1controller.swift
//  mypages
//
//  Created by KASUVAJJALA DEEPTHI  on 10/25/15.
//  Copyright © 2015 KASUVAJJALA DEEPTHI . All rights reserved.
//

import UIKit
//Main View Controller Class
class ViewController1: UIViewController {
    @IBOutlet weak var ddtext: UILabel!
    @IBOutlet weak var ddMenu: UIView!
    @IBOutlet weak var ddshow: UIButton!
    @IBAction func showlist(sender: UIButton) {
        if(sender.tag == 0)
        {
            sender.tag == 1
             self.ddMenu.hidden = false
        }
        else
        {
            sender.tag = 0;
            self.ddMenu.hidden = true;
        }
        }
  
    @IBAction func selectionmade(sender: UIButton) {
        self.ddtext.text = sender.titleLabel?.text;
        self.ddshow.tag = 0;
        self.ddMenu.hidden = false
        switch(sender.tag)
        {
        case 1:
            self.view.backgroundColor = UIColor.redColor()
            break;
        case 2:
            self.view.backgroundColor = UIColor.blueColor()
            break;
        case 3:
            self.view.backgroundColor = UIColor.greenColor()
            break;
            
        default:
            break;
            
        }

    }
    
    
    
    //Outlets to access the View's Title and to display the Map image in the Image View
    @IBAction func click2(sender: AnyObject) {
        self.performSegueWithIdentifier("mysegue2", sender: self)

    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let _ = segue.destinationViewController as? ViewController1 {
            
        }
    }


    @IBOutlet weak var textview2: UITextView!
    @IBOutlet weak var textview1: UITextView!
    //few internal properties associated with the selected state
    internal var imageFileName = ""
    internal var stateName = ""
    var newColor = UIColor.lightGrayColor().CGColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textview1.layer.borderColor = newColor
        textview2.layer.borderColor = newColor
        textview1.layer.borderWidth = 1.0
       textview2.layer.borderWidth = 1.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
