//
//  ViewController.swift
//  Part 2 - Calculator
//
//  Created by User on 5/9/19.
//  Copyright © 2019 Unitec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //References - OLD REFERENCES
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
        displayResult.text = "0"
    }
    
    
    //New references
    var currentNumber:Double = 0
    var lastNumber:Double = 0
    var executingCal = false //See if user is performing a calculation
    var operationTag = 0 //Store what operation is going to be performed when user clicks on = in the form of a tag number
    var equalPressed = false

    //Numbers
    @IBAction func selectNumbers(_ sender: UIButton) {
        

        
        //Reset to 0 if equal pressed and /,-,+,* not pressed
//        if (equalPressed == true && displayResult.text != "/" && displayResult.text != "-" && displayResult.text != "*" && displayResult.text != "+" ){
//            equalPressed = false
//            displayResult.text = "0"
//            //Display = the button pressed
//            displayResult.text = displayResult.text! + String(sender.tag-1)
//            currentNumber = Double(displayResult.text!)! //store the display as currentNumber
//        }
        //Used to start from a blank entry instead of 01
        if(displayResult.text == "0"){
            displayResult.text = ""
        }
        if(displayResult.text == "Error - divide by 0\nResult reset to 0"){
            print("Error found")
            displayResult.text = ""
            print(displayResult.text!)
        }
        if (executingCal == true){ //About to perform a calculation as a sign was just pressed
            displayResult.text = String(sender.tag-1) //Set the display to the next set of numbers for calculation
            currentNumber = Double(displayResult.text!)! //Store the current numbers
            executingCal = false
        }
        else{

            //Display = the button pressed
            displayResult.text = displayResult.text! + String(sender.tag-1)
            currentNumber = Double(displayResult.text!)! //store the display as currentNumber
        }
        
        equalPressed = false
    }
    
    //Other buttons - AC, +/-, %, /, x, -, +, =, CE, %
    
    @IBAction func buttons(_ sender: UIButton) {
        
        //If results does not equal "" or button is not AC or = or +/- or CE
        if (displayResult.text != "" && sender.tag != 11 && sender.tag != 16 && sender.tag != 17 && sender.tag != 18){//displayResult.text != "" &&
            
//            if(displayResult.text == "Error"){
//
//            }
            //Error handling - only allow user to only press +,-,*,\ if display != already contain +,-,*,\,Error
            if (displayResult.text != "/" && displayResult.text != "-" && displayResult.text != "*" && displayResult.text != "+" && displayResult.text != "Error - divide by 0\nResult reset to 0"){
                //Store the last number
                lastNumber = Double(displayResult.text!)!
            }

            
            //Set the display to a sign
            if sender.tag == 12{ //Divide
                displayResult.text = "/"
            }else if sender.tag == 13{ //Multiply
                displayResult.text = "*"
            }else if sender.tag == 14{ //Subtract
                displayResult.text = "-"
            }else if sender.tag == 15{ //Addition
                displayResult.text = "+"
            }
            
            operationTag = sender.tag //Store the operation (+,-,*,/) in the form of a tag number
            //We are now about to performCalculations as we just pressed a sign
            executingCal = true
        }
        else if (sender.tag == 17){ //If button pressed is +/-
            print("17 pressed")
            
            //Error handling - only allow user to only press +,-,*,\ if display != already contain +,-,*,\
            if (displayResult.text != "/" && displayResult.text != "-" && displayResult.text != "*" && displayResult.text != "+" && displayResult.text != "Error - divide by 0\nResult reset to 0" && displayResult.text != ""){
                //Convert
                var tempNum = Double(displayResult.text!)!
                if(tempNum >= 1){
                    tempNum *= -1
                    displayResult.text = String(tempNum)
                }else if (tempNum <= -1){
                    tempNum *= -1
                    displayResult.text = String(tempNum)
                }
            }
        }
        else if (sender.tag == 18){ //If button pressed is CE
            print("CE")
            //Error handling - only allow user to press CE if display != already contain "" or divide by zero error message
            var stringLength = displayResult.text!
            //print(stringLength)
            //print(stringLength.count)
            //First character
            var tempFirstString:String = displayResult.text!
            var stringFirst = tempFirstString.prefix(1)//tempFirstString.startIndex
            print("Start index:\(stringFirst)")
            //If -3 remaining for example, reset to 0
            if(stringLength.count == 2 && stringFirst == "-"){
                    print("sucess")
                displayResult.text = "0"
            }
            if(stringLength.count == 1){ // 5 remainig for example, reset to 0
                displayResult.text = "0"
            }
            if (displayResult.text != "" && displayResult.text != "Error - divide by 0\nResult reset to 0" && displayResult.text != "0" && equalPressed != true){
                var tempString:String = displayResult.text!
                //tempString.remove(at: tempString.startIndex)
                tempString.remove(at: tempString.index(before: tempString.endIndex))
                displayResult.text = tempString
                currentNumber = Double(displayResult.text!)! //Store the current numbers ADDED
                //displayResult.text = displayResult.text!.remove(at: displayResult.text!.startIndex)
            }
        }
        else if (sender.tag == 16){ //If button pressed is =
            equalPressed = true
            if operationTag == 12{ //Divide
                if (currentNumber == 0){ //Divide by zero
                    print(currentNumber)
                    displayResult.text = "Error - divide by 0\nResult reset to 0"
                    currentNumber = 0
                    lastNumber = 0
                }else{
                    displayResult.text = String(lastNumber / currentNumber)
                }
            }
            else if operationTag == 13{ //Multiply
                if (lastNumber == 0 || currentNumber == 0){ //error handling 0 - 0
                    print(lastNumber)
                    print(currentNumber)
                    displayResult.text = String(0)
                }else{
                    displayResult.text = String(lastNumber * currentNumber)
                }
            }
            else if operationTag == 14{ //Subtract
                if (lastNumber == 0 && currentNumber == 0){ //error handling 0 - 0
                    print(lastNumber)
                    print(currentNumber)
                    displayResult.text = String(0)
                }else{
                    displayResult.text = String(lastNumber - currentNumber)
                }
            }
            else if operationTag == 15{ //Addition
                if (lastNumber == 0 && currentNumber == 0){ //error handling 0 + 0
                    print(lastNumber)
                    print(currentNumber)
                    displayResult.text = String(0)
                    //equalPressed = true
                }else{
                    displayResult.text = String(lastNumber + currentNumber)
                    //equalPressed = true
                }
            }
        }
        else if (sender.tag == 11){ //If button pressed is AC
            displayResult.text = "0" //added 0
            lastNumber = 0
            currentNumber = 0
            operationTag = 0
            equalPressed = false
        }
    }
    
    //OLD CODE
    
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
//    @IBAction func select0(_ sender: Any) {
//        if(acPressed == true){
//            acPressed = false
//            cl = "0"
//            displayResult.text = cl
//        }else{
//            cl += "0"
//            displayResult.text = cl
//        }
//    }
//    @IBAction func select1(_ sender: Any) {
//
//        if(acPressed == true){
//            acPressed = false
//            cl = "1"
//            displayResult.text = cl
//        }else{
//            cl += "1"
//            displayResult.text = cl
//        }
//    }
//    @IBAction func select2(_ sender: Any) {
//        if(acPressed == true){
//            acPressed = false
//            cl = "2"
//            displayResult.text = cl
//        }else{
//            cl += "2"
//            displayResult.text = cl
//        }
//    }
//    @IBAction func select3(_ sender: Any) {
//        if(acPressed == true){
//            acPressed = false
//            cl = "3"
//            displayResult.text = cl
//        }else{
//            cl += "3"
//            displayResult.text = cl
//        }
//    }
//    @IBAction func select4(_ sender: Any) {
//        if(acPressed == true){
//            acPressed = false
//            cl = "4"
//            displayResult.text = cl
//        }else{
//            cl += "4"
//            displayResult.text = cl
//        }
//    }
//    @IBAction func select5(_ sender: Any) {
//        if(acPressed == true){
//            acPressed = false
//            cl = "5"
//            displayResult.text = cl
//        }else{
//            cl += "5"
//            displayResult.text = cl
//        }
//    }
//    @IBAction func select6(_ sender: Any) {
//        if(acPressed == true){
//            acPressed = false
//            cl = "6"
//            displayResult.text = cl
//        }else{
//            cl += "6"
//            displayResult.text = cl
//        }
//    }
//    @IBAction func select7(_ sender: Any) {
//        if(acPressed == true){
//            acPressed = false
//            cl = "7"
//            displayResult.text = cl
//        }else{
//            cl += "7"
//            displayResult.text = cl
//        }
//    }
//    @IBAction func select8(_ sender: Any) {
//        if(acPressed == true){
//            acPressed = false
//            cl = "8"
//            displayResult.text = cl
//        }else{
//            cl += "8"
//            displayResult.text = cl
//        }
//    }
//    @IBAction func select9(_ sender: Any) {
//        if(acPressed == true){
//            acPressed = false
//            cl = "9"
//            displayResult.text = cl
//        }else{
//            cl += "9"
//            displayResult.text = cl
//        }
//    }
    
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

