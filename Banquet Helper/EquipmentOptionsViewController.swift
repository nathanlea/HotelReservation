//
//  ViewController2.swift
//  TeamProject
//
//  Created by KASUVAJJALA DEEPTHI  on 11/17/15.
//  Copyright © 2015 KASUVAJJALA DEEPTHI . All rights reserved.
//

import Foundation
import UIKit
//Main View Controller Class
class EquipmentOptionsViewController: UIViewController {
//Outlets to access the View's Title and to display
    //These are not all max of 10, someone should fix this
    
    internal var customerModel : CustomerModel?
    internal var reservationFullModel : ReservationFullModel?
    internal var hotelModel : HotelModel?
    internal var cateringModel : CateringModel?
    internal var meetingRoomModel :MeetingRoomModel?
    internal var reservationModel: ReservationPackage?
    internal var equipmentForReservation = [EquipmentForReservation()]
    
    var maxValue = 5
    @IBOutlet weak var Notes: UITextView!
    @IBOutlet var Countlabels: [UILabel]!
    @IBOutlet weak var EquipmentLabel: UILabel!
    @IBOutlet weak var AddEquipmentLabel: UILabel!
    @IBOutlet weak var AvailableLabel1: UILabel!
    @IBOutlet weak var AvailableLabel2: UILabel!
    @IBOutlet weak var AvailableLabel3: UILabel!
    
    @IBOutlet weak var AdditionalLabel1: UILabel!
    @IBOutlet weak var AdditionalLabel2: UILabel!
    @IBOutlet weak var AdditionalLabel3: UILabel!
    @IBOutlet weak var AdditionalLabel4: UILabel!
    @IBOutlet weak var AdditionalLabel5: UILabel!
    @IBOutlet weak var AdditionalLabel6: UILabel!
    @IBOutlet weak var AdditionalLabel7: UILabel!
    @IBOutlet weak var AdditionalLabel8: UILabel!
    @IBOutlet weak var AdditionalLabel9: UILabel!
    @IBOutlet weak var AdditionalLabel10: UILabel!
    @IBOutlet weak var AdditionalLabel11: UILabel!
    @IBOutlet weak var Subtitle1: UILabel!
    @IBOutlet weak var Subtitle2: UILabel!
    @IBOutlet weak var Subtitle3: UILabel!
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var SkipButton: UIButton!
    @IBOutlet weak var CountLable: UILabel!
    @IBOutlet weak var CountLable1: UILabel!
    @IBOutlet weak var CountLable2: UILabel!
    @IBOutlet weak var CountLable3: UILabel!
    @IBOutlet weak var CountLable4: UILabel!
    @IBOutlet weak var CountLable5: UILabel!
    @IBOutlet weak var CountLable6: UILabel!
    @IBOutlet weak var CountLable7: UILabel!
    @IBOutlet weak var CountLable8: UILabel!
    @IBOutlet weak var CountLable9: UILabel!
    
    internal var additionalnotes1 = ""
    internal var additionalnotes2 = ""
    internal var cateringchoice = ""
    internal var alcoholchoice = ""
    
