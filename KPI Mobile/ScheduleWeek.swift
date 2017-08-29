//
//  ScheduleWeek.swift
//  KPI Mobile
//
//  Created by Alex Vihlayew on 29/08/2017.
//  Copyright © 2017 Alex Vihlayew. All rights reserved.
//

import Foundation

enum ScheduleWeek: Int {
    
    init?(string: String) {
        if let weekNum = Int(string) {
            self.init(rawValue: weekNum)
        } else {
            return nil
        }
    }
    
    case first = 1
    case second

}
