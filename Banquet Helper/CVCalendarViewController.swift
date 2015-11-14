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
    

    //@IBOutlet weak var daysOutSwitch: UISwitch!
    
    // Date,      [8, 9:30, 11, 2, 3:30, 5:00, 7:30]
    //              Morning    Afternoon   Evening
    let schedule: [(date:Int, scheduleArr:[Bool])] = [
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
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        monthLabel.text = CVDate(date: NSDate()).globalDescription
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        calendarView.commitCalendarViewUpdate()
        menuView.commitMenuViewUpdate()
        //calendarView.changeMode(.WeekView)
        
    }
    
    //Button Action Targets
    @IBAction func mornButton1(sender: AnyObject) {
    }
    @IBAction func mornButton2(sender: AnyObject) {
    }
    @IBAction func mornButton3(sender: AnyObject) {
    }
    @IBAction func aftButton1(sender: AnyObject) {
    }
    @IBAction func aftButton2(sender: AnyObject) {
    }
    @IBAction func eveButton1(sender: AnyObject) {
    }
    @IBAction func eveButton2(sender: AnyObject) {
    }
    
    func updateScheduleButtons(dayView: CVCalendarDayView) {
        let day = (dayView.date.day)-1
        noMorningTimes.hidden = true
        if(schedule[day].scheduleArr[0] || schedule[day].scheduleArr[1] || schedule[day].scheduleArr[2]) {
            //Morning
            var morningTimes = 0
            if schedule[day].scheduleArr[0] {
                morningTimes+=1
                mornButton1.hidden = false
                mornButton1.setTitle("8:00a", forState: UIControlState.Normal)
                mornButton1.sizeToFit()
            }
            if schedule[day].scheduleArr[1] {
                morningTimes+=1
                if morningTimes == 2 {
                    mornButton2.hidden = false
                    mornButton2.setTitle("9:30a", forState: UIControlState.Normal)
                    mornButton2.autoresizesSubviews = true
                } else if morningTimes == 1 {
                    mornButton1.hidden = false
                    mornButton1.setTitle("9:30a", forState: UIControlState.Normal)
                    mornButton1.sizeToFit()
                }
            }
            if schedule[day].scheduleArr[2] {
                morningTimes+=1
                if morningTimes == 3 {
                    mornButton3.hidden = false
                    mornButton3.setTitle("11:00a", forState: UIControlState.Normal)
                    mornButton3.sizeToFit()
                } else if morningTimes == 2 {
                    mornButton2.hidden = false
                    mornButton2.setTitle("11:00a", forState: UIControlState.Normal)
                    mornButton2.sizeToFit()
                } else if morningTimes == 1 {
                    mornButton1.hidden = false
                    mornButton1.setTitle("11:00a", forState: UIControlState.Normal)
                    mornButton1.sizeToFit()                }
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
        if(schedule[day].scheduleArr[3] || schedule[day].scheduleArr[4]) {
            //Afternoon
            var afternoonTimes = 0
            if schedule[day].scheduleArr[3] {
                afternoonTimes+=1
                aftButton1.hidden = false
                aftButton1.setTitle("2:00p", forState: UIControlState.Normal)
                aftButton1.sizeToFit()
            }
            if schedule[day].scheduleArr[4] {
                afternoonTimes+=1
                if afternoonTimes == 2 {
                    aftButton2.hidden = false
                    aftButton2.setTitle("3:30p", forState: UIControlState.Normal)
                    aftButton2.sizeToFit()
                } else if afternoonTimes == 1 {
                    aftButton1.hidden = false
                    aftButton1.setTitle("3:30p", forState: UIControlState.Normal)
                    aftButton1.sizeToFit()
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
        if(schedule[day].scheduleArr[5] || schedule[day].scheduleArr[6]) {
            //Evening
            var eveningTimes = 0
            if schedule[day].scheduleArr[5] {
                eveningTimes+=1
                eveButton1.hidden = false
                eveButton1.setTitle("5:00p", forState: UIControlState.Normal)
                eveButton1.sizeToFit()
            }
            if schedule[day].scheduleArr[6] {
                eveningTimes+=1
                if eveningTimes == 2 {
                    eveButton2.hidden = false
                    eveButton2.setTitle("7:00p", forState: UIControlState.Normal)
                    eveButton1.sizeToFit()
                } else if eveningTimes == 1 {
                    eveButton1.hidden = false
                    eveButton1.setTitle("7:00p", forState: UIControlState.Normal)
                    eveButton1.sizeToFit()
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
        print("\(calendarView.presentedDate.commonDescription) is selected!")
        
        updateScheduleButtons(dayView)
    }
    
    func didSelectDayView(dayView: CVCalendarDayView, animationDidFinish: Bool) {
        let _ = dayView.date
        print("\(calendarView.presentedDate.commonDescription) is selected!")
        
        updateScheduleButtons(dayView)
    }
    
    func presentedDateUpdated(date: CVDate) {
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
        if mnth == 11 {
            if day == schedule[day-1].date {
                return true
            }
        }
        return false
    }
    
    func dotMarker(colorOnDayView dayView: CVCalendarDayView) -> [UIColor] {
        var day = dayView.date.day
        day-=1;
        
        let red = UIColor(red: 255, green: 0, blue: 0, alpha: 1)
        let green = UIColor(red: 0, green: 255, blue: 0, alpha: 1)
        let blue = UIColor(red: 0, green: 0, blue: 255, alpha: 1)
        
        var color: [UIColor] = []
        
        //let numberOfDots = 0//Int(arc4random_uniform(3) + 1)
        if(schedule[day].scheduleArr[0] && schedule[day].scheduleArr[1] && schedule[day].scheduleArr[2]) {
            //Morning
            color.append(red)
        }
        if(schedule[day].scheduleArr[3] && schedule[day].scheduleArr[4]) {
            //Afternoon
            color.append(green)
        }
        if(schedule[day].scheduleArr[5] && schedule[day].scheduleArr[6]) {
            //Evening
            color.append(blue)
        }
        return color
    }
    
    func dotMarker(shouldMoveOnHighlightingOnDayView dayView: CVCalendarDayView) -> Bool {
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