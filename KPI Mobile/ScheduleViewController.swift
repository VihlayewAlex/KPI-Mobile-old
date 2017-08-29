//
//  ScheduleViewController.swift
//  KPI Mobile
//
//  Created by Alex Vihlayew on 29/08/2017.
//  Copyright © 2017 Alex Vihlayew. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController, ScheduleViewProtocol {

    
    // MARK: - Outlets
    
    @IBOutlet weak var scheduleTableView: UITableView!
    
    
    // MARK: - Properties
    
    var scheduleModuleController: ScheduleModuleController?
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
        scheduleModuleController = ScheduleModuleController(withUserInterface: self)
        scheduleModuleController?.loadScheduleForGroup(withID: Config.groupID)
    }
    
    func configureTableView() {
        scheduleTableView.delegate = self
        scheduleTableView.dataSource = self
    }

    func reloadSchedule() {
        scheduleTableView.reloadData()
    }
    

    

}
