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
    
    var dataImage:NSArray = ["sun.png",
        "clouds.png",
        "snow.png" ]
    var dataTitle:NSArray = ["Buffet",
        "À la carte",
        "None" ]
    
    
    
    
    
    
    
    
    
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
            item.iconImage = UIImage(named: "\(dataImage[i])")
            item.text = "\(dataTitle[i])"
            dropdownItems.addObject(item)
        }
        
        dropDownMenu.menuText = "Choose Food"
        dropDownMenu.dropDownItems = dropdownItems as [AnyObject]
        dropDownMenu.paddingLeft = 15
        dropDownMenu.frame = CGRectMake((self.view.frame.size.width/2) - 100, 150, 200, 45)
        dropDownMenu.delegate = self
        dropDownMenu.type = IGLDropDownMenuType.Stack
        dropDownMenu.gutterY = 5
        dropDownMenu.itemAnimationDelay = 0.1
        //dropDownMenu.backgroundColor = UIColor(red: 238, green: 221, blue: 203, alpha: 1)
        //dropDownMenu.rotate = IGLDropDownMenuRotate.Random //add rotate value for tilting the
        dropDownMenu.reloadView()
        
        let myLabel = UILabel()
        myLabel.text = "SwiftyOS Blog"
        myLabel.textColor = UIColor.whiteColor()
        myLabel.font = UIFont(name: "Helvetica-Neue", size: 17.0)
        myLabel.textAlignment = NSTextAlignment.Center
        myLabel.frame = CGRectMake((self.view.frame.size.width/2) - 100, 75, 200, 25)
        
        self.view.addSubview(myLabel)
        self.view.addSubview(self.dropDownMenu)
        
    }
    
    func dropDownMenu(dropDownMenu: IGLDropDownMenu!, selectedItemAtIndex index: Int) {
        
        let item:IGLDropDownItem = dropDownMenu.dropDownItems[index] as! IGLDropDownItem
        print("Selected weather \(item.text)")
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
