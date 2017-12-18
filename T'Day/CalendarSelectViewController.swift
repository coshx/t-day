//
//  CalendarSelectViewController.swift
//  T'Day
//
//  Created by Ben Taitelbaum on 12/18/17.
//  Copyright © 2017 Coshx Labs. All rights reserved.
//

import UIKit
import EventKit

class CalendarSelectViewController: UIViewController, UITableViewDataSource {

    // MARK: parameters
    @IBOutlet weak var calendarsView: UITableView!
    
    var store: EKEventStore = EKEventStore.init()
    var calendars: [EKCalendar] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        calendarsView.dataSource = self
        self.store = EKEventStore.init()
        store.requestAccess(to: .event) { (success, error) in
            print("got error to events? \(success)")
            self.calendarsView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (calendars.isEmpty) {
            calendars = self.store.calendars(for: .event)
        }
        
        return calendars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CalendarTableViewCell", for: indexPath) as! CalendarTableViewCell
        cell.updateCalendarName(calendars[indexPath.row].title)
        return cell
    }
    
    
}

