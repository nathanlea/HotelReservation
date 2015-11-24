//
//  ReservationFullModel.swift
//  Banquet Helper
//
//  Created by LEA NATHAN H on 11/24/15.
//  Copyright © 2015 Okstate. All rights reserved.
//


import UIKit

class ReservationFullModel : BaseModel {
    
    internal var hotelModel : [HotelModel]?
    internal var cateringModel : [CateringModel]?
    internal var reservationModel : [ReservationPackage]?
    internal var equipmentForReservation : [[EquipmentForReservation]]?
    internal var eventPlannerModel : [EventPlannerModel]?
    
    init() {
        hotelModel?.removeAll()
        cateringModel?.removeAll()
        reservationModel?.removeAll()
        equipmentForReservation?.removeAll()
        eventPlannerModel?.removeAll()
    }
    
    func addReservation(hm : HotelModel, cM : CateringModel, rM : ReservationPackage, eR : [EquipmentForReservation], ePM : EventPlannerModel) {
        hotelModel?.append(hm)
        cateringModel?.append(cM)
        reservationModel?.append(rM)
        equipmentForReservation?.append(eR)
        eventPlannerModel?.append(ePM)
    }
}