//
//  CVCalendarViewController.swift
//  TeamProject
//
//  Created by Nathan on 10/26/15.
//  Copyright © 2015 LEA NATHAN H. All rights reserved.
//  Based on and using: https://github.com/clisuper/CLWeeklyCalendarView

import UIKit
import CVCalendar

class CVCalendarViewController: UIViewController {
    // MARK: - Properties
    
    var eventPlannerIndex = 0
    var currentDate = 0
    var currentData : CVDate?
    var selectedTimeTime = ""
    var commingFromMenu = false
    
    internal var customerModel : CustomerModel?
    internal var reservationFullModel : ReservationFullModel?
    internal var hotelModel : HotelModel?
    internal var cateringModel : CateringModel?
    internal var reservationModel : ReservationPackage?
    internal var meetingRoomModel :MeetingRoomModel?
    internal var equipmentForReservation : [EquipmentForReservation]?
    internal var eventPlannerModel = EventPlannerModel()

    
    
    @IBOutlet weak var calendarView: CVCalendarView!
    @IBOutlet weak var menuView: CVCalendarMenuView!
    @IBOutlet weak var monthLabel: UILabel!
    
    
    @IBOutlet weak var mornButton1: UIButton!
    @IBOutlet weak var mornButton2: UIButton!
    @IBOutlet weak var mornButton3: UIButton!
    @IBOutlet weak var aftButton1: UIButton!
    @IBOutlet weak var aftButton2: UIButton!
    @IBOutlet weak var eveButton1: UIButton!
    @IBOutlet weak var eveButton2: UIButton!
    
    
    @IBOutlet weak var noMorningTimes: UILabel!
    @IBOutlet weak var noAfternoonTimes: UILabel!
    @IBOutlet weak var noEveningTimes: UILabel!
    
    var selectedTime = -1

    //@IBOutlet weak var daysOutSwitch: UISwitch!
    
    // Date,      [8, 9:30, 11, 2, 3:30, 5:00, 7:30]
    //              Morning    Afternoon   Evening
    //Don't use this it will crash, be sure to set to something before getting stuff
    var schedule: [(date:Int, scheduleArr:[Bool])] = [
        (date: 1, scheduleArr:[true, true, true, true, false, true, true]),
        (date: 2, scheduleArr:[false, true, true, false, true, true, true]),
        (date: 3, scheduleArr:[true, true, true, true, true, true, false]),
        (date: 4, scheduleArr:[true, false, false, true, false, false, true]),
        (date: 5, scheduleArr:[true, false, true, false, true, true, true]),
        (date: 6, scheduleArr:[false, true, true, false, true, true, false]),
        (date: 7, scheduleArr:[true, true, false, true, true, true, true]),
        (date: 8, scheduleArr:[true, false, true, false, true, true, true]),
        (date: 9, scheduleArr:[true, true, true, true, true, true, true]),
        (date: 10, scheduleArr:[true, true, true, true, false, true, true]),
        (date: 11, scheduleArr:[true, true, true, true, true, true, true]),
        (date: 12, scheduleArr:[true, false, false, true, false, true, true]),
        (date: 13, scheduleArr:[false, false, false, false, false, false, false]),
        (date: 14, scheduleArr:[true, true, true, true, true, true, true]),
        (date: 15, scheduleArr:[false, true, true, false, true, true, true]),
        (date: 16, scheduleArr:[true, true, true, true, true, true, false]),
        (date: 17, scheduleArr:[true, false, false, true, false, false, true]),
        (date: 18, scheduleArr:[true, false, true, false, true, true, true]),
        (date: 19, scheduleArr:[false, true, true, false, true, true, false]),
        (date: 20, scheduleArr:[true, true, false, true, true, true, true]),
        (date: 21, scheduleArr:[true, false, true, false, true, true, true]),
        (date: 22, scheduleArr:[true, true, true, true, true, true, true]),
        (date: 23, scheduleArr:[true, true, true, true, false, true, true]),
        (date: 24, scheduleArr:[true, true, true, true, true, true, true]),
        (date: 25, scheduleArr:[true, false, false, true, false, true, true]),
        (date: 26, scheduleArr:[false, true, false, true, true, true, false]),
        (date: 27, scheduleArr:[true, true, true, true, true, true, true]),
        (date: 28, scheduleArr:[false, false, false, false, false, false, true]),
        (date: 29, scheduleArr:[true, false, true, true, false, false, true]),
        (date: 30, scheduleArr:[false, true, false, true, true, true, true])]

