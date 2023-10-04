//
//  ViewController.swift
//  W3_HW_Simple calculator
//
//  Created by MacBook Pro on 30/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    var mathProc=true
    var currentNumber = "0"
    var currentResult: Double = 0
    var currentOperator = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetCalc()
    }
    
    @IBOutlet weak var lbl_display: UILabel!
    
    func resetCalc() {
        lbl_display.text="0"
        mathProc = true
        currentNumber = "0"
        currentResult = 0
        currentOperator = ""
    }
    
    func updateLabel() {
        let number = Double(currentNumber) ?? 0
            if number == Double(Int(number)) {
                lbl_display.text = String(Int(number))
            } else {
                lbl_display.text = String(number)
            }
        
    }
    
    @IBAction func AddNum(_ sender: UIButton) {
        let num = sender.titleLabel?.text ?? ""
        if mathProc || currentNumber == "0" {
            currentNumber = num
            mathProc = false
        } else {
            currentNumber += num
            }
        updateLabel()
    }
    

    func logic() {
        guard !currentOperator.isEmpty else { return }
        
        let number = Double(currentNumber) ?? 0
        let isNeg = currentNumber.hasPrefix("-")
        
        if currentOperator == "+" {
            currentResult += (isNeg ? -number : number)
        }
        else if currentOperator == "-" {
            currentResult -= (isNeg ? -number : number)
        }
        else if currentOperator == "X" {
            currentResult *= number
        }
        else if currentOperator == "/" {
            if number != 0 {
                currentResult /= number
            } else {
                lbl_display.text = "Error"
                return
            }
        }
        currentNumber = String(currentResult)
        updateLabel()
    }
    
    @IBAction func operatorPressed (_ sender: UIButton) {
        if currentOperator.isEmpty {
            currentResult = Double(currentNumber) ?? 0
        } else {
            logic()
        }
        currentOperator = sender.titleLabel?.text ?? ""
        mathProc = true
    }
        
    @IBAction func btnAC(_ sender: Any) {
        resetCalc()
    }
        
    @IBAction func btnResult(_ sender: Any) {
        logic()
        currentOperator = ""
        mathProc = true
    }
        
    @IBAction func btnPerc(_ sender: Any) {
        if let number = Double(currentNumber) {
            currentNumber = String(number / 100.0)
            updateLabel()
            mathProc = true
        }
    }
        
    @IBAction func btnMinPlus(_ sender: Any) {
        if currentNumber != "0" {
            if currentNumber.hasPrefix("-") {
                currentNumber.removeFirst()
            } else {
                currentNumber = "-" + currentNumber
                }
            updateLabel()
        }
    }
    
    @IBAction func btnClearLast(_ sender: Any) {
        if !currentNumber.isEmpty {
            currentNumber.removeLast()
            if currentNumber.isEmpty || currentNumber == "-" {
                currentNumber = "0"
            }
            updateLabel()
        }
    }

}



