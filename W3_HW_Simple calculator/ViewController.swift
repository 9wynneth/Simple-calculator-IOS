//
//  ViewController.swift
//  W3_HW_Simple calculator
//
//  Created by MacBook Pro on 30/09/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBOutlet weak var lbl_display: UILabel!
    
    var mathProc=true
    
    func AddNumberToInput(number:String){
          var textNumber = String(lbl_display.text!)
            if mathProc == true  {
                textNumber = ""
                mathProc = false
            }
            textNumber = textNumber + number
            lbl_display.text = textNumber
    }
    @IBAction func btn0(_ sender: Any) {
        AddNumberToInput(number: "0")
    }
    @IBAction func btn1(_ sender: Any) {
        AddNumberToInput(number: "1")
    }
    @IBAction func btn2(_ sender: Any) {
        AddNumberToInput(number: "2")
    }
    @IBAction func btn3(_ sender: Any) {
        AddNumberToInput(number: "3")
    }
    @IBAction func btn4(_ sender: Any) {
        AddNumberToInput(number: "4")
    }
    
    @IBAction func btn5(_ sender: Any) {
        AddNumberToInput(number: "5")
    }
    
    @IBAction func btn6(_ sender: Any) {
        AddNumberToInput(number: "6")
    }
    @IBAction func btn7(_ sender: Any) {
        AddNumberToInput(number: "7")
    }
    
    @IBAction func btn8(_ sender: Any) {
        AddNumberToInput(number: "8")
    }
    @IBAction func btn9(_ sender: Any) {
        AddNumberToInput(number: "9")
    }
    
    @IBAction func btnDot(_ sender: Any) {
        AddNumberToInput(number: ".")
    }
    
    @IBAction func btnAC(_ sender: Any) {
        lbl_display.text = "0"
        mathProc = true
    }
    
    
    
    var calcOperator = ""
    var number1:Double?
    
    @IBAction func btnAdd(_ sender: Any) {
        calcOperator = "+"
        number1 = Double(lbl_display.text!)
        mathProc = true
    }
    
    @IBAction func btnMin(_ sender: Any) {
        calcOperator = "-"
        number1 = Double(lbl_display.text!)
        mathProc = true
    }
    
    @IBAction func btnMultiply(_ sender: Any) {
        calcOperator = "*"
        number1 = Double(lbl_display.text!)
        mathProc = true
    }
    
    @IBAction func btnDiv(_ sender: Any) {
        calcOperator = "/"
        number1 = Double(lbl_display.text!)
        mathProc = true
    }
    
    @IBAction func btnResult(_ sender: Any) {
        let number2 = Double(lbl_display.text!)
        var results:Double?
        
        if calcOperator == "+" {
            results = number1! + number2!
            lbl_display.text = String(results!)
            mathProc = true
        }
        else if calcOperator == "-" {
            results = number1! - number2!
            lbl_display.text = String(results!)
            mathProc = true
        }
        else if calcOperator == "*" {
            results = number1! * number2!
            lbl_display.text = String(results!)
            mathProc = true
        }
        else if calcOperator == "/" {
            results = number1! / number2!
            lbl_display.text = String(results!)
            mathProc = true
        }
        
        if results?.truncatingRemainder(dividingBy: 1) == 0 {
                lbl_display.text = String(Int(results!))
            } else {
                // If not a whole number, display as a double
                lbl_display.text = String(results!)
            }

            mathProc = true
    }
    
    @IBAction func btnPerc(_ sender: Any) {
        var number1 = Double(lbl_display.text!)
        number1 = number1!/100.0
        lbl_display.text = String(number1!)
        mathProc = true
    }
    
    @IBAction func btnMinPlus(_ sender: Any) {
        if var number1 = lbl_display.text {
                if number1.first != "-" {
                    number1.insert("-", at: number1.startIndex)
                    lbl_display.text = number1
                } else {
                    number1.remove(at: number1.startIndex)
                    lbl_display.text = number1
                }
            }
    }
    
}

