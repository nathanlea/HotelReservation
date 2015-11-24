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
    
    internal var customerModel : CustomerModel?
    internal var hotelModel : HotelModel?
    internal var cateringModel : CateringModel?
    internal var meetingRoomModel :MeetingRoomModel?
    internal var reservationModel : ReservationPackage?
    internal var equipmentForReservation : [EquipmentForReservation]?
    
    
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
    internal var RoomCostPerHour = 0.0
    internal var NoofRoomHours = 0.0
    var CateringCost = 0
    internal var NoofPeopleAttending = 20
    var tempresult1 = 0.0
    var tempresult2 = 0.0
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
    @IBOutlet var Separators: [UILabel]!
    @IBOutlet weak var HotelName: UILabel!
    
    
    var skipColor = UIColor(red: 0.8, green: 0.5, blue: 0.4, alpha: 1.0)
    var labelColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
    var nextColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1.0)
    
    @IBAction func SubmitClick(sender: UIButton) {
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? CVCalendarViewController {
            vc.customerModel = customerModel
            vc.hotelModel = hotelModel
            vc.cateringModel = cateringModel
            vc.reservationModel = reservationModel
            vc.equipmentForReservation = equipmentForReservation
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
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
        print("count10 :\(LoudSpeakerCount)")*/
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
        
        for b in Separators {
            b.textColor = skipColor
        }
        
        EquipmentCollection[0].text! = String((equipmentForReservation as [EquipmentForReservation]!)[0].Quantity!) //String(ProjectorCount)
        EquipmentCollection[1].text! = String((equipmentForReservation as [EquipmentForReservation]!)[1].Quantity!)
        EquipmentCollection[2].text! = String((equipmentForReservation as [EquipmentForReservation]!)[2].Quantity!)
        EquipmentCollection[3].text! = String((equipmentForReservation as [EquipmentForReservation]!)[3].Quantity!)
        EquipmentCollection[4].text! = String((equipmentForReservation as [EquipmentForReservation]!)[4].Quantity!)
        EquipmentCollection[5].text! = String((equipmentForReservation as [EquipmentForReservation]!)[5].Quantity!)
        EquipmentCollection[6].text! = String((equipmentForReservation as [EquipmentForReservation]!)[6].Quantity!)
        EquipmentCollection[7].text! = String((equipmentForReservation as [EquipmentForReservation]!)[7].Quantity!)
        EquipmentCollection[8].text! = String((equipmentForReservation as [EquipmentForReservation]!)[8].Quantity!)
        EquipmentCollection[9].text! = String((equipmentForReservation as [EquipmentForReservation]!)[9].Quantity!)
        
        CateringChoiceLabel.text = cateringModel?.FoodOption
        if(cateringModel?.FoodOption == "Buffet($45 per head)")
        {
            CostPerHead.text = "$45"
            CateringCost = 45
        } else if(cateringModel?.FoodOption == "Ala-Carte($30 per head)")
        {
            CostPerHead.text = "$30"
            CateringCost = 30
            
        } else if(cateringModel?.FoodOption == "No catering")
        {
            CostPerHead.text = "$0"
            CateringCost = 0
            
        }
        //should be passed
        
        let cal = NSCalendar.currentCalendar()
        let components = cal.components([.Hour], fromDate: (reservationModel?.startTime)!, toDate: (reservationModel?.endTime)!, options: [])
        NoofRoomHours = Double(components.hour)
        NoofPeopleAttending = (reservationModel?.headCount)!
        RoomCostPerHour = (meetingRoomModel?.CostPerHour)!
        HotelName.text = meetingRoomModel?.RoomName
        
        
        HotelPriceperHour.text = "$" + String(RoomCostPerHour)
        NoofHours.text = String(NoofRoomHours)
        
        
        //should be passed
        NoofPeople.text = String(NoofPeopleAttending)
        
        tempresult1 = RoomCostPerHour * NoofRoomHours
        tempresult2 = Double(CateringCost) * Double(NoofPeopleAttending)
        
        Roomcountlabel.text = "$" +
            String(tempresult1)
        
        Cateringcostlabel.text = "$" +
        String(tempresult2)
        
        TotalPriceAmt.text =
            "$" +
            String(tempresult1 + tempresult2)

        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
