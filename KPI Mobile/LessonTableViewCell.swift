//
//  LessonTableViewCell.swift
//  KPI Mobile
//
//  Created by Alex Vihlayew on 29/08/2017.
//  Copyright © 2017 Alex Vihlayew. All rights reserved.
//

import UIKit

class LessonTableViewCell: UITableViewCell {

    
    // MARK: - Outlets
    
    @IBOutlet weak var lessonNumberLabel: UILabel!
    @IBOutlet weak var lessonNameLabel: UILabel!
    @IBOutlet weak var lessonTimeLabel: UILabel!
    @IBOutlet weak var teacherNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    
    // MARK: - Properties
    var lesson: Lesson? {
        didSet {
            guard let lesson = lesson else { return }
            
            lessonNumberLabel.text = String(lesson.lessonNumber) + "."
            lessonTimeLabel.text = lesson.lessonTime
            lessonNameLabel.text = lesson.discipline.name
            teacherNameLabel.text = lesson.teachers.first?.shortNameWithDegree ?? ""
            locationLabel.text = {
                let lessonType = lesson.type.rawValue
                var roomName = (lesson.rooms.first?.name ?? "")
                    if roomName == "" { roomName = "?" }
                var buildingName = (lesson.rooms.first?.building.name ?? "")
                    if buildingName == "" { buildingName = "?" }
                return lessonType + " в " + roomName + "-" + buildingName
            }()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
