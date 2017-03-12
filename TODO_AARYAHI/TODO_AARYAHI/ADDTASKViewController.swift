//
//  ADDTASKViewController.swift
//  TODO_AARYAHI
//
//  Created by Nikunj Vaidya - home on 3/10/17.
//  Copyright © 2017 Nikunj Vaidya - home. All rights reserved.
//

import UIKit

class ADDTASKViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var isImp: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func addTaskButton(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if textField.text != "" {
            let task = Task(context : context)
            task.name = textField.text
            task.isImportant = isImp.isOn
        } else{
            print("Entering task without name is not acceptable")
        }
        
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
