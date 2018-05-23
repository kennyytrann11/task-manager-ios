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
    @IBOutlet weak var dateDue: UILabel!
    @IBOutlet weak var isCompleted: UILabel!
    
    var dateString = Date().toString(dateFormat: "yyyy/MMM/dd HH:mm:ss")
    
    func setUpCell(task: Tasks) {
        taskName.text = task.name
        taskDescription.text = task.desc
        dateString = task.dueDate.toString(dateFormat: "yyyy/MMM/dd")
        dateDue.text = dateString
        if task.completed == true {
            taskCompleted.text = "FINISHED"
        } else {
            taskCompleted.text = "Finish by"
        }
        
    }
    
    
}
