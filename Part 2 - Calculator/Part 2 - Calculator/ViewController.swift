//
//  ViewController.swift
//  Part 2 - Calculator
//
//  Created by User on 5/9/19.
//  Copyright © 2019 Unitec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //References
    @IBOutlet weak var displayResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    //Numerical characters
    @IBAction func selectDot(_ sender: Any) {
    }
    @IBAction func select0(_ sender: Any) {
    }
    @IBAction func select1(_ sender: Any) {
    }
    @IBAction func select2(_ sender: Any) {
    }
    @IBAction func select3(_ sender: Any) {
    }
    @IBAction func select4(_ sender: Any) {
    }
    @IBAction func select5(_ sender: Any) {
    }
    @IBAction func select6(_ sender: Any) {
    }
    @IBAction func select7(_ sender: Any) {
    }
    
    @IBAction func select8(_ sender: Any) {
    }
    @IBAction func select9(_ sender: Any) {
    }
    
    //Divide, multiply, minus and plus
    
    @IBAction func selectPlus(_ sender: Any) {
    }
    
    @IBAction func selectMinus(_ sender: Any) {
    }
    
    @IBAction func selectMultiply(_ sender: Any) {
    }
    
    @IBAction func selectdDivide(_ sender: Any) {
    }
    
    //Equals
    @IBAction func selectEquals(_ sender: Any) {
        displayResult.text = "Equals tapped"
    }
    
    //Clear Entry
    @IBAction func selectCE(_ sender: Any) {
    }
    
    //All clear
    @IBAction func selectAC(_ sender: Any) {
        displayResult.text = "";
    }
    
    
}

