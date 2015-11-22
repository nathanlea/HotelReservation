//
//  EquipmentViewController.swift
//  mypages
//
//  Created by NATHAN LEA  on 10/25/15.
//  Copyright © 2015 NATHAN LEA . All rights reserved.
//

import Foundation
import UIKit
//Main View Controller Class
class EquipmentViewController: UIViewController {
    
    @IBOutlet weak var MicNumber: UILabel!
    @IBOutlet weak var SpeakerNumber: UILabel!
    @IBOutlet weak var LaptopNumber: UILabel!
    @IBOutlet weak var RecorderNuber: UILabel!
    @IBOutlet weak var ProjectorNumber: UILabel!
    @IBOutlet weak var ProjectorScreenNumber: UILabel!
    @IBOutlet weak var WhiteboardNumber: UILabel!
    @IBOutlet weak var DVDNumber: UILabel!
    @IBOutlet weak var VHSNumber: UILabel!
    @IBOutlet weak var OverheadNumber: UILabel!
    @IBOutlet weak var AdditionText: UITextView!
    
    
    @IBAction func MicStepper(sender: UIStepper) {
        MicNumber.text = String(format: "%1.0f", sender.value)
    }
    
    @IBAction func LoudSpeakerStepper(sender: UIStepper) {
        SpeakerNumber.text = String(format: "%1.0f", sender.value)
    }
    
    @IBAction func LaptopStepper(sender: UIStepper) {
        LaptopNumber.text = String(format: "%1.0f", sender.value)
    }
    
    @IBAction func AudioStepper(sender: UIStepper) {
        RecorderNuber.text = String(format: "%1.0f", sender.value)
    }
    
    @IBAction func ProjectorStepper(sender: UIStepper) {
        ProjectorNumber.text = String(format: "%1.0f", sender.value)
    }
    
    @IBAction func ProjectorScreenStepper(sender: UIStepper) {
        ProjectorScreenNumber.text = String(format: "%1.0f", sender.value)
    }
    
    @IBAction func WhiteboardStepper(sender: UIStepper) {
        WhiteboardNumber.text = String(format: "%1.0f", sender.value)
    }
    
    @IBAction func DVDStepper(sender: UIStepper) {
        DVDNumber.text = String(format: "%1.0f", sender.value)
    }
    
    @IBAction func VHSStepper(sender: UIStepper) {
        VHSNumber.text = String(format: "%1.0f", sender.value)
    }
    
    @IBAction func OverheadStepper(sender: UIStepper) {
        OverheadNumber.text = String(format: "%1.0f", sender.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.description == "EquipSkip") {
            //Ignore the data
        }
        else if(segue.description == "EquipSubmit") {
            //Package the data
        }
    }
    
    
}
