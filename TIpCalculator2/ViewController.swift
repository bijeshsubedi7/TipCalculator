//
//  ViewController.swift
//  TIpCalculator2
//
//  Created by Bijesh Subedi on 1/23/18.
//  Copyright © 2018 Bijesh Subedi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func enterAmount(_ sender: UIButton) {
        if amountLabel.text == "$ 0.00"{
            if sender.tag != 12{
                amountLabel.text = "$ " + String(sender.tag)
            }
        } else {
            if sender.tag <= 9 {
                amountLabel.text = amountLabel.text! + String(sender.tag)
            } else if sender.tag == 12 {
                let amount: String = amountLabel.text!
                var found : Bool = false
                for chars in amount{
                    if chars == "." {
                        found = true
                    }
                }
                if !found{
                    amountLabel.text = amountLabel.text! + String(".")
                }
            }
        }
    
        let tipPercentage = [0.15, 0.18, 0.20, 0.25]
        var amount:String = amountLabel.text!
        let start = amount.count - 2
        amount = String(amount[amount.index(amount.endIndex, offsetBy: -start)...])
        let bill = Double(amount) ?? 0
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        tipLabel.text = String(format: "+ $ %.2f", tip)
        totalLabel.text = String(format: "$ %.2f", tip + bill)
        print(amount, bill, tip)
        
    }
    @IBAction func clearAmount(_ sender: UIButton) {
        amountLabel.text = "$ 0.00"
        tipLabel.text = "+ $ 0.00"
        totalLabel.text = "$ 0.00"
    }
    
    @IBAction func calculateTip(_ sender: UISegmentedControl) {
        let tipPercentage = [0.15, 0.18, 0.20, 0.25]
        var amount:String = amountLabel.text!
        let start = amount.count - 2
        amount = String(amount[amount.index(amount.endIndex, offsetBy: -start)...])
        let bill = Double(amount) ?? 0
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        tipLabel.text = String(format: "$ %.2f", tip)
        totalLabel.text = String(format: "$ %.2f", tip + bill)
    }
    
}

