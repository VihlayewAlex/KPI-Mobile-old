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
            if let lessonNumber = lesson?.lessonNumber {
                lessonNumberLabel.text = String(lessonNumber)
            }
            lessonNameLabel.text = lesson?.discipline.name
            // TODO: Add other data for displaying
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
