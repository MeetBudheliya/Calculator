//
//  ViewController.swift
//  Calculator
//
//  Created by MAC on 08/09/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var operation:String = "";
    var performingMath = false
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var pointButton: UIButton!
    @IBAction func numbers(_ sender: UIButton)
    {
        if performingMath == true
        {
            if sender.tag == 17
            {
                label.text = "0" + "."
                pointButton.isEnabled = false
            }
            else
            {
                label.text = String(sender.tag)
            }
            numberOnScreen = Double(label.text!)!
            performingMath = false
        }
        else
        {
            if label.text?.prefix(1) == "0"
            {
                label.text = String(label.text!.dropFirst())
            }
            if sender.tag == 17
            {
                if label.text == ""
                {
                    label.text = "0" + "."
                }
                else
                {
                    label.text = label.text! + "."
                }
                pointButton.isEnabled = false
            }
            else
            {
                label.text = label.text! + String(sender.tag)
            }
            numberOnScreen = Double(label.text!)!
        }
    }
    
    @IBAction func buttons(_ sender: UIButton)
    {
        if label.text != "" && sender.tag != 14 && sender.tag != 16 && sender.tag != 18
        {
            previousNumber = Double(label.text!)!
            if sender.tag == 10
            {
                label.text = "+"
                operation = "+"
            }
            else if sender.tag == 11
            {
                label.text = "-"
                operation = "-"
            }
            else if sender.tag == 12
            {
                label.text = "*"
                operation = "*"
            }
            else if sender.tag == 13
            {
                label.text = "/"
                operation = "/"
            }
            else if sender.tag == 15
            {
                label.text = "%"
                operation = "%"
            }
            performingMath = true
            
        }
        else if  sender.tag == 18
        {
            label.text = "0"
            performingMath = false
            previousNumber = 0
            numberOnScreen = 0
        }
        else if sender.tag == 16
        {
            label.text = String((label.text?.dropLast())!)
        }
        else if sender.tag == 14
        {
            if operation == "+"
            {
                label.text = String(Double(previousNumber) + Double(numberOnScreen))
            }
            
            else if operation ==  "-"
            {
                label.text = String(Double(previousNumber) - Double(numberOnScreen))
            }
            else if operation ==  "*"
            {
                label.text = String(Double(previousNumber) * Double(numberOnScreen))
            }
            else if operation ==  "/"
            {
                label.text = String(Double(previousNumber) / Double(numberOnScreen))
            }
            else if operation ==  "%"
            {
                label.text = String(numberOnScreen / 100)
            }
            else
            {
                label.text = String(numberOnScreen)
            }
            
        }
        pointButton.isEnabled = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
