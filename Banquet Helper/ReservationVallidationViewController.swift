//
//  ReservationValidationViewController.swift
//  Connor_Horel_Reservation
//
//  Created by Connor Eaves on 10/29/15.
//  Copyright © 2015 Connor Eaves. All rights reserved.
//

import UIKit

class ReservationValidationViewController: UIViewController, IGLDropDownMenuDelegate {
    
    var reservationSegueInformation = ReservationPackage()
    
    let MaxDaysReservationForsight = 14
    let MaxHoursReservationForsight = 4
    let TimePickerMinuteResolution = 15
    
    // === Drop Down
    
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
    
    // === Outlets and actions
    
    
    // Date text field outlet and action
    @IBOutlet weak var dateTextField: UITextField!
    @IBAction func dateTextFieldEditing(sender: UITextField) {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePickerMode.Date
        
        datePicker.minimumDate = NSDate()
        datePicker.maximumDate = daysFromNow(MaxDaysReservationForsight)
        
        sender.inputView = datePicker
        datePicker.addTarget(self, action: "datePickerValueChanged:", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    // Start time text field outlet and action
    @IBOutlet weak var startTimeTextField: UITextField!
    @IBAction func startTimeTextFieldEditing(sender: UITextField) {
        let startTimePicker = UIDatePicker()
        startTimePicker.datePickerMode = UIDatePickerMode.Time
        
        startTimePicker.minuteInterval = TimePickerMinuteResolution
        // startTimePicker.minimumDate = NSDate()
        // startTimePicker.maximumDate = hoursFromNow(MaxHoursReservationForsight)
        
        sender.inputView = startTimePicker
        startTimePicker.addTarget(self, action: "startTimePickerChanged:", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    // End tim text field outlet and action
    @IBOutlet weak var endTimeTextField: UITextField!
    @IBAction func endTimeTextFieldEditing(sender: UITextField) {
        let endTimePicker = UIDatePicker()
        endTimePicker.datePickerMode = UIDatePickerMode.Time
        
        endTimePicker.minuteInterval = TimePickerMinuteResolution
        // startTimePicker.minimumDate = NSDate()
        // startTimePicker.maximumDate = hoursFromNow(MaxHoursReservationForsight)
        
        sender.inputView = endTimePicker
        endTimePicker.addTarget(self, action: "endTimePickerChanged:", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    
    // === UIViewController overrides
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        eventTypesDropDown.layer.borderColor = newColor
        eventTypesDropDown.layer.borderWidth = 1.0
        
        setupInit()
        
        // Detect tap on background of view
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal var imageFileName = ""
    internal var stateName = ""
    var newColor = UIColor.lightGrayColor().CGColor
    
    
    var eventTypesDropDown = IGLDropDownMenu()
    
    var eventTypes:NSArray = ["Wedding ceremony",
        "wedding reception",
        "conference",
        "single meeting",
        "luncheon",
        "other"]
    
    
    // === Memeber functions
    
    
    // Hides keyboard
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // Handles formatting of dateTextField text
    func datePickerValueChanged(sender: UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        dateTextField.text = dateFormatter.stringFromDate(sender.date)
        reservationSegueInformation.dateOfEvent = sender.date
    }
    
    // Handles formatting of startTimeTextField text
    func startTimePickerChanged(sender: UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        startTimeTextField.text = dateFormatter.stringFromDate(sender.date)
        reservationSegueInformation.startTime = sender.date
    }
    
    // Handles formatting of endTimeTextField text
    func endTimePickerChanged(sender: UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        endTimeTextField.text = dateFormatter.stringFromDate(sender.date)
        reservationSegueInformation.endTime = sender.date
    }
    
    // Returns a date exactly n days from now
    func daysFromNow(daysInFuture: Int) -> NSDate {
        let components = NSDateComponents()
        components.day = daysInFuture
        
        let futureDate = NSCalendar.currentCalendar().dateByAddingComponents(components, toDate: NSDate(), options: NSCalendarOptions(rawValue: 0))
        
        return futureDate!
    }
    
    // Returns a date n hours from now
    func hoursFromNow(hoursInFuture: Int) -> NSDate {
        let components = NSDateComponents()
        components.hour = hoursInFuture
        
        let futureDate = NSCalendar.currentCalendar().dateByAddingComponents(components, toDate: NSDate(), options: NSCalendarOptions(rawValue: 0))
        
        return futureDate!
    }
    
    func setupInit() {
        
        let dropdownItems:NSMutableArray = NSMutableArray()
        
        for i in 0...(eventTypes.count-1) {
            
            let item = IGLDropDownItem()
            //item.iconImage = UIImage(named: "\(dataImage[i])")
            item.text = "\(eventTypes[i])"
            dropdownItems.addObject(item)
        }
        
        eventTypesDropDown.menuText = "Event Type"
        eventTypesDropDown.dropDownItems = dropdownItems as [AnyObject]
        eventTypesDropDown.paddingLeft = 15
        eventTypesDropDown.frame = CGRectMake(20, 115, 200, 45)
        eventTypesDropDown.delegate = self
        eventTypesDropDown.type = IGLDropDownMenuType.Stack
        eventTypesDropDown.gutterY = 5
        eventTypesDropDown.itemAnimationDelay = 0.1
        //dropDownMenu.rotate = IGLDropDownMenuRotate.Random //add rotate value for tilting the
        eventTypesDropDown.reloadView()
        
        self.view.addSubview(self.eventTypesDropDown)
        
    }
    
    func dropDownMenu(dropDownMenu: IGLDropDownMenu!, selectedItemAtIndex index: Int) {
        
        let item:IGLDropDownItem = dropDownMenu.dropDownItems[index] as! IGLDropDownItem
        print("Selected: \(item.text)")
        
        
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
