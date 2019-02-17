//
//  CalendarViewController.swift
//  feels
//
//  Created by Carlton Segbefia on 2/16/19.
//  Copyright © 2019 Carlton Segbefia. All rights reserved.
//

import UIKit
import CVCalendar

class CalendarViewController: UIViewController, CVCalendarMenuViewDelegate, CVCalendarViewDelegate, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var menuView: CVCalendarMenuView!
    @IBOutlet weak var calendarView: CVCalendarView!
    @IBOutlet weak var colorTabel: UITableView!
    @IBOutlet weak var monthLabel: UILabel!
    
    var  list : [UIColor] = [UIColor.red]
    
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
        
        //        self.colorTabel.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        colorTabel.delegate = self
        colorTabel.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("MAgic!")
        calendarView.contentController.refreshPresentedMonth()
        colorTabel.reloadData()
    }
    

    func dotMarker(colorOnDayView dayView: DayView) -> [UIColor] {
        let singleton = Singleton.shared
        let day = dayView.date.day
        let  colors = Array((singleton.color(for: day % 8) ?? [UIColor.gray]).suffix(3))
        return colors
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

    func didSelectDayView(_ dayView: DayView, animationDidFinish: Bool) {
        let day = dayView.date.day
        let singleton = Singleton.shared
        if (day % 3) == 1{
            loadDayColors(colors: singleton.color(for: day % 8))
        }
    }
    
    func presentedDateUpdated(_ date: CVDate) {
        monthLabel.text = date.globalDescription
    }
    
    func loadDayColors(colors :  [UIColor]?){
        list = colors ?? [UIColor]()
        colorTabel.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (list.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.backgroundColor = list[indexPath.row]
        return cell
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
