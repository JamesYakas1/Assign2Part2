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
    
    //Varaible for a given number that was pressed
    //var tempValue: String = ""
    //Variable for holding the calculation
    //var sum: Int = 0
    
    //array for holding the calculations
    var theCals = [String]()
    //array for holding the total/sub-total
    var theTotals = [String]()
    
    //int for holding a number
    var cl:String = "0"
    
    //has AC been pressed?
    var acPressed:Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //displayResult.text = String(sum)
        theTotals += ["0"]
    }


    
    //Numerical characters
    @IBAction func selectDot(_ sender: Any) {
    }
    @IBAction func select0(_ sender: Any) {
        
    }
    @IBAction func select1(_ sender: Any) {
        //tempValue += "1";
        //displayResult.text = tempValue
        if(acPressed == true){
            acPressed = false
            cl = "1"
            displayResult.text = cl
        }else{
            cl += "1"
            displayResult.text = cl
        }
        
    }
    @IBAction func select2(_ sender: Any) {
        //tempValue += "2";
        //displayResult.text = tempValue
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
        if(theCals.contains("+")){
            var intCl = Int(cl)
            var intTheCals = Int(theCals[0])
            var intTheTotal = Int(theTotals[0])
            print(intCl!,intTheCals!, intTheTotal!)
            var result:Int = intCl! + intTheCals! + intTheTotal!
            var stringResult:String = String(result)
            displayResult.text = stringResult
            
            theCals.removeAll()
            cl = ""
            //theCals.append(stringResult) //send to total array instead
            theTotals.removeAll()
            theTotals.append(stringResult)
            
        }else{
            theCals.append(cl)
            theCals.append("+")
            print(theCals[0], theCals[1])
            cl = ""
            var intTheTotal = Int(theTotals[0])
            var intTheCals = Int(theCals[0])
            var result:Int = intTheTotal! + intTheCals!

            var stringResult:String = String(result)
            displayResult.text = stringResult
            
        }
    }
    
    @IBAction func selectMinus(_ sender: Any) {

    }
    
    @IBAction func selectMultiply(_ sender: Any) {
    }
    
    @IBAction func selectdDivide(_ sender: Any) {
    }
    
    //Equals
    @IBAction func selectEquals(_ sender: Any) {
        //displayResult.text = tempValue
    }
    
    //Clear Entry
    @IBAction func selectCE(_ sender: Any) {
    }
    
    //All clear
    @IBAction func selectAC(_ sender: Any) {
        //tempValue = ""
        //displayResult.text = "";
        acPressed = true;
        cl = "0"
        displayResult.text = cl
    
        
    }
    
    
}

