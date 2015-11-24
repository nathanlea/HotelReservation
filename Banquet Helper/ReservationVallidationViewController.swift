//
//  ReservationValidationViewController.swift
//  Connor_Horel_Reservation
//
//  Created by Connor Eaves on 10/29/15.
//  Copyright © 2015 Connor Eaves. All rights reserved.
//
// Using this : https://github.com/valfer/PopDatePickerApp

import UIKit

class ReservationValidationViewController: UIViewController, UITextFieldDelegate, IGLDropDownMenuDelegate {
    internal var customerModel : CustomerModel?
    internal var reservationFullModel: ReservationFullModel?
    internal var hotelModel : HotelModel?
    internal var meetingRoomModel :MeetingRoomModel?
    internal var equipmentModels : [EquipmentModel]?
    var reservationSegueInformation = ReservationPackage()
    var popDatePicker : PopDatePicker?
    var popDatePickerStartTime : PopDatePicker?
    var popDatePickerEndTime : PopDatePicker?
    var dateStringSelected : String = ""
    var  selectedEventType : String = ""
    
    @IBOutlet weak var Roomtitle: UILabel!
    //let initDate : NSDate? = formatter.dateFromString(dateTextField.text!)
    
    let MaxDaysReservationForsight = 14
    let MaxHoursReservationForsight = 4
    let TimePickerMinuteResolution = 15
    
    
    func resign() {
        
        dateTextField.resignFirstResponder()
        startTimeTextField.resignFirstResponder()
        endTimeTextField.resignFirstResponder()
        //nameTextField.resignFirstResponder()
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        if (textField === dateTextField) {
            resign()
            
            let currentDate = NSDate()
            
            let formatter = NSDateFormatter()
            
            formatter.dateStyle = .MediumStyle
            formatter.timeStyle = .NoStyle
            let initDate : NSDate? = currentDate//formatter.dateFromDate(currentDate)
            
            let dataChangedCallback : PopDatePicker.PopDatePickerCallback = { (newDate : NSDate, forTextField : UITextField) -> () in
                
                // here we don't use self (no retain cycle)
                forTextField.text = (newDate.ToDateMediumString() ?? "?") as String
                self.dateStringSelected = (newDate.ToDateMediumString() ?? "?") as String
                
            }
            
            popDatePicker!.pick(self, initDate: initDate, dataChanged: dataChangedCallback)
            popDatePicker!.datePickerVC.datePicker.minimumDate = NSDate()
            popDatePicker!.datePickerVC.datePicker.date = NSDate()
            return false
        }
        else if (textField === startTimeTextField) {
            resign()
            
            let currentDate = NSDate()
            let initDate : NSDate?
            let formatter = NSDateFormatter()
            
            formatter.dateStyle = .MediumStyle
            formatter.timeStyle = .NoStyle
            if dateStringSelected == "" {
                 initDate = currentDate//formatter.dateFromDate(currentDate)
            } else {
                initDate = formatter.dateFromString(dateStringSelected)
            }
            
            let dataChangedCallback : PopDatePicker.PopDatePickerCallback = { (newDate : NSDate, forTextField : UITextField) -> () in
                
                // here we don't use self (no retain cycle)
                forTextField.text = (newDate.ToTimeString() ?? "?") as String
                
            }
            
            popDatePickerStartTime!.pick(self, initDate: initDate, dataChanged: dataChangedCallback)
            
            popDatePickerStartTime!.datePickerVC.datePicker.datePickerMode = UIDatePickerMode.Time
            popDatePickerStartTime!.datePickerVC.datePicker.minuteInterval = 30
            if dateStringSelected == "" {
                popDatePickerStartTime!.datePickerVC.datePicker.date = NSDate()
            } else {
                popDatePickerStartTime!.datePickerVC.datePicker.date = formatter.dateFromString(dateStringSelected)!
            }
            popDatePickerStartTime!.datePickerVC.datePicker.minimumDate = NSDate()
            //popDatePickerStartTime!.datePickerVC.datePicker.date = NSDate()
            return false
        }
        else if(textField === endTimeTextField) {
            resign()
            
            let currentDate = NSDate()
            let initDate : NSDate?
            let formatter = NSDateFormatter()
            
            formatter.dateStyle = .MediumStyle
            formatter.timeStyle = .NoStyle
            
            if dateStringSelected == "" {
                initDate = currentDate
            } else {
                initDate = formatter.dateFromString(dateStringSelected)
            }
            
            let dataChangedCallback : PopDatePicker.PopDatePickerCallback = { (newDate : NSDate, forTextField : UITextField) -> () in
                
                // here we don't use self (no retain cycle)
                forTextField.text = (newDate.ToTimeString() ?? "?") as String
                
            }
            popDatePickerEndTime!.pick(self, initDate: initDate, dataChanged: dataChangedCallback)
            
            popDatePickerEndTime!.datePickerVC.datePicker.datePickerMode = UIDatePickerMode.Time
            popDatePickerEndTime!.datePickerVC.datePicker.minuteInterval = 30
            if dateStringSelected == "" {
                popDatePickerEndTime!.datePickerVC.datePicker.date = NSDate()
            } else {
                popDatePickerEndTime!.datePickerVC.datePicker.date = formatter.dateFromString(dateStringSelected)!
            }
            popDatePickerEndTime!.datePickerVC.datePicker.minimumDate = NSDate()
            //popDatePickerEndTime!.datePickerVC.datePicker.date = NSDate()
            return false
        }
        else {
            return true
        }
    }
    
