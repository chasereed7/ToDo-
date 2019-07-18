//
//  ViewController.swift
//  To Do
//
//  Created by Carter Reed on 7/18/19.
//  Copyright © 2019 Carter Reed. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["Find Mike","Buy Eggos","Destroy Demogorgon"]
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

    }


    //MARK - TableView  Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "ToDoItemCell")
    
    cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        print(itemArray[indexPath.row])
        
         tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            
             tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        } else {
            
             tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

