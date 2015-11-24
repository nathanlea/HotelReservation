//
//  ViewController.swift
//  TeamProject
//
//  Created by KASUVAJJALA DEEPTHI  on 11/17/15.
//  Copyright © 2015 KASUVAJJALA DEEPTHI . All rights reserved.
//

import UIKit

class CateringOptionsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    internal var customerModel : CustomerModel?
    internal var hotelModel : HotelModel?
    internal var meetingRoomModel :MeetingRoomModel?
    internal var cateringModel = CateringModel()
    internal var reservationModel : ReservationPackage?    

    @IBOutlet weak var Alcoholpicker: UIPickerView!
    @IBOutlet weak var Cateringpicker: UIPickerView!
    @IBOutlet weak var AdditionalNotes1: UITextView!
    @IBOutlet weak var AdditionalNotes2: UITextView!
    @IBOutlet weak var FoodLabel: UILabel!
    @IBOutlet weak var AddNotes1: UILabel!
    @IBOutlet weak var AlcoholLabel: UILabel!
    @IBOutlet weak var AddNotes2: UILabel!
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var Skipoutlet: UIButton!
    var selectedcateringchoice = ""
    var selectedalcoholchoice = ""
    var cateringpickerData: [String] = [String]()
    var alcoholData : [String] = [String]()
    var skipColor = UIColor(red: 0.8, green: 0.5, blue: 0.4, alpha: 1.0)
    var labelColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
    var nextColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1.0)
    @IBAction func Skipbutton(sender: UIButton) {
    }
   
    
    @IBAction func ShowCateringPicker(sender: UIButton) {
        if(sender.tag == 0)
        {
            sender.tag == 1
            //Cateringpicker.hidden = false
        }
        else
        {
            sender.tag = 0
            //Cateringpicker.hidden = true
        }

    }
    @IBAction func ShowAlcoholPicker(sender: UIButton) {
        if(sender.tag == 0)
        {
            sender.tag == 1
            //Alcoholpicker.hidden = false
        }
        else
        {
            sender.tag = 0
            //Alcoholpicker.hidden = true
        }

    }
    @IBAction func NextClickAction(sender: UIButton) {
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? EquipmentOptionsViewController {
            if(segue.identifier == "NextSegue")
            {
                /*vc.additionalnotes1 = AdditionalNotes1.text
                vc.additionalnotes2 = AdditionalNotes2.text
                vc.cateringchoice = selectedcateringchoice
                vc.alcoholchoice = selectedalcoholchoice*/
                
                cateringModel.FoodOption = selectedcateringchoice
                cateringModel.FoodAdditionalNotes = AdditionalNotes1.text
                cateringModel.AlcoholChoice = selectedalcoholchoice
                cateringModel.AlcoholAdditionalNotes = AdditionalNotes2.text
                
                vc.cateringModel = cateringModel
                vc.hotelModel = hotelModel
                vc.customerModel = customerModel
                vc.reservationModel = reservationModel
                vc.meetingRoomModel = meetingRoomModel
            }
           if(segue.identifier == "Skipsegue")
            {
                /*vc.additionalnotes1 = ""
                vc.additionalnotes2 = ""
                vc.cateringchoice = cateringpickerData[2]
                vc.alcoholchoice = alcoholData[0]*/
                
                cateringModel.FoodOption = cateringpickerData[2]
                cateringModel.FoodAdditionalNotes = ""
                cateringModel.AlcoholChoice = alcoholData[0]
                cateringModel.AlcoholAdditionalNotes = ""
                
                vc.cateringModel = cateringModel
                vc.hotelModel = hotelModel
                vc.customerModel = customerModel
                vc.reservationModel = reservationModel
                vc.meetingRoomModel = meetingRoomModel
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Skipoutlet.setTitleColor(skipColor, forState: UIControlState.Normal)
        FoodLabel.textColor = labelColor
        AddNotes1.textColor = labelColor
        AddNotes2.textColor = labelColor
        AlcoholLabel.textColor = labelColor
        NextButton.setTitleColor(nextColor, forState: UIControlState.Normal)
        AdditionalNotes1.layer.borderWidth = 1.0
        AdditionalNotes2.layer.borderWidth = 1.0
        AdditionalNotes1.layer.borderColor = skipColor.CGColor
        //AdditionalNotes1.layer.borderColor = UIColor.grayColor().CGColor
        AdditionalNotes2.layer.borderColor = skipColor.CGColor
        //AdditionalNotes2.layer.borderColor = UIColor.grayColor().CGColor
        
       Cateringpicker.layer.borderColor = skipColor.CGColor
       Cateringpicker.layer.borderWidth = 1.0
        
       Alcoholpicker.layer.borderColor = skipColor.CGColor
       Alcoholpicker.layer.borderWidth = 1.0
        // Connect data:
        self.Cateringpicker.delegate = self
        self.Cateringpicker.dataSource = self
        self.Alcoholpicker.delegate = self
        self.Alcoholpicker.dataSource = self
        //Cateringpicker.hidden = true
        //Alcoholpicker.hidden = true
        cateringpickerData = ["Buffet($45 per head)", "Ala-Carte($30 per head)", "No catering"]
        alcoholData = ["No", "Yes"]
        selectedalcoholchoice = alcoholData[0]
        selectedcateringchoice = cateringpickerData[0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView.tag == 1)
        {
            return alcoholData.count
            
        }
        else
        {
            return cateringpickerData.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView
    {
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor.blackColor()
        //pickerLabel.text = "PickerView Cell Title"
        if(pickerView.tag == 1)
        {
            pickerLabel.text = alcoholData[row]
            
        }
        else
        {
            pickerLabel.text = cateringpickerData[row]
        }
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        pickerLabel.font = UIFont(name: "Lato-Regular", size: 30) // In this use your custom font
        pickerLabel.textAlignment = NSTextAlignment.Center
        return pickerLabel
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView.tag == 1)
        {
            return alcoholData[row]
            
        }
        else
        {
            return cateringpickerData[row]
        }
        
    }
    
    // Catpure the picker view selection
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        if(pickerView.tag == 1)
        {
            selectedalcoholchoice = alcoholData[row]
            
        }
        else
        {
            selectedcateringchoice = cateringpickerData[row]
        }
    }



}

