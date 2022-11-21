//
//  ViewController.swift
//  Calculator
//
//  Created by Adam Khan on 24/08/2022.
//

import UIKit

class ViewController: UIViewController {
    
    // Computating
    var currentComputation:Float = 0.0
    var number1:Float = 0.0
    var number2:Float = 0.0
    
    //Display
    @IBOutlet weak var Display: UILabel!
    @IBAction func Equals(_ sender: Any) {
        Display.text = "\(currentComputation)"
    }
    @IBAction func Addition(_ sender: Any) {
    }
    @IBAction func Subtraction(_ sender: Any) {
    }
    @IBAction func Multiplication(_ sender: Any) {
    }
    @IBAction func Decimal(_ sender: Any) {
    }
    @IBAction func Zero(_ sender: Any) {
    }
    @IBAction func Three(_ sender: Any) {
    }
    @IBAction func Two(_ sender: Any) {
    }
    @IBAction func One(_ sender: Any) {
    }
    @IBAction func Six(_ sender: Any) {
    }
    @IBAction func Five(_ sender: Any) {
    }
    @IBAction func Four(_ sender: Any) {
    }
    @IBAction func Nine(_ sender: Any) {
    }
    @IBAction func Eight(_ sender: Any) {
    }
    @IBAction func Seven(_ sender: Any) {
    }
    @IBAction func Divide(_ sender: Any) {
    }
    @IBAction func Remainder(_ sender: Any) {
    }
    @IBAction func PositiveNegative(_ sender: Any) {
    }
    @IBAction func ClearButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