    var labelColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
    var nextColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1.0)
    var skipColor = UIColor(red: 0.8, green: 0.5, blue: 0.4, alpha: 1.0)
    
    @IBAction func NextButtonClickAction(sender: UIButton) {
        print("additionalnotes1 :\(additionalnotes1)")
        print("additionalnotes2 :\(additionalnotes2)")
        print("cateringchoice :\(cateringchoice)")
        print("alcoholchoice :\(alcoholchoice)")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? SummaryViewController {
             if(segue.identifier == "NextSegueEq")
            {
                vc.additionalnotes = Notes.text
                equipmentForReservation.removeAll()
                equipmentForReservation.append(EquipmentForReservation(id: (customerModel?.Id)!, reservationId: reservationModel!.ID, name: "Projector", quantity: Int(Countlabels[0].text!)!, pricePerUnit: 0.0))
                //vc.ProjectorCount = Int(Countlabels[0].text!)!
                //vc.ProjectorScreenCount = Int(Countlabels[1].text!)!
                equipmentForReservation.append(EquipmentForReservation(id: (customerModel?.Id)!, reservationId: reservationModel!.ID, name: "Projector Screnn", quantity: Int(Countlabels[0].text!)!, pricePerUnit: 0.0))
                //vc.LaptopCount = Int(Countlabels[2].text!)!
                equipmentForReservation.append(EquipmentForReservation(id: (customerModel?.Id)!, reservationId: reservationModel!.ID, name: "Laptop", quantity: Int(Countlabels[2].text!)!, pricePerUnit: 0.0))
                //vc.CDDVDCount = Int(Countlabels[3].text!)!
                equipmentForReservation.append(EquipmentForReservation(id: (customerModel?.Id)!, reservationId: reservationModel!.ID, name: "CDDVD", quantity: Int(Countlabels[3].text!)!, pricePerUnit: 0.0))
                //vc.DigitalAudioCount = Int(Countlabels[4].text!)!
                equipmentForReservation.append(EquipmentForReservation(id: (customerModel?.Id)!, reservationId: reservationModel!.ID, name: "Digital Audio", quantity: Int(Countlabels[4].text!)!, pricePerUnit: 0.0))
                //vc.VideoCassetteCount = Int(Countlabels[5].text!)!
                equipmentForReservation.append(EquipmentForReservation(id: (customerModel?.Id)!, reservationId: reservationModel!.ID, name: "Video Cassette", quantity: Int(Countlabels[5].text!)!, pricePerUnit: 0.0))
                //vc.OverheadProjectorCount = Int(Countlabels[6].text!)!
                equipmentForReservation.append(EquipmentForReservation(id: (customerModel?.Id)!, reservationId: reservationModel!.ID, name: "Overhead Projector", quantity: Int(Countlabels[6].text!)!, pricePerUnit: 0.0))
                //vc.MircophoneCount = Int(Countlabels[7].text!)!
                equipmentForReservation.append(EquipmentForReservation(id: (customerModel?.Id)!, reservationId: reservationModel!.ID, name: "Microphone", quantity: Int(Countlabels[7].text!)!, pricePerUnit: 0.0))
                //vc.WhiteboardCount = Int(Countlabels[8].text!)!
                equipmentForReservation.append(EquipmentForReservation(id: (customerModel?.Id)!, reservationId: reservationModel!.ID, name: "Whiteboard", quantity: Int(Countlabels[8].text!)!, pricePerUnit: 0.0))
                //vc.LoudSpeakerCount = Int(Countlabels[9].text!)!
                equipmentForReservation.append(EquipmentForReservation(id: (customerModel?.Id)!, reservationId: reservationModel!.ID, name: "Loud Speaker", quantity: Int(Countlabels[9].text!)!, pricePerUnit: 0.0))
                
                //vc.cateringchoicepassed = cateringchoice
                //equipmentModel?.append(EquipmentModel(id: (customerModel?.Id)!, name: "Projector", quantity: Int(Countlabels[0].text!)!, pricePreUnit: 0.0))
                
                vc.customerModel = customerModel
                vc.hotelModel = hotelModel
                vc.cateringModel = cateringModel
                vc.reservationModel = reservationModel
                vc.equipmentForReservation = equipmentForReservation
                vc.meetingRoomModel = meetingRoomModel
                vc.reservationFullModel = reservationFullModel!
                
            }
            if(segue.identifier == "SkipsegueEq")
            {
                vc.additionalnotes = ""
                equipmentForReservation.removeAll()
                equipmentForReservation.append(EquipmentForReservation(id: (customerModel?.Id)!, reservationId: reservationModel!.ID, name: "Projector", quantity: 0, pricePerUnit: 0.0))
                //vc.ProjectorCount = Int(Countlabels[0].text!)!
                //vc.ProjectorScreenCount = Int(Countlabels[1].text!)!
                equipmentForReservation.append(EquipmentForReservation(id: (customerModel?.Id)!, reservationId: reservationModel!.ID, name: "Projector Screnn", quantity: 0, pricePerUnit: 0.0))
                //vc.LaptopCount = Int(Countlabels[2].text!)!
                equipmentForReservation.append(EquipmentForReservation(id: (customerModel?.Id)!, reservationId: reservationModel!.ID, name: "Laptop", quantity: 0, pricePerUnit: 0.0))
                //vc.CDDVDCount = Int(Countlabels[3].text!)!
                equipmentForReservation.append(EquipmentForReservation(id: (customerModel?.Id)!, reservationId: reservationModel!.ID, name: "CDDVD", quantity: 0, pricePerUnit: 0.0))
                //vc.DigitalAudioCount = Int(Countlabels[4].text!)!
                equipmentForReservation.append(EquipmentForReservation(id: (customerModel?.Id)!, reservationId: reservationModel!.ID, name: "Digital Audio", quantity: 0, pricePerUnit: 0.0))
                //vc.VideoCassetteCount = Int(Countlabels[5].text!)!
                equipmentForReservation.append(EquipmentForReservation(id: (customerModel?.Id)!, reservationId: reservationModel!.ID, name: "Video Cassette", quantity: 0, pricePerUnit: 0.0))
                //vc.OverheadProjectorCount = Int(Countlabels[6].text!)!
                equipmentForReservation.append(EquipmentForReservation(id: (customerModel?.Id)!, reservationId: reservationModel!.ID, name: "Overhead Projector", quantity: 0, pricePerUnit: 0.0))
                //vc.MircophoneCount = Int(Countlabels[7].text!)!
                equipmentForReservation.append(EquipmentForReservation(id: (customerModel?.Id)!, reservationId: reservationModel!.ID, name: "Microphone", quantity: 0, pricePerUnit: 0.0))
                //vc.WhiteboardCount = Int(Countlabels[8].text!)!
                equipmentForReservation.append(EquipmentForReservation(id: (customerModel?.Id)!, reservationId: reservationModel!.ID, name: "Whiteboard", quantity: 0, pricePerUnit: 0.0))
                //vc.LoudSpeakerCount = Int(Countlabels[9].text!)!
                equipmentForReservation.append(EquipmentForReservation(id: (customerModel?.Id)!, reservationId: reservationModel!.ID, name: "Loud Speaker", quantity: 0, pricePerUnit: 0.0))
                
                /*
                vc.ProjectorCount = 0
                vc.ProjectorScreenCount = 0
                vc.LaptopCount = 0
                vc.CDDVDCount = 0
                vc.DigitalAudioCount = 0
                vc.VideoCassetteCount = 0
                vc.OverheadProjectorCount = 0
                vc.MircophoneCount = 0
                vc.WhiteboardCount = 0
                vc.LoudSpeakerCount = 0
                vc.cateringchoicepassed = cateringchoice*/
                
                vc.customerModel = customerModel
                vc.hotelModel = hotelModel
                vc.cateringModel = cateringModel
                vc.reservationModel = reservationModel
                vc.equipmentForReservation = equipmentForReservation
                vc.meetingRoomModel = meetingRoomModel
                vc.reservationFullModel = reservationFullModel!
            }
        }
    }
    
    @IBAction func SkipClick(sender: UIButton) {
    }
    
  
    @IBAction func test(sender: UIButton) {
        IncrementLabel(sender.tag)
    }
    func IncrementLabel (i : Int)
    {
        var a:Int = Int(Countlabels[i].text!)!
        if(a < maxValue)
        {
            Countlabels[i].text = String(++a)
        }
        else
        {
            Countlabels[i].text = String(a)
        }
        
        
    }
    func DecrementLabel (j : Int)
    {
        let index = j - 10
        var a:Int = Int(Countlabels[index].text!)!
        if(a == 0)
        {
            Countlabels[index].text = String(a)
        }
        else
        {
            Countlabels[index].text = String(--a)
        }
        
    }

    
    @IBAction func DecrementCount(sender: UIButton) {
        DecrementLabel(sender.tag)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        EquipmentLabel.textColor = labelColor
        AddEquipmentLabel.textColor = labelColor
        AdditionalLabel11.textColor = labelColor
        
        AvailableLabel1.textColor = nextColor
        AvailableLabel2.textColor = nextColor
        AvailableLabel3.textColor = nextColor
        
        AdditionalLabel1.textColor = nextColor
        AdditionalLabel2.textColor = nextColor
        AdditionalLabel3.textColor = nextColor
        AdditionalLabel4.textColor = nextColor
        AdditionalLabel5.textColor = nextColor
        AdditionalLabel6.textColor = nextColor
        AdditionalLabel8.textColor = nextColor
        AdditionalLabel9.textColor = nextColor
        AdditionalLabel10.textColor = nextColor
        AdditionalLabel7.textColor = nextColor
        Subtitle1.textColor = nextColor
        Subtitle2.textColor = nextColor
        Subtitle3.textColor = nextColor
        NextButton.setTitleColor(nextColor, forState: UIControlState.Normal)
        SkipButton.setTitleColor(skipColor, forState: UIControlState.Normal)
        CountLable.textColor = skipColor
        CountLable1.textColor = skipColor
        CountLable2.textColor = skipColor
        CountLable3.textColor = skipColor
        CountLable4.textColor = skipColor
        CountLable5.textColor = skipColor
        CountLable6.textColor = skipColor
        CountLable7.textColor = skipColor
        CountLable8.textColor = skipColor
        CountLable9.textColor = skipColor
        
        Notes.layer.borderWidth = 1.0
        Notes.layer.borderColor = skipColor.CGColor
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}