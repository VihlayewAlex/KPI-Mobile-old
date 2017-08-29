//
//  ScheduleModuleDataManager.swift
//  KPI Mobile
//
//  Created by Alex Vihlayew on 29/08/2017.
//  Copyright © 2017 Alex Vihlayew. All rights reserved.
//

import Foundation

class ScheduleModuleDataManager {
    
    func loadScheduleForGroup(withID ID: Int, withCompletion completion: @escaping ((Schedule?, Error?)->())) {
        ScheduleService.sharedInstance.loadScheduleForGroup(withID: ID) { (schedule, error) in
            print(schedule, error)
            completion(schedule, error)
        }
    }
    
}
