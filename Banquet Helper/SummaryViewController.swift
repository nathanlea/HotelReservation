//
//  ViewController3.swift
//  TeamProject
//
//  Created by KASUVAJJALA DEEPTHI  on 11/17/15.
//  Copyright © 2015 KASUVAJJALA DEEPTHI . All rights reserved.
//

import Foundation
import UIKit
//Main View Controller Class
class SummaryViewController: UIViewController {
    internal var ProjectorCount = 0
    internal var ProjectorScreenCount = 0
    internal var LaptopCount = 0
    internal var CDDVDCount = 0
    internal var DigitalAudioCount = 0
    internal var VideoCassetteCount = 0
    internal var OverheadProjectorCount = 0
    internal var MircophoneCount = 0
    internal var WhiteboardCount = 0
    internal var LoudSpeakerCount = 0
    internal var additionalnotes = ""
    internal var cateringchoicepassed = ""
    @IBOutlet weak var TotalPrice: UILabel!
    @IBOutlet weak var TotalPriceSubtitle: UILabel!
    @IBOutlet weak var TotalPriceAmt: UILabel!
    
    @IBOutlet weak var RoomLabel: UILabel!
    @IBOutlet weak var CateringLabel: UILabel!
    @IBOutlet weak var EquipmentBranch: UILabel!
    
    @IBOutlet weak var Roomcountlabel: UILabel!
    @IBOutlet weak var Cateringcostlabel: UILabel!
    @IBOutlet weak var Equipmentcostlabel: UILabel!
    
    @IBOutlet var LabelCollection: [UILabel]!
    
    @IBOutlet weak var HotelPriceperHour: UILabel!
    @IBOutlet weak var NoofHours: UILabel!
    
    @IBOutlet weak var CateringPrice: UILabel!
    @IBOutlet weak var NoofPeople: UILabel!
    
    @IBOutlet var EquipmentCollection: [UILabel]!
    
    @IBOutlet weak var SubmitButton: UIButton!
    
    @IBOutlet weak var CateringChoiceLabel: UILabel!
    
    @IBOutlet weak var CostPerHead: UILabel!
    
    var skipColor = UIColor(red: 0.8, green: 0.5, blue: 0.4, alpha: 1.0)
    var labelColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
    var nextColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1.0)
    
    @IBAction func SubmitClick(sender: UIButton) {
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let _ = segue.destinationViewController as? CVCalendarViewController {
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Notes here: \(additionalnotes)")
        print("count1 :\(ProjectorCount)")
        print("count2 :\(ProjectorScreenCount)")
        print("count3 :\(LaptopCount)")
        print("count4 :\(CDDVDCount)")
        print("count5 :\(DigitalAudioCount)")
        print("count6 :\(VideoCassetteCount)")
        print("count7 :\(OverheadProjectorCount)")
        print("count8 :\(MircophoneCount)")
        print("count9 :\(WhiteboardCount)")
        print("count10 :\(LoudSpeakerCount)")
        TotalPrice.textColor = labelColor
        TotalPriceSubtitle.textColor = nextColor
        TotalPriceAmt.textColor = skipColor
        RoomLabel.textColor = labelColor
        CateringLabel.textColor = labelColor
        EquipmentBranch.textColor = labelColor
        Roomcountlabel.textColor = skipColor
        Cateringcostlabel.textColor = skipColor
        Equipmentcostlabel.textColor = skipColor
        SubmitButton.setTitleColor(nextColor, forState: UIControlState.Normal)
        for a in LabelCollection {
            a.textColor = labelColor
        }
        /* Roomcountlabel.text =
        String(Int(HotelPriceperHour.text!)! * Int(NoofHours.text!)!)
        
        Cateringcostlabel.text =
        String(Int(CateringPrice.text!)! * Int(NoofPeople.text!)!)
        
        TotalPriceAmt.text =
        String(Int(Roomcountlabel.text!)! + Int(Cateringcostlabel.text!)!)
        */
        EquipmentCollection[0].text! = String(ProjectorCount)
        EquipmentCollection[1].text! = String(ProjectorScreenCount)
        EquipmentCollection[2].text! = String(LaptopCount)
        EquipmentCollection[3].text! = String(CDDVDCount)
        EquipmentCollection[4].text! = String(DigitalAudioCount)
        EquipmentCollection[5].text! = String(VideoCassetteCount)
        EquipmentCollection[6].text! = String(OverheadProjectorCount)
        EquipmentCollection[7].text! = String(MircophoneCount)
        EquipmentCollection[8].text! = String(WhiteboardCount)
        EquipmentCollection[9].text! = String(LoudSpeakerCount)
        CateringChoiceLabel.text = cateringchoicepassed
        if(cateringchoicepassed == "Buffet($45 per head)")
        {
         CostPerHead.text = "$45"
        }
        if(cateringchoicepassed == "Ala-Carte($30 per head)")
        {
            CostPerHead.text = "$30"
            
        }
        if(cateringchoicepassed == "No catering")
        {
            CostPerHead.text = "$0"
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
