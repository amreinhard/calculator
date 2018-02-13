//
//  ViewController.swift
//  calculator
//
//  Created by Amanda Reinhard on 2/8/18.
//  Copyright © 2018 Amanda Reinhard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    var lastOperation: CalcOperation = .none
    var lastValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressedNumber(_ sender: Any) {
        if let numberButton = sender as? UIButton, let numberTitle = numberButton.titleLabel?.text, let displayText = display.text {
            if lastOperation != .none, let number = Int(displayText) {
                lastValue = number
//                display.text = "0"
                display.text = numberTitle
            }
            if display.text == "0" {
                display.text = numberTitle
            } else {
                display.text = displayText + numberTitle
            }
        }
    }
    
    @IBAction func allClear(_ sender: Any) {
        lastOperation = .none
        display.text = "0"
        lastValue = 0
    }
    @IBAction func pressedDelete(_ sender: Any) {
        if display.text!.count == 1 {
            display.text = "0"
        } else {
            if let displayText = display.text?.dropLast() {
                display.text = String(displayText)
            }
        }
    }
    @IBAction func pressedOperation(_ sender: Any) {
        if let opButton = sender as? UIButton, let opText = opButton.titleLabel?.text,
            let op = CalcOperation(rawValue: opText), let displayText = display.text, let number = Int(displayText) {
            var result = 0
            if op == .equal{
                switch lastOperation {
                    case .add: result = lastValue + number
                    case .subtract: result = lastValue - number
                    case .multiply: result = lastValue * number
                    case .divide: result = lastValue / number
                    case .modulo: result = lastValue % number
                    default: break
                }
                display.text = String(result)
            }
            lastOperation = op
        }
        
    }
}

enum CalcOperation: String{
    case none
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
    case modulo = "%"
    case positiveOrNegative = "+/-"
    case equal = "="
}
