//
//  Lesson.swift
//  KPI Mobile
//
//  Created by Alex Vihlayew on 29/08/2017.
//  Copyright © 2017 Alex Vihlayew. All rights reserved.
//

import Foundation

struct Lesson {
    
    var lessonNumber: Int
    var discipline: Discipline
    var groups = [Group]()
    var teachers = [Teacher]()
    var rooms = [Room]()
    
}