    //Outlets to access the View's Title and to display the Map image in the Image View
    @IBAction func click2(sender: AnyObject) {
        self.performSegueWithIdentifier("mysegue2", sender: self)
        
    }
   /* override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? CateringOptionsViewController {
            let formatter = NSDateFormatter()

            formatter.dateStyle = .MediumStyle
            formatter.timeStyle = .NoStyle
            reservationSegueInformation.dateOfEvent = formatter.dateFromString(dateTextField.text!)!
            formatter.dateStyle = .NoStyle
            formatter.timeStyle = .ShortStyle
            reservationSegueInformation.startTime = formatter.dateFromString(startTimeTextField.text!)!
            reservationSegueInformation.endTime = formatter.dateFromString(endTimeTextField.text!)!
            reservationSegueInformation.eventType = selectedEventType
            reservationSegueInformation.headCount = Int(headCountTextField.text!)!
            
            vc.customerModel = customerModel
            vc.hotelModel = hotelModel
            vc.meetingRoomModel = meetingRoomModel
            vc.reservationModel = reservationSegueInformation
        }
    }*/
    
    // === Outlets and actions
    
    
    // Date text field outlet and action
    @IBOutlet weak var dateTextField: UITextField!
    @IBAction func dateTextFieldEditing(sender: UITextField) {
    }
    
    // Start time text field outlet and action
    @IBOutlet weak var startTimeTextField: UITextField!
    @IBAction func startTimeTextFieldEditing(sender: UITextField) {
    }
    
    // End tim text field outlet and action
    @IBOutlet weak var endTimeTextField: UITextField!
    @IBAction func endTimeTextFieldEditing(sender: UITextField) {
    }
    
    @IBOutlet weak var headCountTextField: UITextField!
    
    // === UIViewController overrides
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Testing")
        
        Roomtitle.text = meetingRoomModel?.RoomName
        
        print(customerModel?.FirstName); print(customerModel?.LastName); print(hotelModel?.HotelName); print(meetingRoomModel?.RoomName)
        for equipmentModel in equipmentModels!{
            print(equipmentModel.Name)
        }
        popDatePicker = PopDatePicker(forTextField: dateTextField)
        dateTextField.delegate = self
        
        popDatePickerStartTime = PopDatePicker(forTextField: startTimeTextField)
        startTimeTextField.delegate = self
        
        popDatePickerEndTime = PopDatePicker(forTextField: endTimeTextField)
        endTimeTextField.delegate = self
        
        // Do any additional setup after loading the view.
        
        //eventTypesDropDown.layer.borderColor = newColor
        //eventTypesDropDown.layer.borderWidth = 1.0
        
