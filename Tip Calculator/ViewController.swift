//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Hackintosh on 12/13/16.
//  Copyright © 2016 Hackintosh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipSegment: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func calculateTIp(sender: AnyObject) {
        let tipPercent = [0, 0.18, 0.2, 0.25]
        
        let billAmount = Double(billField.text!) ?? 0.00
        let tipAmount: Double = billAmount * tipPercent[tipSegment.selectedSegmentIndex]
        let totalAmount: Double = billAmount + tipAmount
        
        tipLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", totalAmount)
    }

}

