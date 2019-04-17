//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by student15 on 4/14/19.
//  Copyright © 2019 student15. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var todos = [ToDo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        //Adds the edit button programmatically that places the entire tableView into editing mode, displaying delete buttons to the left of each cell. When tapped the button switches its text from edit to done.
        
        if let savedToDos = ToDo.loadToDos() {
            todos = savedToDos
        } else {
            todos = ToDo.loadSampleToDos()
            //conditional logic to load from the disk
            
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    override func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCellIdentifier") else {
            fatalError("Could not dequeue a cell")
        }
        let todo = todos[indexPath.row]
        cell.textLabel?.text = todo.title
        return cell
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
        //adds swipe to delete functionabilty to the tableViews cells
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            //When the cell is swiped a red delete button appears to the right. Verifies the delete button triggered the method call then delets the model from the array and the view.
        }
    }
    
    @IBAction func unwindToToDoList(segue: UIStoryboardSegue) {
        
    }
    
}

