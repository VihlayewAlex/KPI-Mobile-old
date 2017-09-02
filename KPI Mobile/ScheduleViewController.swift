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
    
    var activityIndicator: UIActivityIndicatorView?
    var scheduleWeek: ScheduleWeek = .first {
        didSet {
            scheduleTableView.reloadData()
        }
    }
    var scheduleModuleController: ScheduleModuleController?
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLoadingActivityIndicator()
        configureTableView()
        
        scheduleModuleController = ScheduleModuleController(withUserInterface: self)
        scheduleModuleController?.loadScheduleForGroup(withID: Config.groupID)
    }
    
    
    // MARK: - Configuration
    
    func configureTableView() {
        scheduleTableView.delegate = self
        scheduleTableView.dataSource = self
    }
    
    func configureLoadingActivityIndicator() {
        let activityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        activityIndicatorView.hidesWhenStopped = true
        activityIndicator = activityIndicatorView
        let barItem = UIBarButtonItem(customView: activityIndicatorView)
        navigationItem.leftBarButtonItem = barItem
    }
    
    
    // MARK: - Schedule reloading

    func reloadSchedule() {
        scheduleTableView.reloadData()
    }
    
    
    // MARK: - Loading indicator
    
    func startLoadingIndicator() {
        activityIndicator?.startAnimating()
    }
    
    func stopLoadingIndicator() {
        activityIndicator?.stopAnimating()
    }
    

}
