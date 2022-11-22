//
//  ViewController.swift
//  Calculator2
//
//  Created by Adam Khan on 24/08/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func Nine(_ sender: Any) {
        addtosomeWorkings(value: "9")
    }
    @IBAction func Eight(_ sender: Any) {
        addtosomeWorkings(value: "8")
    }
    @IBAction func Seven(_ sender: Any) {
        addtosomeWorkings(value: "7")
    }
    @IBAction func Six(_ sender: Any) {
        addtosomeWorkings(value: "6")
    }
    @IBAction func Five(_ sender: Any) {
        addtosomeWorkings(value: "5")
    }
    @IBAction func Four(_ sender: Any) {
        addtosomeWorkings(value: "4")
    }
    @IBAction func Three(_ sender: Any) {
        addtosomeWorkings(value: "3")
    }
    @IBAction func Two(_ sender: Any) {
        addtosomeWorkings(value: "2")
    }
    @IBAction func One(_ sender: Any) {
        addtosomeWorkings(value: "1")
    }
    @IBAction func Zero(_ sender: Any) {
        addtosomeWorkings(value: "0")
    }
    @IBAction func Decimal(_ sender: Any) {
        addtosomeWorkings(value: ".")
    }
    @IBAction func Equals(_ sender: Any) {
        
        if validInput(){
            let checkedWorkingForPercent = someWorkings.replacingOccurrences(of:  "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            Answers.text = resultString
        }
        
        else {
            let alert = UIAlertController(title: "Invalid Input ", message: "Bad Input", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Mmm Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }

        
    }
    @IBAction func Addition(_ sender: Any) {
        addtosomeWorkings(value: "+")
    }
    @IBAction func Multiplication(_ sender: Any) {
        addtosomeWorkings(value: "*")
    }
    @IBAction func Subtraction(_ sender: Any) {
        addtosomeWorkings(value: "-")
    }
    @IBAction func Divide(_ sender: Any) {
        addtosomeWorkings(value: "/")
    }
    @IBAction func Remainder(_ sender: Any) {
        addtosomeWorkings(value: "%")
    }
    
    @IBAction func Delete(_ sender: Any) {
        if(!someWorkings .isEmpty){
            someWorkings.removeLast()
            Workings.text = someWorkings
        }
    }
    @IBAction func Clear(_ sender: Any) {
        someWorkings = ""
        Answers.text = ""
        Workings.text = ""
    }
    
    var someWorkings: String = ""
    
    
    @IBOutlet weak var Answers: UILabel!
    @IBOutlet weak var Workings: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func addtosomeWorkings(value:String){
        someWorkings = someWorkings + value
        Workings.text = someWorkings
    }
    
    func formatResult(result:Double) -> String {
        if( result.truncatingRemainder(dividingBy: 1) == 0) {
            return String(format: "%.0f", result)
        }
        else {
            return String(format: "%.2f", result)
        }
    }

    func validInput() -> Bool {
        
        var count: Int = 0
        var funcCharIndex: [Int] = [Int]()
        
        for char in someWorkings {
            if specialCharacter(char: char){
                funcCharIndex.append(count)
            }
            count += 1
        }
        
        for index in funcCharIndex{
            if index == 0 {
                return false
            }
            if index == someWorkings.count - 1 {
                return false
            }
            
            var previous: Int = -1
            
            if previous != -1 && index - previous == 1 {
                return false
            }
            previous = index
        }
        
        return true
    }
    
    func specialCharacter(char: Character) -> Bool {
        if char == "*"{
            return true
        }
        if char == "+"{
            return true
        }
        if char == "÷"{
            return true
        }
        if char == "-"{
            return true
        }
        return false
    }

}

