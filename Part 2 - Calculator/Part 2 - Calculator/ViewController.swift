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
    
    //array for holding the calculations.A calculation is a number and an operation (+,-,*,/). This scenario occurs when the user has entered a number and pressed an operation, sending, "1456" and "+" to the array, for example.
    var theCals = [String]()
    
    //array for holding the total/sub-totalA total/sub-toal is defined as the addition of two numbers for example, such as the addition "123" + "20". "143" would be sent to theTotals array. This keeps track of previous calculations.
    var theTotals = [String]()
    
    //A string, "Calculation line", for holding user number inputs, such as "111".
    var cl:String = "0"
    
    //var tempCl:String = "0"
    
    //has AC been pressed? A bool for identifying if AC has been recently pressed for proceeding logic
    var acPressed:Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //displayResult.text = String(sum)
        theTotals += ["0"] //Set the total as 0, since no calculations have occured.
    }

    //Numbers
    @IBAction func selectNumbers(_ sender: UIButton) {
        
        displayResult.text = displayResult.text! + String(sender.tag-1)
    }
    
    
    
    //Numerical characters
    @IBAction func selectDot(_ sender: Any) {
        if(acPressed == true){
            acPressed = false
            cl = "."
            displayResult.text = cl
        }else{
            cl += "."
            displayResult.text = cl
        }
    }
    @IBAction func select0(_ sender: Any) {
        if(acPressed == true){
            acPressed = false
            cl = "0"
            displayResult.text = cl
        }else{
            cl += "0"
            displayResult.text = cl
        }
    }
    @IBAction func select1(_ sender: Any) {

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
        if(acPressed == true){
            acPressed = false
            cl = "2"
            displayResult.text = cl
        }else{
            cl += "2"
            displayResult.text = cl
        }
    }
    @IBAction func select3(_ sender: Any) {
        if(acPressed == true){
            acPressed = false
            cl = "3"
            displayResult.text = cl
        }else{
            cl += "3"
            displayResult.text = cl
        }
    }
    @IBAction func select4(_ sender: Any) {
        if(acPressed == true){
            acPressed = false
            cl = "4"
            displayResult.text = cl
        }else{
            cl += "4"
            displayResult.text = cl
        }
    }
    @IBAction func select5(_ sender: Any) {
        if(acPressed == true){
            acPressed = false
            cl = "5"
            displayResult.text = cl
        }else{
            cl += "5"
            displayResult.text = cl
        }
    }
    @IBAction func select6(_ sender: Any) {
        if(acPressed == true){
            acPressed = false
            cl = "6"
            displayResult.text = cl
        }else{
            cl += "6"
            displayResult.text = cl
        }
    }
    @IBAction func select7(_ sender: Any) {
        if(acPressed == true){
            acPressed = false
            cl = "7"
            displayResult.text = cl
        }else{
            cl += "7"
            displayResult.text = cl
        }
    }
    @IBAction func select8(_ sender: Any) {
        if(acPressed == true){
            acPressed = false
            cl = "8"
            displayResult.text = cl
        }else{
            cl += "8"
            displayResult.text = cl
        }
    }
    @IBAction func select9(_ sender: Any) {
        if(acPressed == true){
            acPressed = false
            cl = "9"
            displayResult.text = cl
        }else{
            cl += "9"
            displayResult.text = cl
        }
    }
    
    //Divide, multiply, minus and plus
    
    @IBAction func selectPlus(_ sender: Any) {
        if(theCals.contains("+") || theCals.contains("-")  || theCals.contains("*")
            || theCals.contains("/")){ //If theCals already contains a number and a +
                if(theCals.contains("+")) {
                    
                
                let intCl = Double(cl) ?? 0 //Set to 0 if user presses the + button twice.
                let intTheCals = Double(theCals[0]) ?? 0 //Set to 0 if user presses the + button twice.
                let intTheTotal = Double(theTotals[0])
                print("cl:\(intCl), theCals:\(intTheCals), theTotal:\(intTheTotal!)")
                let result:Double = (intTheCals + intTheTotal!) + intCl //intCl + intTheCals + intTheTotal! //Sum the current input, the cals, and previous total.
                let stringResult:String = String(result)
                displayResult.text = stringResult
                
                //Reset theCals array, the current cl and add the current total to the total array for further usage.
                theCals.removeAll()
                cl = ""
                //theCals.append(stringResult) //send to total array instead
                theTotals.removeAll()
                theTotals.append(stringResult)
                print("cl:\(cl), theCals:EmptyArray, theTotal:\(theTotals[0])")
                }
            
        }else{ //If theCals is blank
            //Add the cl and operation sign to the calcuations array then reset the cl.
            print("CL value:\(cl)")
            theCals.append(cl)
            theCals.append("+")
            print("theCals[0]:\(theCals[0]), theCals[1]:\(theCals[1])")
            cl = ""
            
            
            let intTheTotal = Double(theTotals[0])
            let intTheCals = Double(theCals[0]) ?? 0 //Set to 0 if user presses the + button twice.
            let result:Double = intTheTotal! + intTheCals //Sum the total and theCals
            
            let stringResult:String = String(result)
            displayResult.text = stringResult
        }
    }
    
    @IBAction func selectMinus(_ sender: Any) {

    }
    
    @IBAction func selectMultiply(_ sender: Any) {
        if(theCals.contains("+") || theCals.contains("-")  || theCals.contains("*")
            || theCals.contains("/")){ //If theCals already contains a number and a +
            if(theCals.contains("+")) {
                
                let intCl = Double(cl) ?? 0 //Set to 0 if user presses the + button twice.
                let intTheCals = Double(theCals[0]) ?? 0 //Set to 0 if user presses the + button twice.
                let intTheTotal = Double(theTotals[0])
                print("cl:\(intCl), theCals:\(intTheCals), theTotal:\(intTheTotal!)")
                let result:Double = (intTheCals + intTheTotal!) + intCl //intCl + intTheCals + intTheTotal! //Sum the current input, the cals, and previous total.
                let stringResult:String = String(result)
                displayResult.text = stringResult
                
                //Reset theCals array, the current cl and add the current total to the total array for further usage.
                theCals.removeAll()
                cl = ""
                //theCals.append(stringResult) //send to total array instead
                theTotals.removeAll()
                theTotals.append(stringResult)
                print("cl:\(cl), theCals:EmptyArray, theTotal:\(theTotals[0])")
            }
            if(theCals.contains("*")) {
                
                let intCl = Double(cl) ?? 0 //Set to 0 if user presses the + button twice.
                let intTheCals = Double(theCals[0]) ?? 0 //Set to 0 if user presses the + button twice.
                let intTheTotal = Double(theTotals[0])
                print("cl:\(intCl), theCals:\(intTheCals), theTotal:\(intTheTotal!)")
                let result:Double = (intTheCals + intTheTotal!) * intCl //intCl + intTheCals + intTheTotal! //Sum the current input, the cals, and previous total.
                let stringResult:String = String(result)
                displayResult.text = stringResult
                
                //Reset theCals array, the current cl and add the current total to the total array for further usage.
                theCals.removeAll()
                cl = ""
                //theCals.append(stringResult) //send to total array instead
                theTotals.removeAll()
                theTotals.append(stringResult)
                print("cl:\(cl), theCals:EmptyArray, theTotal:\(theTotals[0])")
            }
            
        }else{ //If theCals is blank
            //Add the cl and operation sign to the calcuations array then reset the cl.
            print("CL value:\(cl)")
            theCals.append(cl)
            theCals.append("*")
            print("theCals[0]:\(theCals[0]), theCals[1]:\(theCals[1])")
            cl = ""
            
            
            let intTheTotal = Double(theTotals[0])
            let intTheCals = Double(theCals[0]) ?? 0 //Set to 0 if user presses the + button twice.
            let result:Double = intTheTotal! + intTheCals //Sum the total and theCals
            
            let stringResult:String = String(result)
            displayResult.text = stringResult
        }
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
        acPressed = true;
        
        //Reset the cl, theCals and theTotals.
        cl = "0"
        theCals.removeAll()
        theTotals.removeAll()
        theTotals += ["0"]
        
        //Display the cl("0")
        displayResult.text = cl
    }
    
    
}

