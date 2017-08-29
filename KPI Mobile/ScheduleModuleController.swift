//
//  ScheduleModuleController.swift
//  KPI Mobile
//
//  Created by Alex Vihlayew on 29/08/2017.
//  Copyright © 2017 Alex Vihlayew. All rights reserved.
//

import Foundation

class ScheduleModuleController {
    
    
    // MARK: - Properties
    
    var userInterface: ScheduleViewProtocol?
    var dataManager: ScheduleModuleDataManager?
    var schedule: Schedule?
    
    
    // MARK: - Initialization
    
    init(withUserInterface userInterface: ScheduleViewProtocol) {
        self.userInterface = userInterface
        self.dataManager = ScheduleModuleDataManager()
    }
    
    
    // MARK: - Methods
    
    func loadScheduleForGroup(withID ID: Int) {
        dataManager?.loadScheduleForGroup(withID: ID, withCompletion: { [weak self] (schedule, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    self?.schedule = schedule
                    self?.userInterface?.reloadSchedule()
                }
            }
        })
    }
    
    func getDaysCount(forWeek targetWeek: ScheduleWeek) -> Int {
        return schedule?.weeks[targetWeek]?.count ?? 0
    }
    
    func getNumberOfLessons(forDay targetDay: ScheduleDay, inWeek targetWeek: ScheduleWeek) -> Int {
        return schedule?.weeks[targetWeek]?[targetDay]?.count ?? 0
    }
    
    func getLessons(forDay targetDay: ScheduleDay, inWeek targetWeek: ScheduleWeek) -> [Lesson]? {
        return schedule?.weeks[targetWeek]?[targetDay]
    }
    
}
