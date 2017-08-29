//
//  ScheduleViewController+DataSource.swift
//  KPI Mobile
//
//  Created by Alex Vihlayew on 29/08/2017.
//  Copyright © 2017 Alex Vihlayew. All rights reserved.
//

import UIKit

extension ScheduleViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return scheduleModuleController?.getDaysCount(forWeek: .first) ?? 0 // HARDCODE
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scheduleModuleController?.getNumberOfLessons(forDay: ScheduleDay(rawValue: section + 1)!, inWeek: .first) ?? 0 // HARDCODE
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "lessonCell", for: indexPath) as? LessonTableViewCell {
            
            let lessonWeek = ScheduleWeek.first // HARDCODE
            let lessonDay = ScheduleDay(rawValue: indexPath.section + 1)!
            
            let lessonNumber = indexPath.row
            
            cell.lesson = scheduleModuleController?.getLessons(forDay: lessonDay, inWeek: lessonWeek)?[lessonNumber]
            
            return cell
        } else {
            preconditionFailure("Can't get LessonTableViewCell")
        }
    }
    
}
