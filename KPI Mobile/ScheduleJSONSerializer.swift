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
                                if let dayData = dayData as? [String: Any], let lessons = getLessons(fromJsonObject: dayData) {
                                    days[day] = lessons
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
    
    class func getLessons(fromJsonObject json: [String: Any]) -> [Lesson]? {
        var lessons = [Lesson]()
        
        for (key, value) in json {
            if let lessonNumber = Int(key), let value = value as? [String: Any] {
                
                if let id = value["id"] as? Int,
                    let disciplineData = value["discipline"] as? [String: Any],
                    let discipline = getDiscipline(fromJsonObject: disciplineData),
                    let groupsData = value["groups"] as? [[String: Any]],
                    let groups = getGroups(fromJsonObjectsArray: groupsData),
                    let teachersData = value["teachers"] as? [[String: Any]],
                    let teachers = getTeachers(fromJsonObjectsArray: teachersData),
                    let roomsData = value["rooms"] as? [[String: Any]],
                    let rooms = getRooms(fromJsonObjectsArray: roomsData),
                    let type = LessonType(value: (value["type"] as? Int) ?? 0) {
                    
                        var lessonTime: String!
                        switch lessonNumber {
                        case 1:
                            lessonTime = "8:30"
                        case 2:
                            lessonTime = "10:25"
                        case 3:
                            lessonTime = "12:20"
                        case 4:
                            lessonTime = "14:15"
                        case 5:
                            lessonTime = "16:10"
                        case 6:
                            lessonTime = "18:30"
                        default:
                            lessonTime = "?"
                        }
                    
                    let lesson = Lesson(id: id, type: type, lessonNumber: lessonNumber, lessonTime: lessonTime, discipline: discipline, groups: groups, teachers: teachers, rooms: rooms)
                    lessons.append(lesson)
                    
                }
            }
        }
        
        return lessons.sorted(by: { (lhs, rhs) -> Bool in
            return lhs.lessonNumber < rhs.lessonNumber
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
    
    class func getTeachers(fromJsonObjectsArray jsonArr: [[String: Any]]) -> [Teacher]? {
        var teachers = [Teacher]()
        
        for json in jsonArr {
            if let id = json["id"] as? Int, let firstName = json["first_name"] as? String, let lastName = json["last_name"] as? String, let middleName = json["middle_name"] as? String, let name = json["name"] as? String, let fullName = json["full_name"] as? String, let shortName = json["short_name"] as? String, let shortNameWithDegree = json["short_name_with_degree"] as? String, let degree = json["degree"] as? String {
                let teacher = Teacher(id: id, firstName: firstName, middleName: middleName, lastName: lastName, name: name, fullName: fullName, shortName: shortName, shortNameWithDegree: shortNameWithDegree, degree: degree)
                teachers.append(teacher)
            }
        }
        
        return teachers
    }
    
    class func getRooms(fromJsonObjectsArray jsonArr: [[String: Any]]) -> [Room]? {
        var rooms = [Room]()
        
        for json in jsonArr {
            if let roomID = json["id"] as? Int, let roomName = json["name"] as? String, let buildingData = json["building"] as? [String: Any], let buildingID = buildingData["id"] as? Int, let buildingName = buildingData["name"] as? String, let latitude = buildingData["latitude"] as? Double, let longitude = buildingData["longitude"] as? Double {
                
                let building = Building(id: buildingID, name: buildingName, longitude: longitude, latitude: latitude)
                let room = Room(id: roomID, name: roomName, building: building)
                
                rooms.append(room)
            }
        }
        
        return rooms
    }
    
}
