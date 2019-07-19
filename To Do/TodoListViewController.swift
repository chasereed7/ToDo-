//
//  ViewController.swift
//  To Do
//
//  Created by Carter Reed on 7/18/19.
//  Copyright © 2019 Carter Reed. All rights reserved.
//

import UIKit

//MARK Start of code ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

class TodoListViewController: UITableViewController {

    var itemArray = ["Find Mike","Buy Eggos","Destroy Demogorgon"]
    
    //MARK - ViewDidLoad method
    
    override func viewDidLoad() {
        
            super.viewDidLoad()
 
    }


    //MARK - NumberOfRowsInSection Section –––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "ToDoItemCell")
    
            cell.textLabel?.text = itemArray[indexPath.row]

            return cell
    }
    
//MARK - DidSelectRowAt IndexPath METHOD –––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        print(itemArray[indexPath.row])

        
        
        if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        } else {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
        }
        
            tableView.deselectRow(at: indexPath, animated: true)
    }
    
//MARK - ADD BUTTON PRESSED METHOD ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
    
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new To Do item", message: "this will create a new item", preferredStyle: .alert)
    
        let action = UIAlertAction(title: "add item", style: .default) { (action) in
            // what will happen once the user cilcks the add item button on our UIAlert
            
            self.itemArray.append(textField.text!)
            
            self.tableView.reloadData()
            
            print("––––––success!––––––√")
            
        }
        alert.addTextField { (alertTextField) in
            
            alertTextField.placeholder = "Create new Item"
            textField = alertTextField
            
        }
        
        alert.addAction(action)

            self.present(alert, animated: true, completion: nil)
        
    }
    
    
}


//MARK - End of code for now ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
