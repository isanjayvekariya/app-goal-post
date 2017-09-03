//
//  GoalsVC.swift
//  GoalPost
//
//  Created by Sanjay Vekariya on 9/1/17.
//  Copyright © 2017 Sanjay Vekariya. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class GoalsVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    var goals: [Goal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetch { (success) in
            if success {
                if self.goals.count >= 1 {
                    self.tableView.isHidden = false
                }
            } else {
                self.tableView.isHidden = true
            }
        }
        tableView.reloadData()
    }
    
    @IBAction func addGoalBtnPressed(_ sender: Any) {
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else { return }
        presentDeatail(createGoalVC)
    }
}

extension GoalsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell", for: indexPath) as? GoalCell else { return UITableViewCell() }
        cell.configureCell(goal: goals[indexPath.row])
        return cell
    }
}

extension GoalsVC {
    func fetch(completion: (_ completion: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        
        do {
            goals = try managedContext.fetch(fetchRequest)
            print("Successfully fetched data.")
            completion(true)
        } catch {
            debugPrint("Failed to fech data: \(error.localizedDescription)")
            completion(false)
        }
    }
}

