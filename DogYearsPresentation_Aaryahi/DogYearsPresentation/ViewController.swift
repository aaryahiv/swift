//
//  ViewController.swift
//  DogYearsPresentation
//
//  Created by Nikunj Vaidya - home on 3/19/17.
//  Copyright © 2017 Nikunj Vaidya - home. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func convertButton(_ sender: Any) {
        let age = Int(ageTextField.text!)
        ageLabel.text = String(age! * 7)
        
    }
    
    

}

