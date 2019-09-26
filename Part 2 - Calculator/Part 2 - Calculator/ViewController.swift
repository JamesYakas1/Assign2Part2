//
//  ViewController.swift
//  Part 2 - Calculator
//
//  Created by User on 5/9/19.
//  Copyright © 2019 Unitec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //A label for displaying the user's input/output on screen
    @IBOutlet weak var displayResult: UILabel!
    
    //A label for dislaying the user's output on screen
    @IBOutlet weak var subTotal: UILabel!

    
    //array for holding the total/sub-totalA total/sub-toal is defined as the addition of two numbers for example, such as the addition "123" + "20". "143" would be sent to theTotals array. This keeps track of previous calculations.
    var theTotals = [String]()
    
    //A string, "Calculation line", for holding user number inputs, such as "111".
    var cl:String = "0"
    

    //has AC been pressed? A bool for identifying if AC has been recently pressed for proceeding logic
    var acPressed:Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Set everything to 0/""
        theTotals += ["0"] //Set the total as 0, since no calculations have occured.
        displayResult.text = "0"
        subTotal.text = ""
    }
    
    
    var currentNumber:Double = 0 //the current number on screen
    var lastNumber:Double = 0 //the last number on screen
    var executingCal = false //See if user is performing a calculation
    var operationTag = 0 //Store what operation is going to be performed when user clicks on = in the form of a tag number
    var equalPressed = false //A bool to determine the state of the = sign

    //Numbers
    @IBAction func selectNumbers(_ sender: UIButton) {
        
        
        //If number pressed after = pressed, then reset theTotal to 0 and reset the operationTag.
        if(equalPressed && displayResult.text != "+" && displayResult.text != "-" && displayResult.text != "*"
            && displayResult.text != "/"){
            operationTag = 0
            theTotals.removeAll()
            //theTotals += [displayResult.text!]
            theTotals += ["0"]
            
        }
        
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
            if(sender.tag == 19){//If . pressed
                displayResult.text =  "0."
            }else{
                displayResult.text = String(sender.tag-1)
            }
            //Set the display to the next set of numbers for calculation
            currentNumber = Double(displayResult.text!)! //Store the current numbers
            executingCal = false
        }
        else{
            //if = pressed
            if (equalPressed == true){
                displayResult.text = ""
            }
            if(sender.tag == 19 && !(displayResult.text?.contains("."))!){ //If . presssed && not already contain a "."
                if (displayResult.text == ""){//If null
                    displayResult.text = displayResult.text! + "0."
                }else{//If not null
                    displayResult.text = displayResult.text! + "."
                }
            }else if (sender.tag != 19){ //If not . pressed
                //Display = the button pressed
                displayResult.text = displayResult.text! + String(sender.tag-1)
            }
            currentNumber = Double(displayResult.text!)! //store the display as currentNumber
        }
        
        equalPressed = false
    }
    
    //Other buttons - AC, +/-, %, /, x, -, +, =, CE, %
    
    @IBAction func buttons(_ sender: UIButton) {
        
        //If results does not equal "" or button is not AC or = or +/- or CE
        if (displayResult.text != "" && sender.tag != 11 && sender.tag != 16 && sender.tag != 17 && sender.tag != 18){//displayResult.text != "" &&
            

            //Error handling - only allow user to only press +,-,*,\ if display != already contain +,-,*,\,Error
            if (displayResult.text != "/" && displayResult.text != "-" && displayResult.text != "*" && displayResult.text != "+" && displayResult.text != "Error - divide by 0\nResult reset to 0"){
                //Store the last number
                lastNumber = Double(displayResult.text!)!
            }
            
            //If number pressed after = pressed, then reset theTotal to 0.
            if(equalPressed){
                operationTag = 0
                theTotals.removeAll()
                //theTotals += [displayResult.text!]
                theTotals += [displayResult.text!]
                print("After equl pressed" + theTotals[0])
                equalPressed = false
            }
            
            if (displayResult.text != "/" && displayResult.text != "-" && displayResult.text != "*" && displayResult.text != "+" && displayResult.text != "Error - divide by 0\nResult reset to 0"){
                
                
                //Set the display to a sign
                if sender.tag == 12{ //Divide
                    //Addition
                    if (operationTag == 15){//Last operation = +
                        //Store temp total
                        var tempTotal:Double = Double(theTotals[0])!
                        
                        //Reset the total
                        theTotals.removeAll()
                        
                        //Do calculation
                        tempTotal += Double(displayResult.text!)!
                        
                        //Append back to total
                        theTotals.append(String(tempTotal))
                        
                        //Display sign
                        displayResult.text = "/"
                        print(theTotals[0])
                    }else if (operationTag == 14){//Last operation = -
                        //Store temp total
                        var tempTotal:Double = Double(theTotals[0])!
                        
                        //Reset the total
                        theTotals.removeAll()
                        
                        //Do calculation
                        tempTotal -= Double(displayResult.text!)!
                        
                        //Append back to total
                        theTotals.append(String(tempTotal))
                        
                        //Display sign
                        displayResult.text = "/"
                        print(theTotals[0])
                    }else if (operationTag == 13){//Last operation = *
                        //Store temp total
                        var tempTotal:Double = Double(theTotals[0])!
                        
                        //Reset the total
                        theTotals.removeAll()
                        
                        //Do calculation
                        tempTotal *= Double(displayResult.text!)!
                        
                        //Append back to total
                        theTotals.append(String(tempTotal))
                        
                        //Display sign
                        displayResult.text = "/"
                        print(theTotals[0])
                    }else if (operationTag == 12){//Last operation = /
                        if(currentNumber == 0){ //Divide by zero.
                            displayResult.text = "Error - divide by 0\nResult reset to 0"
                            subTotal.text = ""
                            operationTag = 0
                            theTotals.removeAll()
                            //theTotals += [displayResult.text!]
                            theTotals += ["0"]
                        }else{
                            //Store temp total
                            var tempTotal:Double = Double(theTotals[0])!
                            
                            //Reset the total
                            theTotals.removeAll()
                            
                            //Do calculation
                            tempTotal /= Double(displayResult.text!)!
                            
                            //Append back to total
                            theTotals.append(String(tempTotal))
                            
                            //Display sign
                            displayResult.text = "/"
                            print(theTotals[0])
                        }
                    }
                    else  {
                        theTotals.removeAll()
                        theTotals += [displayResult.text!]
                        displayResult.text = "/" //Display sign
                        print(theTotals[0])
                    }
                }else if sender.tag == 13{ //Multiply
                    //Addition
                    if (operationTag == 15){//Last operation = +
                        //Store temp total
                        var tempTotal:Double = Double(theTotals[0])!
                        
                        //Reset the total
                        theTotals.removeAll()
                        
                        //Do calculation
                        tempTotal += Double(displayResult.text!)!
                        
                        //Append back to total
                        theTotals.append(String(tempTotal))
                        
                        //Display sign
                        displayResult.text = "*"
                        print(theTotals[0])
                    }else if (operationTag == 14){//Last operation = -
                        //Store temp total
                        var tempTotal:Double = Double(theTotals[0])!
                        
                        //Reset the total
                        theTotals.removeAll()
                        
                        //Do calculation
                        tempTotal -= Double(displayResult.text!)!
                        
                        //Append back to total
                        theTotals.append(String(tempTotal))
                        
                        //Display sign
                        displayResult.text = "*"
                        print(theTotals[0])
                    }else if (operationTag == 13){//Last operation = *
                            //Store temp total
                            var tempTotal:Double = Double(theTotals[0])!
                            
                            //Reset the total
                            theTotals.removeAll()
                            
                            //Do calculation
                            tempTotal *= Double(displayResult.text!)!
                            
                            //Append back to total
                            theTotals.append(String(tempTotal))
                            
                            //Display sign
                            displayResult.text = "*"
                            print(theTotals[0])
                    }else if (operationTag == 12){//Last operation = /
                        if(currentNumber == 0){ //Divide by zero.
                            displayResult.text = "Error - divide by 0\nResult reset to 0"
                            subTotal.text = ""
                            operationTag = 0
                            theTotals.removeAll()
                            //theTotals += [displayResult.text!]
                            theTotals += ["0"]
                        }else{
                            //Store temp total
                            var tempTotal:Double = Double(theTotals[0])!
                            
                            //Reset the total
                            theTotals.removeAll()
                            
                            //Do calculation
                            tempTotal /= Double(displayResult.text!)!
                            
                            //Append back to total
                            theTotals.append(String(tempTotal))
                            
                            //Display sign
                            displayResult.text = "*"
                            print(theTotals[0])
                        }
                    }
                    else  {
                        theTotals.removeAll()
                        theTotals += [displayResult.text!]
                        displayResult.text = "*" //Display sign
                        print(theTotals[0])
                    }
                }else if sender.tag == 14{ //Subtract
                    //Addition
                    if (operationTag == 15){//Last operation = +
                        //Store temp total
                        var tempTotal:Double = Double(theTotals[0])!
                        
                        //Reset the total
                        theTotals.removeAll()
                        
                        //Do calculation
                        tempTotal += Double(displayResult.text!)!
                        
                        //Append back to total
                        theTotals.append(String(tempTotal))
                        
                        //Display sign
                        displayResult.text = "-"
                        print(theTotals[0])
                    }else if (operationTag == 14){//Last operation = -
                        //Store temp total
                        var tempTotal:Double = Double(theTotals[0])!
                        
                        //Reset the total
                        theTotals.removeAll()
                        
                        //Do calculation
                        tempTotal -= Double(displayResult.text!)!
                        
                        //Append back to total
                        theTotals.append(String(tempTotal))
                        
                        //Display sign
                        displayResult.text = "-"
                        print(theTotals[0])
                    }else if (operationTag == 13){//Last operation = *
                        //Store temp total
                        var tempTotal:Double = Double(theTotals[0])!
                        
                        //Reset the total
                        theTotals.removeAll()
                        
                        //Do calculation
                        tempTotal *= Double(displayResult.text!)!
                        
                        //Append back to total
                        theTotals.append(String(tempTotal))
                        
                        //Display sign
                        displayResult.text = "-"
                        print(theTotals[0])
                    }else if (operationTag == 12){//Last operation = /
                        if(currentNumber == 0){ //Divide by zero.
                            displayResult.text = "Error - divide by 0\nResult reset to 0"
                            subTotal.text = ""
                            operationTag = 0
                            theTotals.removeAll()
                            //theTotals += [displayResult.text!]
                            theTotals += ["0"]
                        }else{
                            //Store temp total
                            var tempTotal:Double = Double(theTotals[0])!
                            
                            //Reset the total
                            theTotals.removeAll()
                            
                            //Do calculation
                            tempTotal /= Double(displayResult.text!)!
                            
                            //Append back to total
                            theTotals.append(String(tempTotal))
                            
                            //Display sign
                            displayResult.text = "-"
                            print(theTotals[0])
                        }
                    }
                    else  {
                        theTotals.removeAll()
                        theTotals += [displayResult.text!]
                        displayResult.text = "-" //Display sign
                        print(theTotals[0])
                    }
                }else if sender.tag == 15{ //Addition
                    //Addition
                    if (operationTag == 15){//Last operation = +
                        //Store temp total
                        var tempTotal:Double = Double(theTotals[0])!
                        
                        //Reset the total
                        theTotals.removeAll()
                        
                        //Do calculation
                        tempTotal += Double(displayResult.text!)!
                        
                        //Append back to total
                        theTotals.append(String(tempTotal))
                        
                        //Display sign
                        displayResult.text = "+"
                        print(theTotals[0])
                    }else if (operationTag == 14){//Last operation = -
                        //Store temp total
                        var tempTotal:Double = Double(theTotals[0])!
                        
                        //Reset the total
                        theTotals.removeAll()
                        
                        //Do calculation
                        tempTotal -= Double(displayResult.text!)!
                        
                        //Append back to total
                        theTotals.append(String(tempTotal))
                        
                        //Display sign
                        displayResult.text = "+"
                        print(theTotals[0])
                    }else if (operationTag == 13){//Last operation = *
                        //Store temp total
                        var tempTotal:Double = Double(theTotals[0])!
                        
                        //Reset the total
                        theTotals.removeAll()
                        
                        //Do calculation
                        tempTotal *= Double(displayResult.text!)!
                        
                        //Append back to total
                        theTotals.append(String(tempTotal))
                        
                        //Display sign
                        displayResult.text = "+"
                        print(theTotals[0])
                    }else if (operationTag == 12){//Last operation = /
                        if(currentNumber == 0){ //Divide by zero.
                            displayResult.text = "Error - divide by 0\nResult reset to 0"
                            subTotal.text = ""
                            operationTag = 0
                            theTotals.removeAll()
                            //theTotals += [displayResult.text!]
                            theTotals += ["0"]
                        }else{
                            //Store temp total
                            var tempTotal:Double = Double(theTotals[0])!
                            
                            //Reset the total
                            theTotals.removeAll()
                            
                            //Do calculation
                            tempTotal /= Double(displayResult.text!)!
                            
                            //Append back to total
                            theTotals.append(String(tempTotal))
                            
                            //Display sign
                            displayResult.text = "+"
                            print(theTotals[0])
                        }
                    }
                    else  {
                        theTotals.removeAll()
                        theTotals += [displayResult.text!]
                        displayResult.text = "+" //Display sign
                        print(theTotals[0])
                    }
                    
                    //End of prevent double +,-,/,* //Changes but doesnt display correctly
                }
                
                operationTag = sender.tag //Store the operation (+,-,*,/) in the form of a tag number
                //displayResult.text = String(operationTag)
                //We are now about to performCalculations as we just pressed a sign
                //Subtotal
                if(displayResult.text != "Error - divide by 0\nResult reset to 0"){
                    subTotal.text = "(\(String(theTotals[0])))"
                }
//                subTotal.text = "(\(String(theTotals[0])))"
                executingCal = true
            }//End of prevent double +,-,/,* doesn't change but displays correctly
        }
        else if (sender.tag == 17){ //If button pressed is +/-
            print("17 pressed")
            
            //Error handling - only allow user to only press +,-,*,\ if display != already contain +,-,*,\
            if (displayResult.text != "/" && displayResult.text != "-" && displayResult.text != "*" && displayResult.text != "+" && displayResult.text != "Error - divide by 0\nResult reset to 0" && displayResult.text != ""){
                //Convert
                var tempNum = Double(displayResult.text!)!
                if(tempNum > 0){
                    tempNum *= -1
                    displayResult.text = String(tempNum)
                }else if (tempNum < 0){
                    tempNum *= -1
                    displayResult.text = String(tempNum)
                }
                currentNumber = Double(displayResult.text!)! //store the display as currentNumber
            }
        }
        else if (sender.tag == 18){ //If button pressed is CE
            print("CE")
            //Error handling - only allow user to press CE if display != already contain "" or divide by zero error message
            let stringLength = displayResult.text!
            //print(stringLength)
            //print(stringLength.count)
            //First character
            let tempFirstString:String = displayResult.text!
            let stringFirst = tempFirstString.prefix(1)//tempFirstString.startIndex
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
            if(displayResult.text != "+" && displayResult.text != "-" &&
                displayResult.text != "/" &&
                displayResult.text != "*"){
                if operationTag == 12{ //Divide
                    if (currentNumber == 0){ //Divide by zero
                        print(currentNumber)
                        print("= with / 0")
                        displayResult.text = "Error - divide by 0\nResult reset to 0"
                        subTotal.text = ""
                        currentNumber = 0
                        lastNumber = 0
                    }else{
                        //displayResult.text = String(lastNumber / currentNumber)
                        var tempTotal:Double = Double(theTotals[0])!
                        
                        //Reset the total
                        theTotals.removeAll()
                        
                        //Do calculation
                        tempTotal /= Double(displayResult.text!)!
                        
                        //Append back to total
                        theTotals.append(String(tempTotal))
                    }
                }
                else if operationTag == 13{ //Multiply
                    if (lastNumber == 0 || currentNumber == 0){ //error handling 0 - 0
                        print(lastNumber)
                        print(currentNumber)
                        //displayResult.text = String(0)
                    }else{
                        //displayResult.text = String(lastNumber * currentNumber)
                        var tempTotal:Double = Double(theTotals[0])!
                        
                        //Reset the total
                        theTotals.removeAll()
                        
                        //Do calculation
                        tempTotal *= Double(displayResult.text!)!
                        
                        //Append back to total
                        theTotals.append(String(tempTotal))
                    }
                }
                else if operationTag == 14{ //Subtract
                    if (lastNumber == 0 && currentNumber == 0){ //error handling 0 - 0
                        print(lastNumber)
                        print(currentNumber)
                        displayResult.text = String(0)
                    }else{
                        //displayResult.text = String(lastNumber - currentNumber)
                        var tempTotal:Double = Double(theTotals[0])!
                        
                        //Reset the total
                        theTotals.removeAll()
                        
                        //Do calculation
                        tempTotal -= Double(displayResult.text!)!
                        
                        //Append back to total
                        theTotals.append(String(tempTotal))
                    }
                }
                else if operationTag == 15{ //Addition
                    if (lastNumber == 0 && currentNumber == 0){ //error handling 0 + 0
                        print(lastNumber)
                        print(currentNumber)
                        displayResult.text = String(0)
                        //equalPressed = true
                    }else{
                        //displayResult.text = String(lastNumber + currentNumber)
                        var tempTotal:Double = Double(theTotals[0])!
                        
                        //Reset the total
                        theTotals.removeAll()
                        
                        //Do calculation
                        tempTotal += Double(displayResult.text!)!
                        
                        //Append back to total
                        theTotals.append(String(tempTotal))
                    }
                }
                //Display final result
                if(displayResult.text == "Error - divide by 0\nResult reset to 0"){
                    operationTag = 0
                    theTotals.removeAll()
                    theTotals += ["0"]
                }else{
                    displayResult.text = String(theTotals[0])
                }
                
            }//End statement about if = pressed when +,-,*,/ present
            //Clear subtotal from the screen
            subTotal.text = ""
            //If not divide by zero display the total, else display the message by default
            if(displayResult.text != "Error - divide by 0\nResult reset to 0"){
                displayResult.text = theTotals[0]
            }
    
        }
        else if (sender.tag == 11){ //If button pressed is AC
            displayResult.text = "0" //added 0
            lastNumber = 0
            currentNumber = 0
            operationTag = 0
            equalPressed = false
            
            theTotals.removeAll()
            theTotals += ["0"]
            
            subTotal.text = ""
        }
    }
    
}

