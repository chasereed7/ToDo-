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
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        
        print(dataFilePath!)
 
        loadItems()
        
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
            saveItems()
        
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
           
            self.saveItems()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new Item"
            textField = alertTextField
            
        }
        
        alert.addAction(action)

        present(alert, animated: true, completion: nil)
        
    }
    
    func saveItems() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(self.itemArray)
            try data.write(to: self.dataFilePath!)
        } catch {
            print("Error encoding item array\(error)")
        }
        
        self.tableView.reloadData()
    }
    
    func loadItems() {
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
            itemArray = try decoder.decode([Item].self, from: data)
            } catch {
                print("Error decoding item array, \(error).")
                
                
            }
            
        }
        
        }
    
}

