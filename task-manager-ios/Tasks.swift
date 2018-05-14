//
//  Tasks.swift
//  task-manager-ios
//
//  Created by Kenny Tran on 5/9/18.
//  Copyright © 2018 Kenny Tran. All rights reserved.
//

import Foundation
import RealmSwift

class Tasks: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var desc: String = ""
    @objc dynamic var dueDate: Date = Date()
    @objc dynamic var completed = false
    
    
}
