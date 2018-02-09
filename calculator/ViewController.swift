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
        if let numberButton = sender as? UIButton {
            if lastOperation != .none {
                let number = Int(display.text!)
                lastValue = number!
                display.text = "0"
            }
            display.text! += numberButton.titleLabel!.text!
        }
    }
    
    @IBAction func pressedDelete(_ sender: Any) {
        display.text = String(display.text!.dropLast())
    }
    @IBAction func pressedOperation(_ sender: Any) {
        if let opButton = sender as? UIButton, let op = CalcOperation(rawValue: opButton.titleLabel!.text!) {
            if op == .equal{
                switch lastOperation {
                    case .add:
                    let number = Int(display.text!)
                    display.text = String(lastValue + number!)
                default: break
                }
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
