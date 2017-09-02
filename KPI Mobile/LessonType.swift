//
//  LessonType.swift
//  KPI Mobile
//
//  Created by Alex Vihlayew on 02/09/2017.
//  Copyright © 2017 Alex Vihlayew. All rights reserved.
//

import Foundation

enum LessonType: String {
    
    init?(value: Int?) {
        guard let value = value else {
            self.init(rawValue: "?")!
            return
        }
        
        switch value {
        case 0:
            self.init(rawValue: "Лекция")!
        case 1:
            self.init(rawValue: "Практика")!
        case 2:
            self.init(rawValue: "Лабораторная")!
        default:
            print("Unhandled lesson type index")
            return nil
        }
    }
    
    case lecture = "Лекция"
    case practice = "Практика"
    case laboratory = "Лабораторная"
    case undefined = "?"
}