    var shouldShowDaysOut = true
    var animationFinished = true
    var lockDotMarker = false
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearButtonSelection()
        
        monthLabel.text = CVDate(date: NSDate()).globalDescription
        updateScheduleButtonWithCurrentDay()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        calendarView.commitCalendarViewUpdate()
        menuView.commitMenuViewUpdate()
        
        //Get intial Button layout correct
        //updateScheduleButtons(currentDate)
        
        (self.childViewControllers.last as! PageViewController).parent = self
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ToItinerary" {//let vc = segue.destinationViewController as? MenuViewController {
            
            eventPlannerModel.Time = String(selectedTimeTime);
            if eventPlannerIndex == 0 {
            eventPlannerModel.EventPlanner = "Davis David"
            } else if  eventPlannerIndex == 1 {
            eventPlannerModel.EventPlanner = "Mays Blazfield"
            } else if eventPlannerIndex == 2 {
            eventPlannerModel.EventPlanner = "Fredrick Phineas"
            }
            eventPlannerModel.Date = currentData;
            
            if let vc = segue.sourceViewController as? MenuViewController {
                commingFromMenu = true
            } else {
                saveEverythingAsIfUploading()
            }
            
            let navc = segue.destinationViewController as! UINavigationController
            let hotelListVC = navc.viewControllers.first as! TableViewController
            hotelListVC.customerModel = customerModel!
            hotelListVC.reservationFullModel = reservationFullModel!
        }
        if let vc = segue.destinationViewController as? MenuViewController {
            vc.customerModel = customerModel
            vc.reservationFullModel = reservationFullModel!
        }
    }
    
    func saveEverythingAsIfUploading( ) {
        if let _ = hotelModel as! HotelModel! {
            reservationFullModel?.hotelModel.append(hotelModel!)
            reservationFullModel?.cateringModel.append(cateringModel!)
            reservationFullModel?.reservationModel.append(reservationModel!)
            reservationFullModel?.equipmentForReservation.append(equipmentForReservation!)
            reservationFullModel?.eventPlannerModel.append(eventPlannerModel)
            reservationFullModel?.meetingRoomModel.append(meetingRoomModel!)
        }
        
        //reservationFullModel?.addReservation(hotelModel!, cM: cateringModel!, rM: reservationModel!, eR: equipmentForReservation!, ePM: eventPlannerModel)
    }
    
    //Button Action Targets
    @IBAction func mornButton1(sender: AnyObject) {
        clearButtonSelection()
        mornButton1.tintColor = UIColor.redColor()
        selectedTime = 0
        selectedTimeTime = (mornButton1.titleLabel?.text)!
    }
    @IBAction func mornButton2(sender: AnyObject) {
        clearButtonSelection()
        mornButton2.tintColor = UIColor.redColor()
        selectedTime = 1
        selectedTimeTime = (mornButton1.titleLabel?.text)!
    }
    @IBAction func mornButton3(sender: AnyObject) {
        clearButtonSelection()
        mornButton3.tintColor = UIColor.redColor()
        selectedTime = 2
        selectedTimeTime = (mornButton1.titleLabel?.text)!
    }
    @IBAction func aftButton1(sender: AnyObject) {
        clearButtonSelection()
        aftButton1.tintColor = UIColor.redColor()
        selectedTime = 3
        selectedTimeTime = (mornButton1.titleLabel?.text)!
    }
    @IBAction func aftButton2(sender: AnyObject) {
        clearButtonSelection()
        aftButton2.tintColor = UIColor.redColor()
        selectedTime = 4
        selectedTimeTime = (mornButton1.titleLabel?.text)!
    }
    @IBAction func eveButton1(sender: AnyObject) {
        clearButtonSelection()
        eveButton1.tintColor = UIColor.redColor()
        selectedTime = 5
        selectedTimeTime = (mornButton1.titleLabel?.text)!
    }
    @IBAction func eveButton2(sender: AnyObject) {
        clearButtonSelection()
        eveButton2.tintColor = UIColor.redColor()
        selectedTime = 6
        selectedTimeTime = (mornButton1.titleLabel?.text)!
    }
    
    func clearButtonSelection() {
        selectedTime = -1
        mornButton1.tintColor = UIColor(red: 109/255, green: 110/256, blue: 113/255, alpha: 1)
        mornButton2.tintColor = UIColor(red: 109/255, green: 110/256, blue: 113/255, alpha: 1)
        mornButton3.tintColor = UIColor(red: 109/255, green: 110/256, blue: 113/255, alpha: 1)
        aftButton1.tintColor = UIColor(red: 109/255, green: 110/256, blue: 113/255, alpha: 1)
        aftButton2.tintColor = UIColor(red: 109/255, green: 110/256, blue: 113/255, alpha: 1)
        eveButton1.tintColor = UIColor(red: 109/255, green: 110/256, blue: 113/255, alpha: 1)
        eveButton2.tintColor = UIColor(red: 109/255, green: 110/256, blue: 113/255, alpha: 1)
    }
    
    func updateScheduleButtonWithCurrentDay() {
        updateScheduleButtons(NSCalendar.currentCalendar().components(.Day, fromDate: NSDate()).day)
    }
    
    func updateScheduleButtons(dayView: Int) {
        let day = dayView-1//(dayView.date.day)-1
        currentDate = day+1
        noMorningTimes.hidden = true

        if(schedule[day].scheduleArr[0] || schedule[day].scheduleArr[1] || schedule[day].scheduleArr[2]) {
            //Morning
            var morningTimes = 0
            mornButton1.hidden = true
            mornButton2.hidden = true
            mornButton3.hidden = true
            if schedule[day].scheduleArr[0] {
                morningTimes+=1
                mornButton1.setTitle("8:00a", forState: UIControlState.Normal)
                mornButton1.hidden = false
            }
            if schedule[day].scheduleArr[1] {
                morningTimes+=1
                if morningTimes == 2 {
                    mornButton2.setTitle("9:30a", forState: UIControlState.Normal)
                    mornButton2.hidden = false
                } else if morningTimes == 1 {
                    mornButton1.setTitle("9:30a", forState: UIControlState.Normal)
                    mornButton1.hidden = false
                }
            }
            if schedule[day].scheduleArr[2] {
                morningTimes+=1
                if morningTimes == 3 {
                    mornButton3.setTitle("11:00a", forState: UIControlState.Normal)
                    mornButton3.hidden = false
                } else if morningTimes == 2 {
                    mornButton2.setTitle("11:00a", forState: UIControlState.Normal)
                    mornButton2.hidden = false
                } else if morningTimes == 1 {
                    mornButton1.setTitle("11:00a", forState: UIControlState.Normal)
                    mornButton1.hidden = false
                }
            }
            if morningTimes == 0 {
                mornButton1.hidden = true
                mornButton2.hidden = true
                mornButton3.hidden = true
                
            } else if morningTimes == 1 {
                mornButton2.hidden = true
                mornButton3.hidden = true
                
            } else if morningTimes == 2 {
                mornButton3.hidden = true
                
            }
        }
        else {
            mornButton1.hidden = true
            mornButton2.hidden = true
            mornButton3.hidden = true
            noMorningTimes.hidden = false
        }
        noAfternoonTimes.hidden = true
        aftButton1.hidden = true
        aftButton2.hidden = true
        if(schedule[day].scheduleArr[3] || schedule[day].scheduleArr[4]) {
            //Afternoon
            var afternoonTimes = 0
            if schedule[day].scheduleArr[3] {
                afternoonTimes+=1
                aftButton1.setTitle("2:00p", forState: UIControlState.Normal)
                aftButton1.hidden = false
            }
            if schedule[day].scheduleArr[4] {
                afternoonTimes+=1
                if afternoonTimes == 2 {
                    aftButton2.setTitle("3:30p", forState: UIControlState.Normal)
                    aftButton2.hidden = false
                } else if afternoonTimes == 1 {
                    aftButton1.setTitle("3:30p", forState: UIControlState.Normal)
                    aftButton1.hidden = false
                }
            }
            if afternoonTimes == 0 {
                aftButton1.hidden = true
                aftButton2.hidden = true
                
            } else if afternoonTimes == 1 {
                aftButton2.hidden = true
            }
        } else {
            aftButton1.hidden = true
            aftButton2.hidden = true
            noAfternoonTimes.hidden = false
            
        }
        noEveningTimes.hidden = true
        eveButton1.hidden = true
        eveButton2.hidden = true
        if(schedule[day].scheduleArr[5] || schedule[day].scheduleArr[6]) {
            //Evening
            var eveningTimes = 0
            if schedule[day].scheduleArr[5] {
                eveningTimes+=1
                eveButton1.setTitle("5:00p", forState: UIControlState.Normal)
                eveButton1.hidden = false
            }
            if schedule[day].scheduleArr[6] {
                eveningTimes+=1
                if eveningTimes == 2 {
                    eveButton2.setTitle("7:00p", forState: UIControlState.Normal)
                    eveButton2.hidden = false
                } else if eveningTimes == 1 {
                    eveButton1.setTitle("7:00p", forState: UIControlState.Normal)
                    eveButton1.hidden = false
                }
            }
            if eveningTimes == 0 {
                eveButton1.hidden = true
                eveButton2.hidden = true
                
            } else if eveningTimes == 1 {
                eveButton2.hidden = true
            }
        } else {
            eveButton1.hidden = true
            eveButton2.hidden = true
            noEveningTimes.hidden = false
            
        }

    }
    
    func noEventTimes() {
        mornButton1.hidden = true
        mornButton2.hidden = true
        mornButton3.hidden = true
        noMorningTimes.hidden = false
        aftButton1.hidden = true
        aftButton2.hidden = true
        noAfternoonTimes.hidden = false
        eveButton1.hidden = true
        eveButton2.hidden = true
        noEveningTimes.hidden = false
        selectedTime = -1
    }
}

