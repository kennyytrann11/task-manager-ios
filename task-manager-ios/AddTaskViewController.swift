//
//  AddTaskViewController.swift
//  task-manager-ios
//
//  Created by Kenny Tran on 5/9/18.
//  Copyright © 2018 Kenny Tran. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    
    @IBOutlet weak var addTaskTextField: UITextField!
    @IBOutlet weak var addTaskDescTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var tasks = [""]
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tasks[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tasks.count
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        if (addTaskTextField.text?.isEmpty)! {
            let alert = UIAlertController(title: "Error", message: "Please enter a name in", preferredStyle: .alert)
            var action1 = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("OK")
            })
            alert.addAction(action1)
            self.present(alert, animated: true, completion: nil)
        } else {
            let newTask = Tasks()
            newTask.name = addTaskTextField.text!
            newTask.desc = addTaskDescTextField.text!
            newTask.dueDate = datePicker.date
            TaskManager.sharedInstance.addTask(newTask)
            self.performSegue(withIdentifier: "unwindToLibrary", sender: self)

            }
        }
    }
    

