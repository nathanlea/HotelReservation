//
//  view1controller.swift
//  mypages
//
//  Created by KASUVAJJALA DEEPTHI  on 10/25/15.
//  Copyright © 2015 KASUVAJJALA DEEPTHI . All rights reserved.
//
// Using this: https://github.com/vinit5320/DropDown-Menu for the Dropdown menus

import UIKit
//Main View Controller Class
class ViewController1: UIViewController, IGLDropDownMenuDelegate {
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
    
    
    var dropDownMenu = IGLDropDownMenu()
    var dropDownMenu2 = IGLDropDownMenu()
    
    var dataImage:NSArray = ["sun.png",
        "clouds.png",
        "snow.png" ]
    var dataTitle:NSArray = ["Buffet",
        "À la carte",
        "None" ]
    var AlcholTitle:NSArray = ["Yes",
        "No" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textview1.layer.borderColor = newColor
        textview2.layer.borderColor = newColor
        textview1.layer.borderWidth = 1.0
       textview2.layer.borderWidth = 1.0
        
        setupInit()
    }
    
    func setupInit() {
        
        let dropdownItems:NSMutableArray = NSMutableArray()
        
        for i in 0...(dataTitle.count-1) {
            
            let item = IGLDropDownItem()
            //item.iconImage = UIImage(named: "\(dataImage[i])")
            item.text = "\(dataTitle[i])"
            dropdownItems.addObject(item)
        }
        
        dropDownMenu.menuText = "Choose Food"
        dropDownMenu.dropDownItems = dropdownItems as [AnyObject]
        dropDownMenu.paddingLeft = 15
        dropDownMenu.frame = CGRectMake(20, 115, 200, 45)
        dropDownMenu.delegate = self
        dropDownMenu.type = IGLDropDownMenuType.Stack
        dropDownMenu.gutterY = 5
        dropDownMenu.itemAnimationDelay = 0.1
        //dropDownMenu.rotate = IGLDropDownMenuRotate.Random //add rotate value for tilting the
        dropDownMenu.reloadView()
        
        let dropdown2Items:NSMutableArray = NSMutableArray()
        
        for i in 0...(AlcholTitle.count-1) {
            
            let item = IGLDropDownItem()
            //item.iconImage = UIImage(named: "\(dataImage[i])")
            item.text = "\(AlcholTitle[i])"
            dropdown2Items.addObject(item)
        }
        
        dropDownMenu2.menuText = "Alchol Present"
        dropDownMenu2.dropDownItems = dropdown2Items as [AnyObject]
        dropDownMenu2.paddingLeft = 15
        dropDownMenu2.frame = CGRectMake(20, 375, 200, 45)
        dropDownMenu2.delegate = self
        dropDownMenu2.type = IGLDropDownMenuType.Stack
        dropDownMenu2.gutterY = 5
        dropDownMenu2.itemAnimationDelay = 0.1
        //dropDownMenu.rotate = IGLDropDownMenuRotate.Random //add rotate value for tilting the
        dropDownMenu2.reloadView()
        
        self.view.addSubview(self.dropDownMenu)
        self.view.addSubview(self.dropDownMenu2)
        
    }
    
    func dropDownMenu(dropDownMenu: IGLDropDownMenu!, selectedItemAtIndex index: Int) {
        
        let item:IGLDropDownItem = dropDownMenu.dropDownItems[index] as! IGLDropDownItem
        print("Selected: \(item.text)")
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
