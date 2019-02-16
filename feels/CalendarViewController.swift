//
//  CalendarViewController.swift
//  feels
//
//  Created by Carlton Segbefia on 2/16/19.
//  Copyright © 2019 Carlton Segbefia. All rights reserved.
//

import UIKit
import CVCalendar

class CalendarViewController: UIViewController, CVCalendarMenuViewDelegate, CVCalendarViewDelegate {

    @IBOutlet weak var menuView: CVCalendarMenuView!
    @IBOutlet weak var calendarView: CVCalendarView!
    
    func presentationMode() -> CalendarMode {
        return .monthView
    }
    
    func firstWeekday() -> Weekday {
        return .monday
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        menuView.commitMenuViewUpdate()
        calendarView.commitCalendarViewUpdate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        
        // Appearance delegate [Unnecessary]
        self.calendarView.calendarAppearanceDelegate = self
        
        // Animator delegate [Unnecessary]
        self.calendarView.animatorDelegate = self
        
        // Menu delegate [Required]
        self.menuView.menuViewDelegate = self
        
        // Calendar delegate [Required]
        self.calendarView.calendarDelegate = self
    }
    
    
    func dotMarker(colorOnDayView dayView: DayView) -> [UIColor] {
        let singleton = Singleton.shared
        let day = dayView.date.day
        return singleton.color(for: day % 8) ?? [UIColor.gray]
    }
    
    func dotMarker(shouldShowOnDayView dayView: DayView) -> Bool {
        let day = dayView.date.day
        
        if (day % 3) == 1{
            return true
        }
        return false
    }

    func dotMarker(sizeOnDayView dayView: DayView) -> CGFloat {
        return 5
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
