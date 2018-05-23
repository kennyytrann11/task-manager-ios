//
//  ViewController.swift
//  task-manager-ios
//
//  Created by Kenny Tran on 5/9/18.
//  Copyright © 2018 Kenny Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var taskTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTableView.delegate = self
        taskTableView.dataSource = self
        taskTableView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        taskTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskManager.sharedInstance.getTaskCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as!
        TaskTableViewCell
        cell.setUpCell(task: TaskManager.sharedInstance.getTask(index: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @IBAction func filterButton(_ sender: Any) {
        
    }
    
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let task = TaskManager.sharedInstance.getTask(index: indexPath.row)
        var title = task.completed ? "Done" : "Not Done"
        let isComplete = task.completed
        let checkCompletedAction = UITableViewRowAction(style: .normal, title: title) { (_, _) in
            let cellForIndex = tableView.cellForRow(at: indexPath) as! TaskTableViewCell
            TaskManager.sharedInstance.checkComplete(task: task)
            TaskManager.sharedInstance.completed(task)
            if isComplete == true {
                title = "Done"
            } else {
                title = "Not Done"
            }
            tableView.deselectRow(at: indexPath, animated: true)
            tableView.reloadData()
        }
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (_, _) in
            TaskManager.sharedInstance.removeTask(task)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
        return [deleteAction, checkCompletedAction]    }
    
 
    @IBAction func unwindToLibrary(segue: UIStoryboardSegue) {
        
    }

}

    
