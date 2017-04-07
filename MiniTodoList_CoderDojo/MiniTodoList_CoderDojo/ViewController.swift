//
//  ViewController.swift
//  MiniTodoList_CoderDojo
//
//  Created by home MAC on 4/4/17.
//  Copyright © 2017 Nikunj Vaidya - home. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var myTextField: UITextField!
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    var tasks: [String] = ["Eat", "Sleep", "Do Homework"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
        
    }
    
    @IBAction func addTaskClicked(_ sender: Any) {
        tasks.append(myTextField.text!)
        myTableView.reloadData()
        myTextField.text = ""
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
        myTableView.reloadData()
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

