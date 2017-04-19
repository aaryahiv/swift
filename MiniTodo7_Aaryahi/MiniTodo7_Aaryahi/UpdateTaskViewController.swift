//
//  UpdateTaskViewController.swift
//  MiniTodo7_Aaryahi
//
//  Created by home MAC on 4/18/17.
//  Copyright © 2017 Nikunj Vaidya - home. All rights reserved.
//

import UIKit

class UpdateTaskViewController: UIViewController {

    
    @IBOutlet weak var myTextField: UITextField!
    
    
    @IBOutlet weak var updateButton: UIButton!
    
    var task: String = ""
    
    var previousVC = ViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTextField.text = task
        updateButton.isEnabled = false

        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func updateClicked(_ sender: Any) {
        let selectedIndex = previousVC.tasks.index(of: task)
        previousVC.tasks[selectedIndex!] = myTextField.text!
        previousVC.myTableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func textFieldAction(_ sender: Any) {
        updateButton.isEnabled = true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