// MARK: - CVCalendarViewDelegate & CVCalendarMenuViewDelegate

extension CVCalendarViewController: CVCalendarViewDelegate, CVCalendarMenuViewDelegate {
    
    /// Required method to implement!
    func presentationMode() -> CalendarMode {
        return .WeekView
    }
    
    /// Required method to implement!
    func firstWeekday() -> Weekday {
        return .Sunday
    }
    
    // MARK: Optional methods
    
    func shouldShowWeekdaysOut() -> Bool {
        return shouldShowDaysOut
    }
    
    func shouldAnimateResizing() -> Bool {
        return true // Default value is true
    }
    
    func didSelectDayView(dayView: DayView) {
        currentData = dayView.date
        currentDate = dayView.date.day
        print("\(calendarView.presentedDate.commonDescription) is selected!")
        
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Month, .Day], fromDate: NSDate())
        let currMnth = components.month
        let currDay = components.day
        
        if (dayView.date.month == 11 || dayView.date.month == 12) && dayView.date.day < 31 {
            if((dayView.date.month == currMnth && dayView.date.day >= currDay) || dayView.date.month == 12) {
                updateScheduleButtons(dayView.date.day)
                dotMarker(colorOnDayView: dayView)
            } else {
                noEventTimes()
            }
        } else {
            noEventTimes()
        }
    }
    
    func presentedDateUpdated(date: CVDate) {
        currentDate = date.day
        if monthLabel.text != date.globalDescription && self.animationFinished {
            let updatedMonthLabel = UILabel()
            updatedMonthLabel.textColor = monthLabel.textColor
            updatedMonthLabel.font = monthLabel.font
            updatedMonthLabel.textAlignment = .Center
            updatedMonthLabel.text = date.globalDescription
            updatedMonthLabel.sizeToFit()
            updatedMonthLabel.alpha = 0
            updatedMonthLabel.center = self.monthLabel.center
            
            let offset = CGFloat(48)
            updatedMonthLabel.transform = CGAffineTransformMakeTranslation(0, offset)
            updatedMonthLabel.transform = CGAffineTransformMakeScale(1, 0.1)
            
            UIView.animateWithDuration(0.35, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                self.animationFinished = false
                self.monthLabel.transform = CGAffineTransformMakeTranslation(0, -offset)
                self.monthLabel.transform = CGAffineTransformMakeScale(1, 0.1)
                self.monthLabel.alpha = 0
                
                updatedMonthLabel.alpha = 1
                updatedMonthLabel.transform = CGAffineTransformIdentity
                
                }) { _ in
                    
                    self.animationFinished = true
                    self.monthLabel.frame = updatedMonthLabel.frame
                    self.monthLabel.text = updatedMonthLabel.text
                    self.monthLabel.transform = CGAffineTransformIdentity
                    self.monthLabel.alpha = 1
                    updatedMonthLabel.removeFromSuperview()
            }
            
            self.view.insertSubview(updatedMonthLabel, aboveSubview: self.monthLabel)
        }
    }
    
    func topMarker(shouldDisplayOnDayView dayView: CVCalendarDayView) -> Bool {
        return true
    }
    
    func dotMarker(shouldShowOnDayView dayView: CVCalendarDayView) -> Bool {
        let day = dayView.date.day
        let mnth = dayView.date.month
        
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Month, .Day], fromDate: NSDate())
        let currMnth = components.month
        let currDay = components.day
        
        if mnth == 11 || mnth == 12 && day < 31{
            if day == schedule[day-1].date {
                if (mnth == currMnth && day >= currDay) || dayView.date.month == 12 {
                    return true
                }
                return false
            }
        }
        return false
    }
    
    func dotMarkerColor() -> UIColor {
        return UIColor.blueColor()
    }
    
    func dotMarker(colorOnDayView dayView: CVCalendarDayView) -> [UIColor] {
        let day = dayView.date.day - 1
        
        //let red = UIColor(red: 255, green: 0, blue: 0, alpha: 1)
        //let green = UIColor(red: 0, green: 255, blue: 0, alpha: 1)
        let blue = UIColor(red: 0, green: 0, blue: 255, alpha: 1)
        
        var color: [UIColor] = []
        
        //let numberOfDots = 0//Int(arc4random_uniform(3) + 1)
        if(schedule[day].scheduleArr[0] || schedule[day].scheduleArr[1] || schedule[day].scheduleArr[2]) {
            //Morning
            color.append(blue)
        }
        if(schedule[day].scheduleArr[3] || schedule[day].scheduleArr[4]) {
            //Afternoon
            color.append(blue)
        }
        if(schedule[day].scheduleArr[5] || schedule[day].scheduleArr[6]) {
            //Evening
            color.append(blue)
        }
        return color
    }
    
    func dotMarker(shouldMoveOnHighlightingOnDayView dayView: CVCalendarDayView) -> Bool {
        currentDate = dayView.date.day
        return false
    }
    
    func dotMarker(sizeOnDayView dayView: DayView) -> CGFloat {
        return 13
    }
    
    func weekdaySymbolType() -> WeekdaySymbolType {
        return .Short
    }
    
}

