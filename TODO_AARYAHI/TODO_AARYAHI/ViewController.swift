//
//  ViewController.swift
//  TODO_AARYAHI
//
//  Created by Nikunj Vaidya - home on 3/10/17.
//  Copyright © 2017 Nikunj Vaidya - home. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    
    var name1 : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

    }

    
    override func viewWillAppear(_ animated: Bool) {
        //get the data from core data
        getData()
        
        //reload the table view
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let task = tasks[indexPath.row]
        
        
        if task.isImportant{
            cell.textLabel?.text = "🔥 \(task.name!)"
            
            
        } else {
            
            cell.textLabel?.text = task.name!
      
        }
       
        return cell
    }
    
    
    func getData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            try tasks = context.fetch(Task.fetchRequest())
        } catch {
            print("Fetching Failed")
        }
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete {
            let task = tasks[indexPath.row]
            context.delete(task)
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                try tasks = context.fetch(Task.fetchRequest())
            } catch {
                print("Fetching Failed")
            }
            
            tableView.reloadData()
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

