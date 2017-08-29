//
//  ScheduleJSONSerializer.swift
//  KPI Mobile
//
//  Created by Alex Vihlayew on 29/08/2017.
//  Copyright © 2017 Alex Vihlayew. All rights reserved.
//

import Foundation

class ScheduleJSONSerializer {
    
    class func getSchedule(fromJsonObject json: [String: Any]) -> Schedule? {
        var schedule = Schedule()
        
        if let data = json["data"] as? [String: Any] {
            
            for (weekKey, weekData) in data {
                if let week = ScheduleWeek(string: weekKey) {
                    var days = [ScheduleDay: [Lesson]]()
                    
                    if let daysDict = weekData as? [String: Any] {
                        
                        for (dayKey, dayData) in daysDict {
                            if let day = ScheduleDay(string: dayKey) {
                                if let dayData = dayData as? [String: Any], let daySchedule = getDaySchedule(fromJsonObject: dayData) {
                                    
                                    days[day] = daySchedule
                                    
                                }
                                
                            }
                        }
                        
                    }
                    
                    schedule.weeks[week] = days
                }
            }
            
            return schedule
            
        } else {
            print("Can't get json data")
        }
        
        return nil
    }
    
    class func getDaySchedule(fromJsonObject json: [String: Any]) -> [Lesson]? {
        var lessons = [Lesson]()
        
        for (key, value) in json {
            if let lessonNumber = Int(key), let value = value as? [String: Any] {
                
                if let id = value["id"] as? Int,
                    let disciplineData = value["discipline"] as? [String: Any],
                    let discipline = getDiscipline(fromJsonObject: disciplineData),
                    let groupsData = value["groups"] as? [[String: Any]],
                    let groups = getGroups(fromJsonObjectsArray: groupsData) { // TODO: Add teachers and rooms
                    
                        let type = (value["type"] as? Int) ?? 0 // TODO: FIX default value for type
                        
                        let lesson = Lesson(lessonNumber: lessonNumber, discipline: discipline, groups: [], teachers: [], rooms: [])
                    lessons.append(lesson)
                    
                }
                
            }
        }
        
        return lessons.sorted(by: { (lhs, rhs) -> Bool in
            lhs.lessonNumber < rhs.lessonNumber
        })
    }
    
    class func getDiscipline(fromJsonObject json: [String: Any]) -> Discipline? {
        if let id = json["id"] as? Int, let name = json["name"] as? String, let fullName = json["full_name"] as? String {
            let discipline = Discipline(id: id, name: name, fullName: fullName)
            return discipline
        } else {
            return nil
        }
    }
    
    class func getGroups(fromJsonObjectsArray jsonArr: [[String: Any]]) -> [Group]? {
        var groups = [Group]()
        
        for json in jsonArr {
            if let id = json["id"] as? Int, let name = json["name"] as? String, let okr = json["okr"] as? Int, let type = json["type"] as? Int {
                let group = Group(id: id, name: name, okr: okr, type: type)
                groups.append(group)
            }
        }
        
        return groups
    }
    
}