// MARK: - CVCalendarViewAppearanceDelegate

extension CVCalendarViewController: CVCalendarViewAppearanceDelegate {
    func dayLabelPresentWeekdayInitallyBold() -> Bool {
        return false
    }
    
    func spaceBetweenDayViews() -> CGFloat {
        return 2
    }
}

// MARK: - IB Actions

extension CVCalendarViewController {
    @IBAction func switchChanged(sender: UISwitch) {
        if sender.on {
            calendarView.changeDaysOutShowingState(false)
            shouldShowDaysOut = true
        } else {
            calendarView.changeDaysOutShowingState(true)
            shouldShowDaysOut = false
        }
    }
    
    @IBAction func todayMonthView() {
        calendarView.toggleCurrentDayView()
    }
    
    /// Switch to WeekView mode.
    @IBAction func toWeekView(sender: AnyObject) {
        calendarView.changeMode(.WeekView)
    }
    
    /// Switch to MonthView mode.
    @IBAction func toMonthView(sender: AnyObject) {
        calendarView.changeMode(.MonthView)
    }
    
    @IBAction func loadPrevious(sender: AnyObject) {
        calendarView.loadPreviousView()
    }
    
    
    @IBAction func loadNext(sender: AnyObject) {
        calendarView.loadNextView()
    }
}

// MARK: - Convenience API Demo

extension CVCalendarViewController {
    func toggleMonthViewWithMonthOffset(offset: Int) {
        let calendar = NSCalendar.currentCalendar()
        let calendarManager = calendarView.manager
        let components = Manager.componentsForDate(NSDate()) // from today
        
        components.month += offset
        
        let resultDate = calendar.dateFromComponents(components)!
        
        self.calendarView.toggleViewWithDate(resultDate)
    }
    
    func didShowNextMonthView(date: NSDate)
    {
        let calendar = NSCalendar.currentCalendar()
        let calendarManager = calendarView.manager
        let components = Manager.componentsForDate(date) // from today
        
        print("Showing Month: \(components.month)")
    }
    
    
    func didShowPreviousMonthView(date: NSDate)
    {
        let calendar = NSCalendar.currentCalendar()
        let calendarManager = calendarView.manager
        let components = Manager.componentsForDate(date) // from today
        
        print("Showing Month: \(components.month)")
    }
    
}