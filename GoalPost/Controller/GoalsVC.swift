//
//  GoalsVC.swift
//  GoalPost
//
//  Created by Sanjay Vekariya on 9/1/17.
//  Copyright © 2017 Sanjay Vekariya. All rights reserved.
//

import UIKit

class GoalsVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func addGoalBtnPressed(_ sender: Any) {
        print("Btn was pressed...")
    }
    
}

