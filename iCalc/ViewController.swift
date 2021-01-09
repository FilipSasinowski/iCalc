//
//  ViewController.swift
//  iCalc
//
//  Created by Filip Sasinowski on 09/01/2021.
//

import UIKit

class ViewController: UIViewController {

    // Label that shows equations outcome aswell as current user's input
    @IBOutlet weak var outcomeLabel: UILabel!
    // strings to store first and second numbers
    var firstNumber : String = "0"
    var secondNumber : String = ""
    // two enums and variables to check for current number aswell as operation
    enum currentNumberValues {
        case first, second
    }
    enum currentOperationValues {
        case divide, multiply, minus, plus, none
    }
    var currentNumber = currentNumberValues.first
    var currentOperation = currentOperationValues.none
    // flag to track if user already did some equation
    var clearFirstNumber : Bool = false
    // flag to track if there already is a comma
    var isThereCommaInFirstNum : Bool = false
    var isThereCommaInSecondNum : Bool = false
    // is current number a negative flags
    var isFirstNumberNegative : Bool = false
    var isSecondNumberNegative : Bool = false
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        outcomeLabel.accessibilityIdentifier = "outcomeLabel"
    }
    //
    /* group of functional buttons */
    // clears current outcome and resets the calc to default state
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        firstNumber = "0"
        secondNumber = ""
        currentOperation = .none
        currentNumber = .first
        clearFirstNumber = false
        isThereCommaInFirstNum = false
        isThereCommaInSecondNum = false
        outcomeLabel.text = firstNumber
    }
    // makes current number the opposite of itself
    @IBAction func oppositeButtonPressed(_ sender: UIButton) {
        switch currentNumber {
        case .first:
            if isFirstNumberNegative {
                isFirstNumberNegative = false
            }
            else{
                isFirstNumberNegative = true
            }
            firstNumber =  String((-1) * (Double(firstNumber) ?? 0))
            outcomeLabel.text = firstNumber
            break
        case .second:
            if isSecondNumberNegative {
                isSecondNumberNegative = false
            }
            else{
                isSecondNumberNegative = true
            }
            secondNumber =  String((-1) * (Double(secondNumber) ?? 0))
            outcomeLabel.text = secondNumber
            break
        }
        
        clearFirstNumber = true
        currentNumber = currentNumberValues.first
        outcomeLabel.text = firstNumber
    }
    // divides current number by 100
    @IBAction func percentButtonPressed(_ sender: UIButton) {
        // check if outcome has digits after coma
        switch currentNumber {
        case .first:
            let firstNumberDiviedBy100 = (Double(firstNumber) ?? 0) / (100)
            if(firstNumberDiviedBy100.isInteger) {
                isThereCommaInFirstNum = false
            }
            else{
                isThereCommaInFirstNum = true
            }
            firstNumber =  String(firstNumberDiviedBy100)
            outcomeLabel.text = firstNumber
            break
        case .second:
            let secondNumberDiviedBy100 = (Double(secondNumber) ?? 0) / (100)
            if(secondNumberDiviedBy100.isInteger) {
                isThereCommaInSecondNum = false
            }
            else{
                isThereCommaInSecondNum = true
            }
            secondNumber =  String(secondNumberDiviedBy100)
            outcomeLabel.text = secondNumber
            break
        }
      
    }
    // marks current operation as divide
    @IBAction func divideButtonPressed(_ sender: UIButton) {
        switchOperation(operation: .divide)
    }
    // ... multipy
    @IBAction func multiplyButtonPressed(_ sender: UIButton) {
        switchOperation(operation: .multiply)
    }
    // ... subtraction
    @IBAction func minusButtonPressed(_ sender: UIButton) {
        switchOperation(operation: .minus)
    }
    // ... addidtion
    @IBAction func plusButtonPressed(_ sender: UIButton) {
        switchOperation(operation: .plus)
 
    }
    
    
    // makes equation with usage of two numbers that user gave and operatio of his choice
    @IBAction func equalsButtonPressed(_ sender: UIButton) {
        let firstNumberInDouble = Double(firstNumber) ?? 0
        let secondNumberInDouble = Double(secondNumber) ?? 0
        var equationOutcome : Double = 0
        currentNumber = .first
        
        switch currentOperation {
        case .divide:
            equationOutcome = (firstNumberInDouble / secondNumberInDouble)
        case .multiply:
            equationOutcome = (firstNumberInDouble * secondNumberInDouble)
        case .minus:
            equationOutcome = (firstNumberInDouble - secondNumberInDouble)
        case .plus:
            equationOutcome = (firstNumberInDouble + secondNumberInDouble)
            break
        case .none:
            break
        }
        
        

        
        // check if outcome has digits after coma
        if(equationOutcome.isInteger) {
            isThereCommaInFirstNum = false
            //in order to get rid of .0 when displaying integer values
            firstNumber = String(format: "%.0f", equationOutcome)
        }
        else{
            isThereCommaInFirstNum = true
            firstNumber = String(equationOutcome)
        }
        // check if outcome is negative number
        if(equationOutcome < 0){
            isFirstNumberNegative = true
        }
        
        clearFirstNumber = true
        currentNumber = currentNumberValues.first
        outcomeLabel.text = firstNumber
    }
    
    /* group of digit buttons */
    @IBAction func buttonNumberZeroPressed(_ sender: UIButton) {
        switch firstNumber {
        case "0":
            firstNumber = ""
            break
        default:
            addDigit(digit: "0")
            break
        }
    }
    @IBAction func buttonNumberOnePressed(_ sender: UIButton) {
       addDigit(digit: "1")
    }
    @IBAction func buttonNumberTwoPressed(_ sender: UIButton) {
        addDigit(digit: "2")
    }
    @IBAction func buttonNumberThreePressed(_ sender: UIButton) {
        addDigit(digit: "3")
    }
    @IBAction func buttonNumberFourPressed(_ sender: UIButton) {
        addDigit(digit: "4")
    }
    @IBAction func buttonNumberFivePressed(_ sender: UIButton) {
        addDigit(digit: "5")
    }
    @IBAction func buttonNumberSixPressed(_ sender: UIButton) {
        addDigit(digit: "6")
    }
    @IBAction func buttonNumberSevenPressed(_ sender: UIButton) {
        addDigit(digit: "7")
    }
    @IBAction func buttonNumberEightPressed(_ sender: UIButton) {
        addDigit(digit: "8")
    }
    @IBAction func buttonNumberNinePressed(_ sender: UIButton) {
        addDigit(digit: "9")
    }
    /* after pressing this button user's digit input goes to the right of the comma */
    @IBAction func commaButtonPressed(_ sender: UIButton) {
        if(clearFirstNumber){
            firstNumber = "0"
            clearFirstNumber = false
        }
        
        
            switch currentNumber {
                case .first:
                    if(isThereCommaInFirstNum == false){
                        firstNumber += "."
                        outcomeLabel.text = firstNumber
                        isThereCommaInFirstNum = true
                    }
                case .second:
                    if(isThereCommaInSecondNum == false){
                        isThereCommaInSecondNum = true
                        if(secondNumber == ""){
                            secondNumber = "0"
                        }
                        secondNumber += "."
                        outcomeLabel.text = secondNumber
                    }
            }
    }
    /* helpful functions */
    func switchOperation(operation : currentOperationValues) {
        secondNumber = ""
        isThereCommaInSecondNum = false
        clearFirstNumber = false
        currentNumber = currentNumberValues.second
        switch operation {
        case .divide:
            currentOperation = currentOperationValues.divide
            break
        case .multiply:
            currentOperation = currentOperationValues.multiply
            break
        case .minus:
            currentOperation = currentOperationValues.minus
            break
        case .plus:
            currentOperation = currentOperationValues.plus
            break
        case .none:
            break
        }
    }
    func addDigit(digit : String) {
        if(firstNumber == "0" || clearFirstNumber){
            firstNumber = ""
            clearFirstNumber = false
        }
        switch currentNumber {
        case .first:
            firstNumber += digit
            outcomeLabel.text! = firstNumber
        case .second:
            secondNumber += digit
            outcomeLabel.text! = secondNumber
        }
    }
}

// exstension of Double Type that helps determine whether its Integer ( ex. 4.0000 ) or not ( ex. 3.5 )
extension Double {
  var isInteger: Bool { rounded() == self }
}
