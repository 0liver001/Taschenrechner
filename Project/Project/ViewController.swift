//
//  ViewController.swift
//  Project
//
//  Created by Oliver Kalemba / BBS2H20A on 23.08.21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var equation: UILabel!
    @IBOutlet weak var solution: UILabel!
    
    var num1:Double = 0;
    var num2:Double = 0;
    var cmd = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func pressbutton1(_ sender: UIButton) {
        if (sender.currentTitle == "C") {
            if (equation.text == "0") {
                solution.text = "="
                num1 = 0
                num2 = 0
            } else {
                equation.text = "0"
            }
            return
        }
        if (equation.text == "0") {
            equation.text! = sender.currentTitle!
        } else {
            equation.text! += sender.currentTitle!
        }
    }
    
    @IBAction func div(_ sender: UIButton) {
        if (equation.text == "") { return }
        if (num1 == 0) {
            num1 = Double(equation.text!)!
        } else {
            num2 = Double(equation.text!)!
            solve()
        }
        cmd = sender.currentTitle!
        equation.text = "0"
    }
    
    func solve() {
        switch (cmd) {
            case "+":
                num1 += num2
                break
            case "-":
                num1 -= num2
                break
            case "x":
                num1 *= num2
                break
            case "/":
                if (num1 == 0) { return }
                num1 /= num2
                break
            default:
                break
        }
        solution.text = "= " + String(num1)
    }
    
    @IBAction func solve(_ sender: UIButton) {
        num2 = Double(equation.text!)!
        switch (cmd) {
            case "+":
                num1 += num2
                break
            case "-":
                num1 -= num2
                break
            case "x":
                num1 *= num2
                break
            case "/":
                if (num1 == 0) { return }
                num1 /= num2
                break
            default:
                break
        }
        equation.text = "0"
        solution.text = "= " + String(num1)
        num1 = 0
        num2 = 0
    }
}

