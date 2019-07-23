//
//  ViewController.swift
//  To Do
//
//  Created by Carter Reed on 7/18/19.
//  Copyright © 2019 Carter Reed. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Buy Eggos"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Destroy Demogorgon"
        itemArray.append(newItem3)
 
        if let items = defaults.array(forKey: "ToDoListArray") as? [Item] {
            itemArray = items
        }
    }

    //MARK - NumberOfRowsInSection Section –––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = itemArray[indexPath.row]
        
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "ToDoItemCell")
    
        cell.textLabel?.text = item.title

        cell.accessoryType = item.done == true ? .checkmark : .none
        
            return cell
    }
    
//MARK - DidSelectRowAt IndexPath METHOD –––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        print(itemArray[indexPath.row])

        
    itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
            tableView.reloadData()
        
            tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
    
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new To Do item", message: "this will create a new item", preferredStyle: .alert)
    
        let action = UIAlertAction(title: "add item", style: .default) { (action) in
            // what will happen once the user cilcks the add item button on our UIAlert
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
           
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new Item"
            textField = alertTextField
            
        }
        
        
        alert.addAction(action)

        present(alert, animated: true, completion: nil)
        
    }
    
    

}
