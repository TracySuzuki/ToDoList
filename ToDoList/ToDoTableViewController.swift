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
    
}

