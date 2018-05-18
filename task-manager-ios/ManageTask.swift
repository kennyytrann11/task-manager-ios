//
//  ManageTask.swift
//  task-manager-ios
//
//  Created by Kenny Tran on 5/10/18.
//  Copyright © 2018 Kenny Tran. All rights reserved.
//

import Foundation
import RealmSwift



final class TaskManager {

    static let sharedInstance = TaskManager()

    var tasks : Results<Tasks>!

    private init() {
        tasks = realm.objects(Tasks.self)
    }

    let realm = try! Realm()
    let calendar = Calendar.current


    func addTask(_ task: Tasks) {
        try! realm.write {
            realm.add(task)
        }
    }

    func removeTask(_ task: Tasks){
        try! realm.write {
            realm.delete(task)
        }
    }

    func getTask(index: Int) -> Tasks {
        return tasks[index]

    }

    func getTaskCount() -> Int {
        return tasks.count

    }
    func checkComplete(task: Tasks) {
        try! realm.write {
            if task.completed {
            task.completed = true
                task.dueDate = calendar.date(byAdding: .day, value: 3, to: Date())!
            } else {
                task.completed = false
                task.dueDate = Date()
            }
    }

    


    }
}
