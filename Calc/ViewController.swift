//
//  ViewController.swift
//  Calc
//
//  Created by Виталий Крюков on 06.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func EasyOprations(_ sender: UIButton) {
        operacion = sender.currentTitle!
        memory = current
        print(operacion)
        isSecond = false
        doubeled = false
    }
    
    
    
    @IBOutlet weak var ResultLabel: UILabel!
    var isFirstOperation = true
    var isSecond = false
    var doubeled = false
    var memory: Double = 0
    var second: Double = 0
    var operacion: String = ""
    var current:Double {
        get {
            return Double(ResultLabel.text!)!
        
        }
        set {
            let value = "\(newValue)"
            ResultLabel.text = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray.count > 1 && valueArray[1] == "0" {
                ResultLabel.text = valueArray[0]
            } else {
                ResultLabel.text = "\(newValue)"
            }
            isSecond = false
        }
    
    }
    @IBAction func PressKeyNumberBottom(_ sender: UIButton) {
        let n = sender.currentTitle!
        print(n)
        if isSecond {
            if ((ResultLabel.text?.count)! < 15) {
            ResultLabel.text = ResultLabel.text! + n
            }
        }
        else {
            if ((ResultLabel.text?.count)! < 15) {
            ResultLabel.text = n
            isSecond = true
            }
        }
        
    }
    
    @IBAction func EqualPressed(_ sender: UIButton) {
       if isSecond {
            second = current
        
            if isFirstOperation == false {
                switch operacion {
                case "+":
                    current = memory + second
                    isSecond = false
                case "-":
                    current = memory - second
                    isSecond = false
                case "*":
                    current = memory * second
                    isSecond = false
                case "/":
                    current = memory / second
                    isSecond = false
                default:
                    break
                }
            }
       }
      
        isFirstOperation = false
        doubeled = false
    }
    
    
    @IBAction func Clearbottom(_ sender: UIButton) {
        doubeled = false
        isSecond = false
        memory = 0
        second = 0
        operacion = ""
        current = 0
        ResultLabel.text = "0"
        isFirstOperation = true
    }
    @IBAction func PlusMinusbottom(_ sender: UIButton) {
        current = -current
        if ResultLabel.text == "-0" {
            ResultLabel.text = "0"
        }
    }
    
    @IBAction func Percentbottom(_ sender: UIButton) {
        current = current / 100
    }
    
    @IBAction func Dotbottom(_ sender: UIButton) {
        if isSecond && !doubeled {
            ResultLabel.text = ResultLabel.text! + "."
            doubeled = true
        }
        else if !isSecond && !doubeled {
            ResultLabel.text = "0."
        }
    }
  
}

