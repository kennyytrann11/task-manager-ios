//
//  TaskTableViewCell.swift
//  task-manager-ios
//
//  Created by Kenny Tran on 5/9/18.
//  Copyright © 2018 Kenny Tran. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var taskDescription: UILabel!
    @IBOutlet weak var taskCompleted: UILabel!
    @IBOutlet weak var editTask: UIButton!
    @IBOutlet weak var removeTask: UIButton!
    
    
    func setUpCell(task: Tasks) {
        taskName.text = task.name
        taskDescription.text = task.desc
        if task.completed == true {
            taskCompleted.text = "FINISHED"
        } else {
            taskCompleted.text = "Due in"
        }
        
    }
    
    @IBAction func editTaskButton(_ sender: Any) {
        
    }
    
    @IBAction func removeTaskButton(_ sender: Any) {
        
    }
    
    
    
}