        setupInit()
    }
    
    @IBAction func nextButton(sender: UIButton) {
        
        if( dateTextField.text!.isEmpty)
        {
            let alert = UIAlertView()
            alert.title = "No Date Entered"
            alert.message = "Please Enter A Date For The Event."
            alert.addButtonWithTitle("Ok")
            alert.show()
        }
        else if(startTimeTextField.text!.isEmpty)
        {
            let alert = UIAlertView()
            alert.title = "No Start Time Entered"
            alert.message = "Please Enter a Start time"
            alert.addButtonWithTitle("Ok")
            alert.show()
            
        }
            
        else if( endTimeTextField.text!.isEmpty)
        {
            let alert = UIAlertView()
            alert.title = "No End Time Entered"
            alert.message = "Please Enter a End Time"
            alert.addButtonWithTitle("Ok")
            alert.show()
        }
        else if( headCountTextField.text!.isEmpty)
        {
            let alert = UIAlertView()
            alert.title = "No People Entered"
            alert.message = "Please Enter the Number of Expected people"
            alert.addButtonWithTitle("Ok")
            alert.show()
        }
            
            
        else
        {
            //comfirmed
            self.performSegueWithIdentifier("confirmed", sender: self)
            /*
            
           let repository = HotelRepository()
            repository.GetSpecific(Table.Name.Customers, parameters: self.customerModel.getExistingCustomerJsonParameters(emailField.text!, password: passField.text!)){
                (json: NSDictionary, ok: Bool) in
                
                if(ok){
                    self.customerModel = CustomerModel(jsonObject: json)
                    self.passName = self.customerModel.FirstName!
                    if(self.customerModel.Id != nil){
                        dispatch_async( dispatch_get_main_queue(), {
                            
                            self.performSegueWithIdentifier("signedIn", sender: nil)
                        })
                    }
                    
                }
                else{
                    dispatch_async( dispatch_get_main_queue(), {
                        let alert = UIAlertView()
                        alert.title = "Record Not Found"
                        alert.message = "Username or Password is incorrect, please try again or Sign Up if you don't have an account."
                        alert.addButtonWithTitle("Ok")
                        alert.show()
                    })
                }
            }*/
        }
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc = segue.destinationViewController as? CateringOptionsViewController
        if(segue.identifier == "confirmed")
        {
            let formatter = NSDateFormatter()
            
            formatter.dateStyle = .MediumStyle
            formatter.timeStyle = .NoStyle
            reservationSegueInformation.dateOfEvent = formatter.dateFromString(dateTextField.text!)!
            formatter.dateStyle = .NoStyle
            formatter.timeStyle = .ShortStyle
            reservationSegueInformation.startTime = formatter.dateFromString(startTimeTextField.text!)!
            reservationSegueInformation.endTime = formatter.dateFromString(endTimeTextField.text!)!
            reservationSegueInformation.eventType = selectedEventType
            reservationSegueInformation.headCount = Int(headCountTextField.text!)!
            
            vc!.customerModel = customerModel
            vc!.hotelModel = hotelModel
            vc!.meetingRoomModel = meetingRoomModel
            vc!.reservationModel = reservationSegueInformation
            vc!.reservationFullModel = reservationFullModel!
        }
        if let vc = segue.destinationViewController as? CateringOptionsViewController {
            let formatter = NSDateFormatter()
            
            formatter.dateStyle = .MediumStyle
            formatter.timeStyle = .NoStyle
            reservationSegueInformation.dateOfEvent = formatter.dateFromString(dateTextField.text!)!
            formatter.dateStyle = .NoStyle
            formatter.timeStyle = .ShortStyle
            reservationSegueInformation.startTime = formatter.dateFromString(startTimeTextField.text!)!
            reservationSegueInformation.endTime = formatter.dateFromString(endTimeTextField.text!)!
            reservationSegueInformation.eventType = selectedEventType
            reservationSegueInformation.headCount = Int(headCountTextField.text!)!
            
            vc.customerModel = customerModel
            vc.hotelModel = hotelModel
            vc.meetingRoomModel = meetingRoomModel
            vc.reservationModel = reservationSegueInformation
            vc.reservationFullModel = reservationFullModel!
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var newColor = UIColor.lightGrayColor().CGColor
    
    
    var eventTypesDropDown = IGLDropDownMenu()
    
    var eventTypes:NSArray = ["Wedding ceremony",
        "Wedding Reception",
        "Conference",
        "Single Meeting",
        "Luncheon",
        "Other"]
    
    
    // === Memeber functions
    
    
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
        eventTypesDropDown.frame = CGRectMake(103, 260, 335, 30)
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
        selectedEventType = item.text
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

extension NSDate {
    
    // -> Date System Formatted Medium
    func ToDateMediumString() -> NSString? {
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle;
        formatter.timeStyle = .NoStyle;
        return formatter.stringFromDate(self)
    }
    func ToTimeString() -> NSString? {
        
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        return formatter.stringFromDate(self)
    }
}
