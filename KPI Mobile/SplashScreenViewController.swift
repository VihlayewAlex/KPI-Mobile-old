//
//  SplashScreenViewController.swift
//  KPI Mobile
//
//  Created by Alex Vihlayew on 18/08/2017.
//  Copyright © 2017 Alex Vihlayew. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        performSegue(withIdentifier: "scheduleSegue", sender: nil)
    }
}
