//
//  ScheduleDay.swift
//  KPI Mobile
//
//  Created by Alex Vihlayew on 29/08/2017.
//  Copyright © 2017 Alex Vihlayew. All rights reserved.
//

import Foundation

enum ScheduleDay: Int {
    
    init?(string: String) {
        if let dayNum = Int(string) {
            self.init(rawValue: dayNum)
        } else {
            return nil
        }
    }
    
    case monday = 1
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
    
}
