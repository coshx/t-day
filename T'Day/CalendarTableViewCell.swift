//
//  CalendarTableViewCell.swift
//  T'Day
//
//  Created by Ben Taitelbaum on 12/18/17.
//  Copyright © 2017 Coshx Labs. All rights reserved.
//

import UIKit

class CalendarTableViewCell : UITableViewCell {
    // MARK: properties    
    @IBOutlet weak var calendarName: UILabel!
    
    func updateCalendarName(_ name: String) -> Void {
        self.calendarName.text = name
    }
}
