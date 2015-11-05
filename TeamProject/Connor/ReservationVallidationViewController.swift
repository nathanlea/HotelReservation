//
//  ReservationValidationViewController.swift
//  Connor_Horel_Reservation
//
//  Created by Connor Eaves on 10/29/15.
//  Copyright © 2015 Connor Eaves. All rights reserved.
//

import UIKit

class ReservationValidationViewController: UIViewController {
    
    let MaxDaysReservationForsight = 14
    let MaxHoursReservationForsight = 4
    let TimePickerMinuteResolution = 15
    
    
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
        
        // Detect tap on background of view
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
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
    }
    
    // Handles formatting of startTimeTextField text
    func startTimePickerChanged(sender: UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        startTimeTextField.text = dateFormatter.stringFromDate(sender.date)
    }
    
    // Handles formatting of endTimeTextField text
    func endTimePickerChanged(sender: UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        endTimeTextField.text = dateFormatter.stringFromDate(sender.date)
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
    
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
